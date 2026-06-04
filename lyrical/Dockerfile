# https://github.com/Tiryoh/docker-ros2-desktop-vnc
# Copyright 2020-2026 Tiryoh<tiryoh@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This Dockerfile is based on https://github.com/AtsushiSaito/docker-ubuntu-sweb
# which is released under the Apache-2.0 license.
#
# The TigerVNC startup workaround for Ubuntu 26.04 is based on
# https://github.com/atinfinity/docker-ubuntu-sweb by atinfinity.

FROM ubuntu:resolute-20260404

# Automatic platform ARGs in the global scope
# https://docs.docker.com/reference/dockerfile/#automatic-platform-args-in-the-global-scope
ARG TARGETPLATFORM
ARG TARGETARCH

# The QEMU_CPU option is used to speed up arm64 image builds,
# amd64 is unaffected as it does not use QEMU.
# This environment variable is only declared at build time.
ARG QEMU_CPU

LABEL maintainer="Tiryoh<tiryoh@gmail.com>"

SHELL ["/bin/bash", "-c"]

# Upgrade OS
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install Ubuntu Mate desktop
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        ubuntu-mate-desktop && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Add Package
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        tigervnc-standalone-server tigervnc-common \
        supervisor wget curl gosu git sudo python3-full python3-pip tini \
        build-essential vim sudo lsb-release locales \
        bash-completion tzdata terminator dbus-x11 && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# noVNC and Websockify
RUN git clone https://github.com/AtsushiSaito/noVNC.git -b add_clipboard_support /usr/lib/novnc
RUN pip install --no-cache-dir --break-system-packages git+https://github.com/novnc/websockify.git@v0.10.0
RUN ln -s /usr/lib/novnc/vnc.html /usr/lib/novnc/index.html

# Set remote resize function enabled by default
RUN sed -i "s/UI.initSetting('resize', 'off');/UI.initSetting('resize', 'remote');/g" /usr/lib/novnc/app/ui.js

# Disable auto update and crash report
RUN sed -i 's/Prompt=.*/Prompt=never/' /etc/update-manager/release-upgrades
RUN sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# Install Firefox
RUN wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg \
    -O /etc/apt/keyrings/packages.mozilla.org.asc && \
    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" \
    | tee -a /etc/apt/sources.list.d/mozilla-apt.list && \
    echo "Package: *" | tee /etc/apt/preferences.d/mozilla > /dev/null && \
    echo "Pin: origin packages.mozilla.org" | tee -a /etc/apt/preferences.d/mozilla > /dev/null && \
    echo "Pin-Priority: 1000" | tee -a /etc/apt/preferences.d/mozilla > /dev/null && \
    apt-get update -q && \
    apt-get remove -y firefox && \
    apt-get install -y \
    firefox && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install VSCodium
RUN wget https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    -O /usr/share/keyrings/vscodium-archive-keyring.asc && \
    echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.asc ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list && \
    apt-get update -q && \
    apt-get install -y codium && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install ROS
ENV ROS_DISTRO=lyrical
# desktop or ros-base
ARG INSTALL_PACKAGE=desktop

RUN apt-get update -q && \
    apt-get install -y curl gnupg2 lsb-release && \
    export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F'"' '{print $4}') && \
    curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb" && \
    dpkg -i /tmp/ros2-apt-source.deb && \
    apt-get update -q && \
    apt-get install -y ros-${ROS_DISTRO}-${INSTALL_PACKAGE} \
    python3-argcomplete \
    python3-colcon-common-extensions \
    python3-rosdep python3-vcstool && \
    rosdep init && \
    rm -f /tmp/ros2-apt-source.deb && \
    rm -rf /var/lib/apt/lists/*

RUN rosdep update

# Install simulation packages
RUN apt-get update -q && \
    apt-get install -y \
    ros-${ROS_DISTRO}-ros-gz && \
    rm -rf /var/lib/apt/lists/*

# Enable apt-get completion after running `apt-get update` in the container
RUN rm /etc/apt/apt.conf.d/docker-clean

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/bin/bash", "-c", "/entrypoint.sh" ]

ENV USER=ubuntu
ENV PASSWD=ubuntu
