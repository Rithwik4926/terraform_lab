provider "local" {}

variable "message" {
  default = "Hello Updated Terraform"
}

resource "local_file" "hello" {
  filename = "hello.txt"
  content  = var.message
}

output "file_path" {
  value = local_file.hello.filename
}