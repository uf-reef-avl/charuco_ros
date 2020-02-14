# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "charuco_ros: 3 messages, 0 services")

set(MSG_I_FLAGS "-Icharuco_ros:/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(charuco_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg" NAME_WE)
add_custom_target(_charuco_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "charuco_ros" "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg" "charuco_ros/OneMarker:charuco_ros/SingleCorner:std_msgs/Header"
)

get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg" NAME_WE)
add_custom_target(_charuco_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "charuco_ros" "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg" ""
)

get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg" NAME_WE)
add_custom_target(_charuco_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "charuco_ros" "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg" "charuco_ros/SingleCorner"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg;/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/charuco_ros
)
_generate_msg_cpp(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/charuco_ros
)
_generate_msg_cpp(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/charuco_ros
)

### Generating Services

### Generating Module File
_generate_module_cpp(charuco_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/charuco_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(charuco_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(charuco_ros_generate_messages charuco_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_cpp _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_cpp _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_cpp _charuco_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(charuco_ros_gencpp)
add_dependencies(charuco_ros_gencpp charuco_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS charuco_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg;/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/charuco_ros
)
_generate_msg_eus(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/charuco_ros
)
_generate_msg_eus(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/charuco_ros
)

### Generating Services

### Generating Module File
_generate_module_eus(charuco_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/charuco_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(charuco_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(charuco_ros_generate_messages charuco_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_eus _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_eus _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_eus _charuco_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(charuco_ros_geneus)
add_dependencies(charuco_ros_geneus charuco_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS charuco_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg;/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/charuco_ros
)
_generate_msg_lisp(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/charuco_ros
)
_generate_msg_lisp(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/charuco_ros
)

### Generating Services

### Generating Module File
_generate_module_lisp(charuco_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/charuco_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(charuco_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(charuco_ros_generate_messages charuco_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_lisp _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_lisp _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_lisp _charuco_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(charuco_ros_genlisp)
add_dependencies(charuco_ros_genlisp charuco_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS charuco_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg;/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/charuco_ros
)
_generate_msg_nodejs(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/charuco_ros
)
_generate_msg_nodejs(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/charuco_ros
)

### Generating Services

### Generating Module File
_generate_module_nodejs(charuco_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/charuco_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(charuco_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(charuco_ros_generate_messages charuco_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_nodejs _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_nodejs _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_nodejs _charuco_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(charuco_ros_gennodejs)
add_dependencies(charuco_ros_gennodejs charuco_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS charuco_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg;/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/charuco_ros
)
_generate_msg_py(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/charuco_ros
)
_generate_msg_py(charuco_ros
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg"
  "${MSG_I_FLAGS}"
  "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/charuco_ros
)

### Generating Services

### Generating Module File
_generate_module_py(charuco_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/charuco_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(charuco_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(charuco_ros_generate_messages charuco_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/ArucoCornerMsg.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_py _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/SingleCorner.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_py _charuco_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prashant/camera_imu_calib_ws/src/charuco_ros/msg/OneMarker.msg" NAME_WE)
add_dependencies(charuco_ros_generate_messages_py _charuco_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(charuco_ros_genpy)
add_dependencies(charuco_ros_genpy charuco_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS charuco_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/charuco_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/charuco_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(charuco_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/charuco_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/charuco_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(charuco_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/charuco_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/charuco_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(charuco_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/charuco_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/charuco_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(charuco_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/charuco_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/charuco_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/charuco_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(charuco_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
