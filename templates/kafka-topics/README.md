```sh
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kafka"></a> [kafka](#module\_kafka) | git::git@github.com:ramiroduarteavalos/example_to_learn_terraform.git//modules/kafka | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_api_key"></a> [cloud\_api\_key](#input\_cloud\_api\_key) | n/a | `string` | n/a | yes |
| <a name="input_cloud_api_secret"></a> [cloud\_api\_secret](#input\_cloud\_api\_secret) | n/a | `string` | n/a | yes |
| <a name="input_environments"></a> [environments](#input\_environments) | n/a | <pre>map(object({<br>    cluster = string<br>    environment = string<br>    create_topics = bool<br>    topics = list(object({<br>      name = string<br>      partitions = optional(number)<br>      retention = optional(string)<br>      exists = optional(bool, false)<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_kafka_api_key"></a> [kafka\_api\_key](#input\_kafka\_api\_key) | n/a | `string` | n/a | yes |
| <a name="input_kafka_api_secret"></a> [kafka\_api\_secret](#input\_kafka\_api\_secret) | n/a | `string` | n/a | yes |
| <a name="input_kafka_id"></a> [kafka\_id](#input\_kafka\_id) | n/a | `string` | n/a | yes |
| <a name="input_kafka_rest_endpoint"></a> [kafka\_rest\_endpoint](#input\_kafka\_rest\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_topics"></a> [topics](#output\_topics) | Component output |
```