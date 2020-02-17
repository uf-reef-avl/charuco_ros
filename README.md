# charuco_ros

A ROS package for 3D pose estimation using Charuco marker boards

## Usage 
roslaunc charuco_ros basic.launch

### Dependencies
cv_bridge
geometry_msgs
image_transport
tf2
tf2_eigen
OpenCV

### Topics Subscripted to:
/image [sensor_msgs/Image]
/camera_info [senor_msgs/CameraInfo]

### Topics Published:
/corner [charuco_ros/CharucoCornerMsg]
/pose [geometry_msgs/PoseStamped]
/result [sensor_msgs/Image]
/transform [geometry_msgs/TransformStamped]
/tf [tf2_msgs/TFMessage]

#### Notes
This node publishes the pixel and metric corners that can be used to solve a PnP problem. This node differs from the ArUco 
node where the corners are the intersection of two black squares of a checkerboard pattern rather than the corners of the 
ArUco marker. Hence, we only have ONE corner rather than 4 in the previous type.

#### TODOs:
Add a script to generate the ChArUco board
Add a table with all the parameters that the node uses.