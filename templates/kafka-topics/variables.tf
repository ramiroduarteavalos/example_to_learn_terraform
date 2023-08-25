variable "cloud_api_key" {
  type = string
  sensitive = true
}

variable "cloud_api_secret" {
  type = string
  sensitive = true
}

variable "kafka_id" {
  type = string
  sensitive = true
}

variable "kafka_api_key" {
  type = string
  sensitive = true
}

variable "kafka_api_secret" {
  type = string
  sensitive = true
}

variable "kafka_rest_endpoint" {
  type = string
  sensitive = true
}

variable "project" {
  type = string
}

variable "environments" {
  type = map(object({
    cluster = string
    environment = string
    create_topics = bool
    topics = list(object({
      name = string
      partitions = optional(number)
      retention = optional(string)
      exists = optional(bool, false)
    }))
  }))
}