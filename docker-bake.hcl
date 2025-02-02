# docker-bake.hcl

group "default" {
  targets = [
    "humble",
    "iron",
    "jazzy",
    "rolling"
    ]
}

# Common variables
variable "REGISTRY_PREFIX" {
  default = "docker.io/tiryoh/ros2-desktop-vnc"
}

# Common settings
target "common" {
  dockerfile = "Dockerfile"
}

target "humble" {
  inherits = ["common"]
  context = "humble"
  tags = [
    "${REGISTRY_PREFIX}:humble",
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}

target "iron" {
  inherits = ["common"]
  context = "iron"
  tags = [
    "${REGISTRY_PREFIX}:iron"
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}

target "jazzy" {
  inherits = ["common"]
  context = "jazzy"
  tags = [
    "${REGISTRY_PREFIX}:jazzy"
    "${REGISTRY_PREFIX}:latest"
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}

target "rolling" {
  inherits = ["common"]
  context = "rolling"
  tags = [
    "${REGISTRY_PREFIX}:rolling"
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
