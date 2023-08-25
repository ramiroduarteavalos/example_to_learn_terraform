variable "cloud_api_key" {
  type = string
  sensitive = true
}

variable "cloud_api_secret" {
  type = string
  sensitive = true
}

variable "environments" {
  type = map(object({
    name = string
    create_cluster = bool
    environment = string
    availability = string
    cloud = string
    region = string
    cluster_type = optional(string)
    dedicated_cku = optional(number)
  }))
}