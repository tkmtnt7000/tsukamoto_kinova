#!/usr/bin/env roseus

;;(ros::load-ros-manifest "roseus")
(ros::roseus-add-msgs "control_msgs")

(defclass error-cb-class
  :slots (result))
(defmethod error-cb-class
  (:init()
        (ros::roseus "hoge")
        (ros::subscribe "/arm_gen3/gen3_lite_joint_trajectory_controller/follow_joint_trajectory/result" control_msgs::FollowJointTrajectoryActionResult #'send self :error-cb))
  (:error-cb (msg)
             (setq result (send msg :result))
             (setq error_msg (send result :error_string))
             ;;(ros::ros-error "~A" error_msg)
             (cond
              ((substringp "TRAJECTORY_ERROR_TYPE_JOINT_POSITION_LIMIT" error_msg)
               (progn (ros::ros-error "~A~%" (send result :error_string))
                      (ros::ros-error "For detail, see https://github.com/tkmtnt7000/jsk_robot/blob/tsukamoto/kinova-gen3/jsk_kinova_robot/README.md#trouble-shooting")))))
  )

(setq m (instance error-cb-class :init))
(do-until-key
 (ros::spin-once)
)
