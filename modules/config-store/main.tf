variable "path" {
    default = "./config.yaml"
}

output "config" {
    value = yamldecode(file(var.path))
}
