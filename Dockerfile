FROM ros:noetic-ros-base

# Create User
ENV ROSUSER="user"
RUN adduser --home /home/${ROSUSER} --shell /bin/zsh --gecos '' --disabled-password ${ROSUSER} && \
    usermod -a -G root,sudo,video,tty,dialout ${ROSUSER} && \
    echo "${ROSUSER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${ROSUSER}
    
# Ubuntu setup
RUN apt-get update && apt-get install -y --no-install-recommends \
    dialog apt-utils zsh && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get install -y -q && \
    rm -rf /var/lib/apt/lists/*

# ROS 1
RUN echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros1-latest.list \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update && apt-get install -y ros-noetic-desktop-full ros-noetic-turtlebot3-gazebo ros-noetic-gmapping ros-noetic-turtlebot3-slam
#RUN apt-get update && apt-get install -y ros-noetic-gazebo-ros ros-noetic-turtlebot3-gazebo ros-noetic-gmapping ros-noetic-rviz ros-noetic-rqt-graph
RUN apt-get install -y tmux nano git

RUN echo "source /opt/ros/noetic/setup.zsh" >> /home/$ROSUSER/.zshrc

RUN cd && \
    git clone https://github.com/gpakosz/.tmux.git  && \
    ln -s -f .tmux/.tmux.conf && \
    cp .tmux/.tmux.conf.local .

user $ROSUSER
WORKDIR /home/$ROSUSER

ENTRYPOINT []
