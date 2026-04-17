resource "docker_container" "db" {
  name  = "db-${terraform.workspace}"
  image = "postgres:15-alpine"
  
  # Conexión a la red segura
  networks_advanced {
    name = docker_network.app_network.name
    aliases = ["db-host"] 
  }

  # Variables de entorno para inicializar la BD
  env = [
    "POSTGRES_USER=myuser",
    "POSTGRES_PASSWORD=mypassword",
    "POSTGRES_DB=mydb"
  ]

  # Mapeo de puertos según el workspace
  ports {
    internal = 5432
    external = var.db_port[terraform.workspace]
  }
}