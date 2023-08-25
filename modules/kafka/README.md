```sh
## Checklist

- [x] Provider authentication
- [x] Create kafka cluster
- [x] Create kafka topics
- [x] Create kafka acls

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | 1.50.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_confluent"></a> [confluent](#provider\_confluent) | 1.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [confluent_api_key.key-cluster](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/api_key) | resource |
| [confluent_api_key.key-topics](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/api_key) | resource |
| [confluent_environment.env](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/environment) | resource |
| [confluent_kafka_acl.acl-group](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/kafka_acl) | resource |
| [confluent_kafka_acl.acl-topics](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/kafka_acl) | resource |
| [confluent_kafka_acl.acl-topics-read](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/kafka_acl) | resource |
| [confluent_kafka_cluster.cluster](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/kafka_cluster) | resource |
| [confluent_kafka_topic.topics](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/kafka_topic) | resource |
| [confluent_role_binding.org](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/role_binding) | resource |
| [confluent_service_account.sa-cluster](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/service_account) | resource |
| [confluent_service_account.sa-topics](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/resources/service_account) | resource |
| [confluent_environment.env](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/data-sources/environment) | data source |
| [confluent_kafka_cluster.cluster](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/data-sources/kafka_cluster) | data source |
| [confluent_organization.org](https://registry.terraform.io/providers/confluentinc/confluent/1.50.0/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability"></a> [availability](#input\_availability) | n/a | `string` | `"SINGLE_ZONE"` | no |
| <a name="input_cloud"></a> [cloud](#input\_cloud) | n/a | `string` | `"AWS"` | no |
| <a name="input_cloud_api_key"></a> [cloud\_api\_key](#input\_cloud\_api\_key) | n/a | `string` | n/a | yes |
| <a name="input_cloud_api_secret"></a> [cloud\_api\_secret](#input\_cloud\_api\_secret) | n/a | `string` | n/a | yes |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | n/a | `string` | `"basic"` | no |
| <a name="input_create_cluster"></a> [create\_cluster](#input\_create\_cluster) | n/a | `bool` | `false` | no |
| <a name="input_create_topics"></a> [create\_topics](#input\_create\_topics) | n/a | `bool` | `false` | no |
| <a name="input_dedicated_cku"></a> [dedicated\_cku](#input\_dedicated\_cku) | n/a | `number` | `0` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_kafka_api_key"></a> [kafka\_api\_key](#input\_kafka\_api\_key) | n/a | `string` | `""` | no |
| <a name="input_kafka_api_secret"></a> [kafka\_api\_secret](#input\_kafka\_api\_secret) | n/a | `string` | `""` | no |
| <a name="input_kafka_id"></a> [kafka\_id](#input\_kafka\_id) | n/a | `string` | `""` | no |
| <a name="input_kafka_rest_endpoint"></a> [kafka\_rest\_endpoint](#input\_kafka\_rest\_endpoint) | n/a | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_operations"></a> [operations](#input\_operations) | n/a | `set(string)` | <pre>[<br>  "READ",<br>  "WRITE"<br>]</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-2"` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | n/a | <pre>list(object({<br>    name = optional(string, null)<br>    partitions = optional(number)<br>    retention = optional(string)<br>    exists = optional(bool, false)<br>  }))</pre> | <pre>[<br>  {}<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
| <a name="output_topics"></a> [topics](#output\_topics) | n/a |

```