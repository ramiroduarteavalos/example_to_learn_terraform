output "topics" {
  value = module.kafka.topics
  description = "Component output"
  sensitive = true
}