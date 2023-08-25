# Configure the Confluent Provide
terraform {
  required_version = "~> 1.3.0"
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.50.0"
    }  
  }
}


provider "confluent" {
  cloud_api_key       = var.cloud_api_key
  cloud_api_secret    = var.cloud_api_secret


  kafka_id            = var.kafka_id
  kafka_rest_endpoint = var.kafka_rest_endpoint
  kafka_api_key       = var.kafka_api_key
  kafka_api_secret    = var.kafka_api_secret
}