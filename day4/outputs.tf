#output "container1_url" {
#  value = module.nginx1.container_url
#}
#
#output "container2_url" {
#  value = module.nginx2.container_url
#}

output "container_urls" {
  value = [
    for container in var.container_config :
    "http://localhost:${container.port}"
  ]
}