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
  default = ""
  sensitive = true
}

variable "kafka_api_key" {
  type = string
  default = ""
  sensitive = true
}

variable "kafka_api_secret" {
  type = string
  default = ""
  sensitive = true
}

variable "kafka_rest_endpoint" {
  type = string
  default = ""
  sensitive = true
}

variable "create_cluster" {
  type = bool
  default = false
}

variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "availability" {
  type = string
  default = "SINGLE_ZONE"
}

variable "cloud" {
  type = string
  default = "AWS"
}

variable "region" {
  type = string
  default = "us-east-2"
}

variable "cluster_type" {
  type = string
  default = "basic"
}

variable "dedicated_cku" {
  type        = number
  default     = 0
}

variable "create_topics" {
  type = bool
  default = false
}

variable "operations" {
  type    = set(string)
  default = [ "READ", "WRITE" ]
}

variable "topics" {
  type = list(object({
    name = optional(string, null)
    partitions = optional(number)
    retention = optional(string)
    exists = optional(bool, false)
  }))
  default = [ {
    
  } ]
}

variable "project" {
  type = string
  default = null
}
