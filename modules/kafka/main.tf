################################################################################
# Kafka Cluster
################################################################################

# Creating the environment
resource "confluent_environment" "env" {
  count        = var.create_cluster ? 1 : 0 
  display_name = var.environment
}

# Creating the Cluster
# Exactly one from the basic, standard, dedicated, and enterprise configuration blocks must be specified.
# https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_kafka_cluster#basic
resource "confluent_kafka_cluster" "cluster" {
  count = var.create_cluster ? 1 : 0

  display_name = var.name
  availability = var.availability
  cloud        = var.cloud
  region       = var.region

  dynamic "basic" {
    for_each = var.cluster_type == "basic" ? [var.cluster_type] : []
    content {
    }
  }

  dynamic "standard" {
    for_each = var.cluster_type == "standard" ? [var.cluster_type] : []
    content {
    }
  }

  dynamic "dedicated" {
    for_each = var.cluster_type == "dedicated" ? [var.cluster_type] : []
    content {
      cku = var.dedicated_cku
    }
  }

  environment {
    id = confluent_environment.env[count.index].id
  }
}

# Creating service account
resource "confluent_service_account" "sa-cluster" {
  count        = var.create_cluster ? 1 : 0
  display_name = "${var.name}-${var.environment}"
  description  = "Service account to manage Kafka cluster"
}

# Describe the organizations
data "confluent_organization" "org" {}

# Creating EnvironmentAdmin role
resource "confluent_role_binding" "org" {
  count       = var.create_cluster ? 1 : 0
  principal   = "User:${confluent_service_account.sa-cluster[0].id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.env[0].resource_name
}

# Creating api key to manage
resource "confluent_api_key" "key-cluster" {
  count = var.create_cluster ? 1 : 0

  display_name = var.name
  description  = "Kafka API Key that is owned by '${var.name}' service account"
  owner {
    id          = confluent_service_account.sa-cluster[count.index].id
    api_version = confluent_service_account.sa-cluster[count.index].api_version
    kind        = confluent_service_account.sa-cluster[count.index].kind
  }

  managed_resource {
    id          = confluent_kafka_cluster.cluster[0].id
    api_version = confluent_kafka_cluster.cluster[0].api_version
    kind        = confluent_kafka_cluster.cluster[0].kind

    environment {
      id = confluent_environment.env[0].id
    }
  }

  depends_on = [confluent_service_account.sa-cluster]
}

##############################################################################
# Kafka Topics
################################################################################

# Describe an Environment
data "confluent_environment" "env" {
  count        = var.create_topics ? 1 : 0
  display_name = var.environment
}

# Describe a Kafka cluster
data "confluent_kafka_cluster" "cluster" {
  count        = var.create_topics ? 1 : 0
  display_name = var.name
  environment {
    id = data.confluent_environment.env[count.index].id
  }
}

# Creating topics
resource "confluent_kafka_topic" "topics" {

  kafka_cluster {
    id = data.confluent_kafka_cluster.cluster[0].id
  }

  for_each = {
    for topic in var.topics : topic.name => topic
    if topic.exists != true && var.create_topics == true
  }

  topic_name       = each.value.name
  partitions_count = each.value.partitions
  rest_endpoint    = data.confluent_kafka_cluster.cluster[0].rest_endpoint

  config = {
    "cleanup.policy" = "delete"
    "retention.ms"   = each.value.retention
  }

}

# Creating service account
resource "confluent_service_account" "sa-topics" {
  count        = var.create_topics ? 1 : 0
  display_name = "${var.project}-${var.environment}"
  description  = "Service account to manage Kafka topics"
}

# Creating api key by product or project
resource "confluent_api_key" "key-topics" {
  count = var.create_topics ? 1 : 0

  display_name = var.project
  description  = "Kafka API Key that is owned by '${var.project}' service account"

  owner {
    id          = confluent_service_account.sa-topics[count.index].id
    api_version = confluent_service_account.sa-topics[count.index].api_version
    kind        = confluent_service_account.sa-topics[count.index].kind
  }

  managed_resource {
    id          = data.confluent_kafka_cluster.cluster[0].id
    api_version = data.confluent_kafka_cluster.cluster[0].api_version
    kind        = data.confluent_kafka_cluster.cluster[0].kind

    environment {
      id = data.confluent_environment.env[0].id
    }
  }

  depends_on = [confluent_service_account.sa-topics]
}


# Creating acl with GROUP resource type 
resource "confluent_kafka_acl" "acl-group" {
  count = var.create_topics ? 1 : 0
  kafka_cluster {
    id = data.confluent_kafka_cluster.cluster[0].id
  }

  operation     = "READ"
  resource_type = "GROUP"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.sa-topics[0].id}"
  host          = "*"
  permission    = "ALLOW"
  rest_endpoint = data.confluent_kafka_cluster.cluster[0].rest_endpoint

}

locals {
  filtered_topics = [
    for topic in var.topics :
    [
      for operation in var.operations :
      {
        name      = topic.name
        operation = operation
      }
    ]
  ]
}

# Creating acl with TOPIC resource type for READ and WRITE
resource "confluent_kafka_acl" "acl-topics" {

  for_each = {
    for topic_operation in flatten(local.filtered_topics) :
    "${topic_operation.name}-${topic_operation.operation}" => topic_operation
    if var.create_topics == true
  }

  kafka_cluster {
    id = data.confluent_kafka_cluster.cluster[0].id
  }

  operation     = each.value.operation
  resource_type = "TOPIC"
  resource_name = each.value.name
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.sa-topics[0].id}"
  host          = "*"
  permission    = "ALLOW"
  rest_endpoint = data.confluent_kafka_cluster.cluster[0].rest_endpoint

  depends_on = [
    confluent_kafka_topic.topics
  ]
}

# Creating acl with TOPIC resource type for READ
resource "confluent_kafka_acl" "acl-topics-read" {

  for_each = {
    for topic in var.topics: topic.name => topic
      if topic.exists == true
  }

  kafka_cluster {
    id = data.confluent_kafka_cluster.cluster[0].id
  }

  operation     = "READ"
  resource_type = "TOPIC"
  resource_name = each.value.name
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.sa-topics[0].id}"
  host          = "*"
  permission    = "ALLOW"
  rest_endpoint = data.confluent_kafka_cluster.cluster[0].rest_endpoint
}