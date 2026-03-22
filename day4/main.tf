terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# First container
#module "nginx1" {
#  source = "./modules/nginx_container"
#
#  container_name = "nginx_1"
#  container_port = 8081
#}

# Second container
#module "nginx2" {
#  source = "./modules/nginx_container"
#
#  container_name = "nginx_2"
#  container_port = 8082
#}

module "nginx_containers" {
  source = "./modules/nginx_container"

  for_each = {
    for container in var.container_config :
    container.name => container
  }

  container_name = each.value.name
  container_port = each.value.port
}