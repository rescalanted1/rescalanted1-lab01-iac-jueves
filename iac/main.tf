terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.2.0"
    }
  }
}

resource "docker_network" "app_network" {
  name = "net-${terraform.workspace}"
}