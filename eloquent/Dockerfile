FROM dorowu/ubuntu-desktop-lxde-vnc:bionic
LABEL maintainer="Tiryoh<tiryoh@gmail.com>"

RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq wget curl git build-essential vim sudo lsb-release locales bash-completion tzdata && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -m -d /home/ubuntu ubuntu -p $(perl -e 'print crypt("ubuntu", "salt"),"\n"') && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV ROS_DISTRO eloquent
RUN git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git /tmp/ros2_setup_scripts_ubuntu && \
    cd /tmp/ros2_setup_scripts_ubuntu && \
    sed -e 's/^\(CHOOSE_ROS_DISTRO=.*\)/#\1\nCHOOSE_ROS_DISTRO=$ROS_DISTRO/g' -i run.sh && \
    ./run.sh && \
    apt-get install -yq ros-$ROS_DISTRO-gazebo-ros-pkgs && \
    rm -rf /var/lib/apt/lists/*
ENV USER ubuntu
