output "cluster" {
  value = module.kafka.cluster
  description = "Component output"
  sensitive = true
}