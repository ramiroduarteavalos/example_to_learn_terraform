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
| <a name="input_environments"></a> [environments](#input\_environments) | n/a | <pre>map(object({<br>    name = string<br>    create_cluster = bool<br>    environment = string<br>    availability = string<br>    cloud = string<br>    region = string<br>    cluster_type = optional(string)<br>    dedicated_cku = optional(number)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | Component output |
```