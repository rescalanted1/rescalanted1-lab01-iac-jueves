resource "docker_container" "api" {
  name  = "api-${terraform.workspace}"
  image = "lab/api"
  networks_advanced { name = docker_network.app_network.name }
  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }
  # Para que la API sepa dónde está la BD
  env = [ "DB_HOST=bd-${terraform.workspace}" ]
}