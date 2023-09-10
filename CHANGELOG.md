<a name="unreleased"></a>
## [Unreleased]

<a name="v2.0.0"></a>
## [v2.0.0] - 2023-09-10
### CI
- Update set-output to recommended format ([#81](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/81))
- Fix cache clean step ([#76](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/76))
- Optimize for self-hosted runner ([#75](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/75))
- Use self-hosted runner ([#72](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/72))

### Chore
- Use GHA composite action ([#111](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/111))
- bump ubuntu from jammy-20230522 to jammy-20230804 ([#106](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/106))
- Check docker base image version ([#102](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/102))
- Fix Trivy scan timeout ([#93](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/93))
- Add CODE_OF_CONDUCT.md and CONTRIBUTING.md ([#86](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/86))

### Documentation
- Update README ([#101](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/101))

### Features
- Add VSCodium ([#99](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/99))
- Add FireFox ([#98](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/98))
- Add terminator shortcut on desktop ([#95](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/95))
- Use atsushisaito/docker-ubuntu-sweb ([#92](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/92))
- Add ROS 2 Iron Irwini ([#89](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/89))
- Set ROS 2 Humble as the "latest" image ([#83](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/83))
- Drop support for ROS 2 Galactic ([#82](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/82))
- Enable colcon-argcomplete ([#80](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/80))
- Enable bash-completion ([#79](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/79))
- Add terminator ([#73](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/73))

### Fix
- Fix FireFox install error ([#112](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/112))
- Add "--security-opt" ([#94](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/94))
- Stop using mirror server ([#88](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/88))
- Fix platform specifying error ([#67](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/67))
- Remove simulation package from rolling arm64 ([#68](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/68))

<a name="v1.4.0"></a>
## [v1.4.0] - 2022-09-20
### CI
- Add dependabot.yml ([#48](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/48))
- Allow execution even if other jobs fail ([#49](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/49))
- Refactor GitHub Actions config file ([#46](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/46))
- Update tag release CI trigger condition ([#41](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/41))

### Chore
- Update git-chglog config to add dependabot log ([#63](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/63))
- bump docker/metadata-action from 3 to 4 ([#51](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/51))
- bump docker/setup-qemu-action from 1 to 2 ([#54](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/54))
- bump github/codeql-action from 1 to 2 ([#55](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/55))
- bump docker/login-action from 1 to 2 ([#53](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/53))
- bump actions/checkout from 2 to 3 ([#52](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/52))
- Add docker label ([#40](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/40))

### Documentation
- Add related projects link ([#61](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/61))

### Features
- Upgrade rolling base image to Ubuntu 22.04 ([#59](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/59))
- Add ROS 2 Humble Dockerfile ([#56](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/56))
- Add ROS 2 Rolling Ridley ([#44](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/44))

### Fix
- Update hotfix ([#50](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/50))

### Refactor
- Merge install script into Dockerfile ([#45](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/45))


<a name="v1.3.0"></a>
## [v1.3.0] - 2022-01-09
### CI
- Create multi-architecture image ([#38](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/38))
- Simplify authentication ([#36](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/36))

### Documentation
- Add link to ros-desktop-vnc

### Features
- Add Dockerfile for galactic-arm64 to support Apple Silicon ([#35](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/35))


<a name="v1.2.0"></a>
## [v1.2.0] - 2021-08-18
### CI
- Add ROS 2 Galactic ([#30](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/30))

### Chore
- Add documentation update to CHANGELOG ([#32](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/32))

### Features
- Drop ROS 2 Dashing support ([#31](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/31))
- Add Dockerfile for dashing-arm64 to support Apple Silicon ([#20](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/20))
- Set foxy as the "latest" image ([#22](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/22))


<a name="v1.1.0"></a>
## [v1.1.0] - 2021-06-18
### Documentation
- Fix the link to Foxy's Dockerfile ([#28](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/28))

### Features
- Update GPG key installation step to the latest ([#27](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/27))
- Add ROS 2 Galactic ([#23](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/23))


<a name="v1.0.0"></a>
## v1.0.0 - 2021-05-27
### CI
- Add git tag release actions ([#24](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/24))
- Use official skip [skip ci]

### Chore
- Add git-chglog config ([#25](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/25))
- Fix ghcr.io deploy error
- Fix ghcr.io deploy error ([#17](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/17))
- Publish to ghcr.io ([#16](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/16))
- Update build log URL written to the wiki
- Update deploy step
- Add timestamp to docker tags
- Add GitHub Actions settings ([#2](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/2))

### Documentation
- Update README ([#15](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/15))
- Add links and details ([#5](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/5))
- Update the execution command ([#4](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/4))

### Features
- Add Dockerfile for foxy-arm64 to support Apple Silicon ([#21](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/21))
- Drop support for ROS Eloquent ([#18](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/18))
- Add install scripts ([#11](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/11))
- Setup rosdep on install step ([#10](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/10))
- Enable ros-foxy-gazebo-ros-pkgs ([#8](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/8))
- Add ROS 2 Foxy ([#7](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/7))
- Add LICENSE
- Add eloquent
- Add dashing
- Initial commit

### Fix
- Fix dashing tag image ([#14](https://github.com/Tiryoh/docker-ros2-desktop-vnc/issues/14))


[Unreleased]: https://github.com/Tiryoh/docker-ros2-desktop-vnc/compare/v2.0.0...HEAD
[v2.0.0]: https://github.com/Tiryoh/docker-ros2-desktop-vnc/compare/v1.4.0...v2.0.0
[v1.4.0]: https://github.com/Tiryoh/docker-ros2-desktop-vnc/compare/v1.3.0...v1.4.0
[v1.3.0]: https://github.com/Tiryoh/docker-ros2-desktop-vnc/compare/v1.2.0...v1.3.0
[v1.2.0]: https://github.com/Tiryoh/docker-ros2-desktop-vnc/compare/v1.1.0...v1.2.0
[v1.1.0]: https://github.com/Tiryoh/docker-ros2-desktop-vnc/compare/v1.0.0...v1.1.0
