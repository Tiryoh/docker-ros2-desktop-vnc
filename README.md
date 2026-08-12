# docker-ros2-desktop-vnc

Dockerfiles to provide HTML5 VNC interface to access Ubuntu Desktop + ROS2, based on [AtsushiSaito/docker-ubuntu-sweb](https://github.com/AtsushiSaito/docker-ubuntu-sweb)

ROS 1 version: https://github.com/Tiryoh/docker-ros-desktop-vnc

![animation](https://github.com/user-attachments/assets/137a5272-f6a3-490f-8bfc-168d082ac949)

There are official ROS 2 Docker images provided by Open Robotics.  
https://github.com/osrf/docker_images/blob/master/README.md#official-library

このツールの詳細については以下の記事で紹介しています。  
The details of these tools are written in Japanese on this page.  
https://memoteki.net/archives/2955

| Distro | CI |
| --- | --- |
| Humble | [![Humble](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-humble.yml/badge.svg)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-humble.yml) |
| Iron | [![Iron](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-iron.yml/badge.svg)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-iron.yml) |
| Jazzy | [![Jazzy](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-jazzy.yml/badge.svg)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-jazzy.yml) |
| Lyrical | [![Lyrical](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-lyrical.yml/badge.svg)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-lyrical.yml) |
| Rolling | [![Rolling](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-rolling.yml/badge.svg)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-rolling.yml) |

| Registry | Pulls (all time) | Pulls / week | Pulls / month |
| --- | --- | --- | --- |
| Docker Hub<br>(`tiryoh/ros2-desktop-vnc`) | [![Docker Hub pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2FTiryoh%2Foci-registry-stats%2Fmain%2Fdata%2Fshields%2Fdockerhub_ros2_desktop_vnc_total.json)](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc) | [![Docker Hub pulls per week](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2FTiryoh%2Foci-registry-stats%2Fmain%2Fdata%2Fshields%2Fdockerhub_ros2_desktop_vnc_weekly.json)](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc) | [![Docker Hub pulls per month](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2FTiryoh%2Foci-registry-stats%2Fmain%2Fdata%2Fshields%2Fdockerhub_ros2_desktop_vnc_monthly.json)](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc) |
| GHCR<br>(`ghcr.io/tiryoh/ros2-desktop-vnc`) | [![GHCR downloads](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2FTiryoh%2Foci-registry-stats%2Fmain%2Fdata%2Fshields%2Fghcr_ros2_desktop_vnc_package_total.json)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/pkgs/container/ros2-desktop-vnc) | [![GHCR downloads per week](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2FTiryoh%2Foci-registry-stats%2Fmain%2Fdata%2Fshields%2Fghcr_ros2_desktop_vnc_package_weekly.json)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/pkgs/container/ros2-desktop-vnc) | [![GHCR downloads per month](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2FTiryoh%2Foci-registry-stats%2Fmain%2Fdata%2Fshields%2Fghcr_ros2_desktop_vnc_package_monthly.json)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/pkgs/container/ros2-desktop-vnc) |

## Quick Start

Run the docker container and access with port `6080`.  
Change the `shm-size` value depending on the situation.

```
docker run -p 6080:80 --shm-size=512m ghcr.io/tiryoh/ros2-desktop-vnc:lyrical
```

Browse http://127.0.0.1:6080/.

### Troubleshooting GUI applications

Some GUI applications may not work correctly when their system calls are blocked by Docker's default seccomp profile. Reported symptoms include Gazebo displaying a blank window and VSCodium failing to launch. This may also occur with Docker Desktop on macOS.

If you encounter these symptoms, retry with the seccomp profile disabled:

```sh
docker run -p 6080:80 --security-opt seccomp=unconfined --shm-size=512m ghcr.io/tiryoh/ros2-desktop-vnc:lyrical
```

> [!WARNING]
> `seccomp=unconfined` disables Docker's default system call filtering and reduces container isolation. Update Docker Engine or Docker Desktop first, and use this workaround only when necessary with a trusted image.

This workaround was originally introduced for an incompatibility between newer glibc in the container and older Docker seccomp implementations ([#56](https://github.com/Tiryoh/docker-ros2-desktop-vnc/pull/56)), and was later required to resolve GUI blackout issues ([#94](https://github.com/Tiryoh/docker-ros2-desktop-vnc/pull/94)).

![default desktop](https://github.com/user-attachments/assets/29ff479f-de54-4032-995d-d1be244ff4e7)

## Build

To build Docker image from this Dockerfile, run the following command.

* humble
```sh
# using "docker build"
cd humble && docker build -t tiryoh/ros2-desktop-vnc:humble .
# using "docker buildx" (amd64)
cd humble && docker buildx build --platform=linux/amd64 --progress=plain -t tiryoh/ros2-desktop-vnc:humble-amd64 .
# using "docker buildx" (arm64)
cd humble && docker buildx build --platform=linux/arm64 --progress=plain -t tiryoh/ros2-desktop-vnc:humble-arm64 .
```

* iron
```sh
# using "docker build"
cd iron && docker build -t tiryoh/ros2-desktop-vnc:iron .
# using "docker buildx" (amd64)
cd iron && docker buildx build --platform=linux/amd64 --progress=plain -t tiryoh/ros2-desktop-vnc:iron-amd64 .
# using "docker buildx" (arm64)
cd iron && docker buildx build --platform=linux/arm64 --progress=plain -t tiryoh/ros2-desktop-vnc:iron-arm64 .
```

* jazzy
```sh
# using "docker build"
cd jazzy && docker build -t tiryoh/ros2-desktop-vnc:jazzy .
# using "docker buildx" (amd64)
cd jazzy && docker buildx build --platform=linux/amd64 --progress=plain -t tiryoh/ros2-desktop-vnc:jazzy-amd64 .
# using "docker buildx" (arm64)
cd jazzy && docker buildx build --platform=linux/arm64 --progress=plain -t tiryoh/ros2-desktop-vnc:jazzy-arm64 .
```

* lyrical
```sh
# using "docker build"
cd lyrical && docker build -t tiryoh/ros2-desktop-vnc:lyrical .
# using "docker buildx" (amd64)
cd lyrical && docker buildx build --platform=linux/amd64 --progress=plain -t tiryoh/ros2-desktop-vnc:lyrical-amd64 .
# using "docker buildx" (arm64)
cd lyrical && docker buildx build --platform=linux/arm64 --progress=plain -t tiryoh/ros2-desktop-vnc:lyrical-arm64 .
```

* rolling
```sh
# using "docker build"
cd rolling && docker build -t tiryoh/ros2-desktop-vnc:rolling .
# using "docker buildx" (amd64)
cd rolling && docker buildx build --platform=linux/amd64 --progress=plain -t tiryoh/ros2-desktop-vnc:rolling-amd64 .
# using "docker buildx" (arm64)
cd rolling && docker buildx build --platform=linux/arm64 --progress=plain -t tiryoh/ros2-desktop-vnc:rolling-arm64 .
```

<details>
<summary>Deprecated distros (dashing, eloquent, foxy, galactic)</summary>

* dashing (deprecated)
```sh
cd dashing && docker build -t tiryoh/ros2-desktop-vnc:dashing .
```

* eloquent (deprecated)
```sh
cd eloquent && docker build -t tiryoh/ros2-desktop-vnc:eloquent .
```

* foxy (deprecated)
```sh
cd foxy && docker build -t tiryoh/ros2-desktop-vnc:foxy .
```

* galactic (deprecated)
```sh
cd galactic && docker build -t tiryoh/ros2-desktop-vnc:galactic .
```

</details>

## Docker tags on hub.docker.com

* [`foxy`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=foxy) which is based on [`foxy/Dockerfile`](./foxy/Dockerfile)
* [`humble`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=humble), [`latest`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=latest) which is based on [`humble/Dockerfile`](./humble/Dockerfile)
* [`iron`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=iron) which is based on [`iron/Dockerfile`](./iron/Dockerfile)
* [`jazzy`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=jazzy) which is based on [`jazzy/Dockerfile`](./jazzy/Dockerfile)
* [`lyrical`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=lyrical) which is based on [`lyrical/Dockerfile`](./lyrical/Dockerfile)
* [`rolling`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=rolling) which is based on [`rolling/Dockerfile`](./rolling/Dockerfile)

<details>
<summary>Deprecated tags (dashing, eloquent, galactic)</summary>

* ~~[`dashing`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=dashing) which is based on [`dashing/Dockerfile`](./dashing/Dockerfile)~~ deprecated
* ~~[`eloquent`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=eloquent) which is based on [`eloquent/Dockerfile`](./eloquent/Dockerfile)~~ deprecated
* ~~[`galactic`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=galactic) which is based on [`galactic/Dockerfile`](./galactic/Dockerfile)~~ deprecated

</details>

Docker tags and build logs are listed on this page.  
https://github.com/Tiryoh/docker-ros2-desktop-vnc/wiki

## Related projects

* https://github.com/atinfinity/nvidia-egl-desktop-ros2
  * Dockerfile to use ROS 2 on Xfce Desktop container with NVIDIA GPU support via VNC/[Selkies](https://github.com/selkies-project/selkies-gstreamer)(Full desktop streaming with WebRTC)
* https://github.com/fcwu/docker-ubuntu-vnc-desktop
  * Dockerfile to access Ubuntu Xfce/LXDE/LxQT desktop environment via web VNC interface
* https://github.com/AtsushiSaito/docker-ubuntu-sweb
  * Dockerfile to access Ubuntu MATE desktop environment via web VNC interface

## License

This repository is released under the Apache License 2.0, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is under the Apache License 2.0.

```
Copyright 2020-2026 Tiryoh <tiryoh@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

### Acknowledgements

* This Dockerfile is based on [AtsushiSaito/docker-ubuntu-sweb](https://github.com/AtsushiSaito/docker-ubuntu-sweb), licensed under the [Apache License 2.0](https://github.com/AtsushiSaito/docker-ubuntu-sweb/blob/5e7ba8571d2f4d1e4fca0c1527d090c20f7f5e90/LICENSE).
* This Dockerfile is based on [fcwu/ubuntu-desktop-lxde-vnc](https://github.com/fcwu/docker-ubuntu-vnc-desktop), licensed under the [Apache License 2.0](https://github.com/fcwu/docker-ubuntu-vnc-desktop/blob/60f9ae18e71e9fabbfb23f67b212e64ab72c206e/LICENSE).

## Star History

[![Star History Chart](https://star-history.dera.page/svg?repos=Tiryoh/docker-ros2-desktop-vnc,Tiryoh/docker-ros-desktop-vnc&type=Date)](https://star-history.dera.page/#Tiryoh/docker-ros2-desktop-vnc&Tiryoh/docker-ros-desktop-vnc&Date)
