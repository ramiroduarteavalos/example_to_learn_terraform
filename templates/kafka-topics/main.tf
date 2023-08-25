module "kafka" {
    source = "git::git@github.com:ramiroduarteavalos/example_to_learn_terraform.git//modules/kafka"

    cloud_api_key = var.cloud_api_key
    cloud_api_secret = var.cloud_api_secret

    kafka_id            = var.kafka_id
    kafka_rest_endpoint = var.kafka_rest_endpoint
    kafka_api_key       = var.kafka_api_key
    kafka_api_secret    = var.kafka_api_secret
    
    project = var.project

    name = var.environments[terraform.workspace].cluster
    environment = var.environments[terraform.workspace].environment
    create_topics = var.environments[terraform.workspace].create_topics
    topics = var.environments[terraform.workspace].topics
}