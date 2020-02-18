//
// Created by prashant on 2/14/20.
//

#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <sensor_msgs/image_encodings.h>

#include <geometry_msgs/TransformStamped.h>

#include <cv_bridge/cv_bridge.h>

#include <opencv2/aruco.hpp>
#include <opencv2/aruco/charuco.hpp>
#include <opencv2/core.hpp>
#include <opencv2/calib3d.hpp>

#include <tf2_ros/transform_broadcaster.h>
#include "tf2_geometry_msgs/tf2_geometry_msgs.h"
#include <tf2_eigen/tf2_eigen.h>
#include <eigen3/Eigen/Dense>

#include <charuco_ros/CharucoCornerMsg.h>

class CharucoBoard{

private:
    cv::Mat inImage, resultImage;
    cv::Mat cameraMatrix, distortionCoeffs;
    bool draw_markers;
    bool draw_axis;
    bool publish_tf;
    bool publish_corners;
    bool cam_info_received;

    int nMarkerDetectThreshold;
    int nMarkers;
    int dictionary_id;

    image_transport::Publisher image_pub;
    ros::Publisher transform_pub;
    ros::Publisher pose_pub;
    ros::Publisher corner_pub;
    ros::Subscriber cam_info_sub;

    double board_scale;
    std::vector< cv::Mat > idcorners;
    std::vector< cv::Mat > idcornerspx;
    std::vector< float> board_ids;

    ros::NodeHandle nh;
    image_transport::ImageTransport it;
    image_transport::Subscriber image_sub;

    cv::Ptr<cv::aruco::CharucoBoard> board;
    cv::Ptr<cv::aruco::Dictionary> dictionary;
    cv::Ptr<cv::aruco::DetectorParameters> detectorParams;

    int x_square;
    int y_square;
    float square_length;
    float marker_length;


public:

    CharucoBoard() : cam_info_received(false),
    nh("~"),
    it(nh),
    nMarkerDetectThreshold(0)    {

        image_sub = it.subscribe("/image", 1, &CharucoBoard::image_callback, this);
        cam_info_sub = nh.subscribe("/camera_info", 1, &CharucoBoard::cam_info_callback, this);

        image_pub = it.advertise("result", 1);
        transform_pub = nh.advertise<geometry_msgs::TransformStamped>("transform", 100);
        pose_pub = nh.advertise<geometry_msgs::PoseStamped>("pose", 100);

        nh.param<float>("marker_length", marker_length, 0.025);
        nh.param<float>("square_length", square_length, 0.05);
        nh.param<int>("x_square", x_square, 6);
        nh.param<int>("y_square", y_square, 4);
        nh.param<int>("num_marker", nMarkers, 15);
        nh.param<int>("dictionary_id", dictionary_id, 0);
        nMarkerDetectThreshold = nMarkers/2;

        nh.param<bool>("draw_markers", draw_markers, true);
        nh.param<bool>("draw_axis", draw_axis, true);
        nh.param<bool>("publish_tf", publish_tf, false);
        nh.param<bool>("publish_corners", publish_corners, true);

        ROS_INFO_STREAM("Initializing " <<x_square << "x" << y_square <<"ChArUco board. Aruco Marker Length " << marker_length << " Chessboard size " << square_length );

        if(publish_corners)
            corner_pub = nh.advertise<charuco_ros::CharucoCornerMsg>("corner",100);
//        cv::aruco::PREDEFINED_DICTIONARY_NAME dictionaryId = cv::aruco::DICT_4X4_50;
        dictionary = cv::aruco::getPredefinedDictionary(cv::aruco::PREDEFINED_DICTIONARY_NAME(dictionary_id));
        detectorParams = cv::aruco::DetectorParameters::create();
        board = cv::aruco::CharucoBoard::create(x_square,y_square,square_length,marker_length,dictionary);
        detectorParams = cv::aruco::DetectorParameters::create();
        detectorParams->doCornerRefinement = true;
        detectorParams->cornerRefinementMaxIterations = 30;
    }

    void image_callback(const sensor_msgs::ImageConstPtr& msg) {

        if(!cam_info_received) return;

        static tf2_ros::TransformBroadcaster br;

        cv_bridge::CvImagePtr cv_ptr;
        try {
            cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::RGB8);
            inImage = cv_ptr->image;

            std::vector< int > ids;
            std::vector< std::vector< cv::Point2f > > corners, rejected;
            cv::Vec3d tvec(0, 0, 1);
            cv::Vec3d rvec(0, 0, 0);
            cv::Mat guessRotMat = (cv::Mat_<double>(3, 3) << 1, 0, 0, 0, 1, 0, 0, 0, 1);
            cv::Rodrigues(guessRotMat, rvec);
            // detect markers
            cv::aruco::detectMarkers(inImage, dictionary, corners, ids, detectorParams, rejected);

            if (ids.size() <= nMarkerDetectThreshold)
                return;

            std::vector<cv::Point2f> charucoCorners;
            std::vector<int> charucoIds;

            cv::aruco::interpolateCornersCharuco(corners, ids, inImage, board, charucoCorners, charucoIds, cameraMatrix, distortionCoeffs);
            cv::aruco::estimatePoseCharucoBoard(charucoCorners, charucoIds, board, cameraMatrix, distortionCoeffs, rvec, tvec);
            cv::Mat rotMat;
            cv::Rodrigues(rvec, rotMat);
            cv::Mat eZ = (cv::Mat_<double>(3, 1) << 0.0, 0.0, 1.0);
            cv::Mat eZ_prime = rotMat*eZ;
            if (tvec[2] < 0) {
                std::cout << "cv::solvePnP converged to invalid transform translation z = " << tvec[2] <<
                          " when, in reality we must assert, z > 0." << std::endl;
                return;
            }

            if (publish_corners){
                charuco_ros::CharucoCornerMsg cornerMsg;
                charuco_ros::OneMarker PixelMsg;
                charuco_ros::OneMarker MetricMsg;
                cornerMsg.header = msg->header;
                for (int i = 0; i < (int) charucoIds.size(); i++)
                {
                    PixelMsg.id = charucoIds[i];
                    PixelMsg.corner.x = charucoCorners[i].x;
                    PixelMsg.corner.y = charucoCorners[i].y;
                    cornerMsg.pixel_corners.push_back(PixelMsg);

                    MetricMsg.id = charucoIds[i];
                    MetricMsg.corner.x = board->chessboardCorners[charucoIds[i]].x;
                    MetricMsg.corner.y = board->chessboardCorners[charucoIds[i]].y;
                    MetricMsg.corner.z = board->chessboardCorners[charucoIds[i]].z;
                    cornerMsg.metric_corners.push_back(MetricMsg);
                }
                corner_pub.publish(cornerMsg);
            }

            Eigen::Affine3d transform_result;
            getTF(rvec, tvec, transform_result);

            geometry_msgs::TransformStamped transform_msg;
            transform_msg = tf2::eigenToTransform(transform_result);
            transform_msg.header.stamp = msg->header.stamp;
            transform_msg.header.frame_id = "charuco_board";
            transform_msg.child_frame_id = msg->header.frame_id;
            transform_pub.publish(transform_msg);

            if (publish_tf)
                br.sendTransform(transform_msg);

            geometry_msgs::PoseStamped poseMsg;
            poseMsg.pose = tf2::toMsg(transform_result);
            poseMsg.header = msg->header;
            pose_pub.publish(poseMsg);

            resultImage = cv_ptr->image.clone();
            if (draw_markers)
                cv::aruco::drawDetectedCornersCharuco(resultImage, charucoCorners, charucoIds, cv::Scalar(255, 0, 0));

            if (draw_axis)
                cv::aruco::drawAxis(resultImage, cameraMatrix, distortionCoeffs, rvec, tvec, 2*square_length);

            if(draw_axis || draw_markers) {
                if (image_pub.getNumSubscribers() > 0) {
                    //show input with augmented information
                    cv_bridge::CvImage out_msg;
                    out_msg.header.frame_id = msg->header.frame_id;
                    out_msg.header.stamp = msg->header.stamp;
                    out_msg.encoding = sensor_msgs::image_encodings::RGB8;
                    out_msg.image = resultImage;
                    image_pub.publish(out_msg.toImageMsg());
                }
            }


        } catch (cv_bridge::Exception& e) {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }
    }

    void cam_info_callback(const sensor_msgs::CameraInfo &msg) {

        if (msg.K[0] == 0) {
            std::cout << msg << std::endl;
            ROS_ERROR("Camera Info message is zero --> Cannot use an uncalibrated camera!");
            return;
        }

        cameraMatrix = cv::Mat::zeros(3, 3, CV_32FC1);
        distortionCoeffs = cv::Mat::zeros(5, 1, CV_32FC1);

        for (int i = 0; i < 9; ++i)
            cameraMatrix.at<float>(i / 3, i % 3) = msg.K[i];

        for (int i = 0; i < 5; ++i)
            distortionCoeffs.at<float>(i, 0) = msg.D[i];

        cam_info_received = true;
        cam_info_sub.shutdown();
    }



    void getTF(const cv::Vec3d &rvec, const cv::Vec3d &tvec, Eigen::Affine3d &board_to_camera){

        cv::Mat rot;
        cv::Rodrigues(rvec, rot);

        board_to_camera.linear() << rot.at<double>(0, 0), rot.at<double>(0, 1), rot.at<double>(0, 2),
                             rot.at<double>(1, 0), rot.at<double>(1, 1), rot.at<double>(1, 2),
                             rot.at<double>(2, 0), rot.at<double>(2, 1), rot.at<double>(2, 2);
        board_to_camera.translation() << tvec(0) , tvec(1), tvec(0) ;

    }
};


int main(int argc, char **argv) {
    ros::init(argc, argv, "charuco_ros");

    CharucoBoard node;

    ros::spin();
}
