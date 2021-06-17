# docker-ros2-desktop-vnc

![Docker Automated build](https://img.shields.io/docker/automated/tiryoh/ros2-desktop-vnc)
[![Publish to Registry](https://github.com/Tiryoh/docker-ros2-desktop-vnc/workflows/Publish%20to%20Registry/badge.svg?branch=master)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions?query=workflow%3A%22Publish+to+Registry%22+branch%3Amaster)
[![](https://img.shields.io/docker/pulls/tiryoh/ros2-desktop-vnc.svg)](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc)

Dockerfiles to provide HTML5 VNC interface to access Ubuntu LXDE + ROS2, based on [dorowu/ubuntu-desktop-lxde-vnc](https://github.com/fcwu/docker-ubuntu-vnc-desktop)

![Image from Gyazo](https://i.gyazo.com/5a71a36dc9d6106ef794fbcb86af7e7f.gif)

There are official ROS 2 Docker images provided by Open Robotics.  
https://github.com/osrf/docker_images/blob/master/README.md#official-library

このツールの詳細については以下の記事で紹介しています。  
The details of these tools are written in Japanese on this page.  
https://memoteki.net/archives/2955

## Quick Start

Run the docker container and access with port `6080`.  
Change the `shm-size` value depending on the situation.

```
docker run -p 6080:80 --shm-size=512m tiryoh/ros2-desktop-vnc:foxy
```

Browse http://127.0.0.1:6080/.

![Image from Gyazo](https://i.gyazo.com/ab43ab3f6dc10b5186416499e49d0bbe.jpg)

## Build

To build Docker image from this Dockerfile, run the following command.

* dashing
```
cd dashing && docker build -t tiryoh/ros2-desktop-vnc:dashing .
```

* eloquent
```
cd eloquent && docker build -t tiryoh/ros2-desktop-vnc:eloquent .
```

* foxy
```
cd foxy && docker build -t tiryoh/ros2-desktop-vnc:foxy .
```

## Docker tags on hub.docker.com

* [`dashing`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=dashing) which is based on [`dashing/Dockerfile`](./dashing/Dockerfile)
* ~~[`eloquent`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=eloquent) which is based on [`eloquent/Dockerfile`](./eloquent/Dockerfile)~~ deprecated
* [`foxy`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=foxy), [`latest`](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc/tags?page=1&name=latest) which is based on [`foxy/Dockerfile`](./foxy/Dockerfile)

Docker tags and build logs are listed on this page.  
https://github.com/Tiryoh/docker-ros2-desktop-vnc/wiki

## License

Copyright 2020 Tiryoh\<tiryoh@gmail.com\>

This repository is released under the Apache License 2.0, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is under the Apache License 2.0.

### Acknowledgements

This Dockerfile is based on [dorowu/ubuntu-desktop-lxde-vnc](https://github.com/fcwu/docker-ubuntu-vnc-desktop), licensed under the [Apache License 2.0](https://github.com/fcwu/docker-ubuntu-vnc-desktop/blob/60f9ae18e71e9fabbfb23f67b212e64ab72c206e/LICENSE).
