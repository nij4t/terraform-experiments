module "config" {
    source = "./modules/config-store"

    path = "./spec.yaml"
}

resource "null_resource" "example" {
    provisioner "local-exec" {
        command = "echo '${module.config.config.spec.name}'"
    }
}