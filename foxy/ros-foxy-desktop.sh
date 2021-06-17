#!/usr/bin/env bash
set -eu

# This install script is based on https://github.com/Tiryoh/ros2_setup_scripts_ubuntu, released under the Apache-2.0.

# REF: https://index.ros.org/doc/ros2/Installation/Linux-Install-Debians/
# by Open Robotics, licensed under CC-BY-4.0
# source: https://github.com/ros2/ros2_documentation

CHOOSE_ROS_DISTRO=foxy
INSTALL_PACKAGE=desktop

sudo apt-get update
sudo apt-get install -y curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt-get update
sudo apt-get install -y ros-${CHOOSE_ROS_DISTRO}-${INSTALL_PACKAGE}
sudo apt-get install -y python3-argcomplete
sudo apt-get install -y python3-colcon-common-extensions
sudo apt-get install -y python3-rosdep python3-vcstool # https://index.ros.org/doc/ros2/Installation/Linux-Development-Setup/
sudo rosdep init
rosdep update
sudo apt-get install -y ros-${CHOOSE_ROS_DISTRO}-gazebo-ros-pkgs
grep -F "source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash" ~/.bashrc ||
echo "source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash" >> ~/.bashrc

set +u

source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash

echo "success installing ROS2 ${CHOOSE_ROS_DISTRO}"
echo "Run 'source /opt/ros/${CHOOSE_ROS_DISTRO}/setup.bash'"