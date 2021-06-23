FROM dorowu/ubuntu-desktop-lxde-vnc:bionic-arm64
LABEL maintainer="Tiryoh<tiryoh@gmail.com>"

RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq wget curl git build-essential vim sudo lsb-release locales bash-completion tzdata gosu && \
    rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --home-dir /home/ubuntu --shell /bin/bash --user-group --groups adm,sudo ubuntu && \
    echo ubuntu:ubuntu | chpasswd && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY ./ros-dashing-desktop.sh /ros-dashing-desktop.sh
RUN mkdir -p /tmp/ros_setup_scripts_ubuntu && mv /ros-dashing-desktop.sh /tmp/ros_setup_scripts_ubuntu/ && \
    gosu ubuntu /tmp/ros_setup_scripts_ubuntu/ros-dashing-desktop.sh && \
    rm -rf /var/lib/apt/lists/*
ENV USER ubuntu
