module "kafka" {
    source = "git::git@github.com:ramiroduarteavalos/example_to_learn_terraform.git//modules/kafka"
 
    cloud_api_key = var.cloud_api_key
    cloud_api_secret = var.cloud_api_secret

    name = var.environments[terraform.workspace].name
    create_cluster = var.environments[terraform.workspace].create_cluster
    environment = var.environments[terraform.workspace].environment
    availability = var.environments[terraform.workspace].availability
    cloud = var.environments[terraform.workspace].cloud
    region = var.environments[terraform.workspace].region
    cluster_type = var.environments[terraform.workspace].cluster_type
    dedicated_cku = var.environments[terraform.workspace].dedicated_cku
}