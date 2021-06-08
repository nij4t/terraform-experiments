module "config_store" {
    source = "./modules/config-store"

    path = "./spec.yaml"
}

data "external" "uuid" {
    program = ["./scripts/uuid.sh"]
}

resource "null_resource" "example" {

    triggers = {
        unique_id = data.external.uuid.result.value
    }
    provisioner "local-exec" {
        command = "echo '${module.config_store.config.spec.name}'"
    }
}