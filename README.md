# docker_ros2-desktop-vnc

![Docker Automated build](https://img.shields.io/docker/automated/tiryoh/ros2-desktop-vnc)
[![Publish to Registry](https://github.com/Tiryoh/docker_ros2-desktop-vnc/workflows/Publish%20to%20Registry/badge.svg?branch=master)](https://github.com/Tiryoh/docker_ros2-desktop-vnc/actions?query=workflow%3A%22Publish+to+Registry%22+branch%3Amaster)
[![](https://img.shields.io/docker/pulls/tiryoh/ros2-desktop-vnc.svg)](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc)

A Docker image to provide HTML5 VNC interface to access Ubuntu LXDE + ROS2, based on [dorowu/ubuntu-desktop-lxde-vnc](https://github.com/fcwu/docker-ubuntu-vnc-desktop)

![Image from Gyazo](https://i.gyazo.com/5a71a36dc9d6106ef794fbcb86af7e7f.gif)

There are official ROS 2 Docker images provided by OSRF.  
https://github.com/osrf/docker_images/blob/master/README.md#official-library

このツールの詳細については以下の記事で紹介しています。  
The details of these tools are written in Japanese on this page.  
https://memoteki.net/archives/2955

## Quick Start

Run the docker container and access with port `6080`.  
Change the `shm-size` value depending on the situation.

```
docker run -p 6080:80 --shm-size=512m tiryoh/ros2-desktop-vnc:dashing
```

Browse http://127.0.0.1:6080/.

![Image from Gyazo](https://i.gyazo.com/ab43ab3f6dc10b5186416499e49d0bbe.jpg)


## Docker tags

* [`dashing`, `latest`](https://github.com/Tiryoh/docker_ros2-desktop-vnc/blob/master/dashing/Dockerfile)
* [`eloquent`](https://github.com/Tiryoh/docker_ros2-desktop-vnc/blob/master/eloquent/Dockerfile)


Docker tags and build logs are listed on this page.  
https://github.com/Tiryoh/docker_ros2-desktop-vnc/wiki

## License

Copyright 2020 Tiryoh\<tiryoh@gmail.com\>

This repository is released under the Apache License 2.0, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is under the Apache License 2.0.

### Acknowledgements

This Docker image is based on [dorowu/ubuntu-desktop-lxde-vnc](https://github.com/fcwu/docker-ubuntu-vnc-desktop), licensed under the [Apache License 2.0](https://github.com/fcwu/docker-ubuntu-vnc-desktop/blob/60f9ae18e71e9fabbfb23f67b212e64ab72c206e/LICENSE).
