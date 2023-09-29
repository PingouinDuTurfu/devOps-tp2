terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "myimage" {
  name          = "myimage"
  build {
    context    = "../"
    dockerfile = "./Dockerfile"
  }
}

resource "docker_container" "fapi_container" {
  name  = "fapi_container"
  image = docker_image.myimage.image_id

  ports {
    internal = 80
    external = 8000
  }
}