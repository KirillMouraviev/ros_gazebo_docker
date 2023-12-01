volumes_args=()
environment_args=()

volumes_args+=( "-v $HOME/.Xauthority:/home/user/.Xauthority:ro" )
volumes_args+=( "-v /dev/bus/usb:/dev/bus/usb " )
environment_args+=( "-e DISPLAY=$DISPLAY" )
environment_args+=( "-e QT_X11_NO_MITSHM=1" )

docker run -it --privileged --net=host \
	--name ros_gazebo_docker \
	--device-cgroup-rule='c 189:* rmw' \
	${environment_args[@]} \
	${volumes_args[@]} \
	ros_gazebo_docker zsh
