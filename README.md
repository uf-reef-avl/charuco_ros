# charuco_ros

A ROS package for 3D pose estimation using Charuco marker boards

## Usage 
roslaunc charuco_ros basic.launch

### Dependencies
cv_bridge<br />
geometry_msgs<br />
image_transport<br />
tf2<br />
tf2_eigen<br />
OpenCV

### Topics Subscripted to:
/image [sensor_msgs/Image]<br />
/camera_info [senor_msgs/CameraInfo]

### Topics Published:
/corner [charuco_ros/CharucoCornerMsg]<br />
/pose [geometry_msgs/PoseStamped]<br />
/result [sensor_msgs/Image]<br />
/transform [geometry_msgs/TransformStamped]<br />
/tf [tf2_msgs/TFMessage]

#### Notes
This node publishes the pixel and metric corners that can be used to solve a PnP problem. This node differs from the ArUco 
node where the corners are the intersection of two black squares of a checkerboard pattern rather than the corners of the 
ArUco marker. Hence, we only have ONE corner rather than 4 in the previous type.

#### TODOs:
