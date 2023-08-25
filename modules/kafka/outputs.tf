output "cluster" {
  value = {
    "kafka_id" = try(confluent_kafka_cluster.cluster[0].id, "")
    "kafka_api_key" = try(confluent_api_key.key-cluster[0].id, "")
    "kafka_api_secret" = try(confluent_api_key.key-cluster[0].secret, "")
    "kafka_rest_endpoint"     = try(confluent_kafka_cluster.cluster[0].rest_endpoint, "")
  }
  sensitive = true
}


output "topics" {
  value = {
    "sasl_username" = try(confluent_api_key.key-topics[0].id, "")
    "sasl_password" = try(confluent_api_key.key-topics[0].secret, "")
    "ssl"     = var.create_topics == true ? true : ""
    "brokers" = try(data.confluent_kafka_cluster.cluster[0].bootstrap_endpoint, "")
  }
  sensitive = true
}