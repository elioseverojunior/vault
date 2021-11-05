## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.64.1 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 2.24.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.64.1 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 2.24.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.vault_aws_iam_assume_role](https://registry.terraform.io/providers/hashicorp/aws/3.64.1/docs/resources/iam_role) | resource |
| [vault_aws_auth_backend_role.vault_iam_auth_role](https://registry.terraform.io/providers/hashicorp/vault/2.24.1/docs/resources/aws_auth_backend_role) | resource |
| [vault_aws_secret_backend.aws](https://registry.terraform.io/providers/hashicorp/vault/2.24.1/docs/resources/aws_secret_backend) | resource |
| [vault_aws_secret_backend_role.admin](https://registry.terraform.io/providers/hashicorp/vault/2.24.1/docs/resources/aws_secret_backend_role) | resource |
| [vault_policy.vault_policy](https://registry.terraform.io/providers/hashicorp/vault/2.24.1/docs/resources/policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/3.64.1/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.vault_aws_iam_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/3.64.1/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_role.pod_assume_role](https://registry.terraform.io/providers/hashicorp/aws/3.64.1/docs/data-sources/iam_role) | data source |
| [aws_iam_role.vault_cross_account_aws_role](https://registry.terraform.io/providers/hashicorp/aws/3.64.1/docs/data-sources/iam_role) | data source |
| [vault_policy_document.vault_policy_rule](https://registry.terraform.io/providers/hashicorp/vault/2.24.1/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | (Optional) Application Name | `string` | `"devops"` | no |
| <a name="input_aws_role_max_session_duration"></a> [aws\_role\_max\_session\_duration](#input\_aws\_role\_max\_session\_duration) | (Optional) AWS Role Max Session Duration | `number` | `3600` | no |
| <a name="input_aws_role_name"></a> [aws\_role\_name](#input\_aws\_role\_name) | (Optional) AWS Role Name | `string` | `"DevSecOpsAdminRole"` | no |
| <a name="input_capability"></a> [capability](#input\_capability) | (Optional) Capability Name | `string` | `"devops"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Optional) Environment Name | `string` | `"dev01"` | no |
| <a name="input_market"></a> [market](#input\_market) | (Optional) Market ID | `string` | `"us"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) AWS Resource Tags | `map(any)` | `{}` | no |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | (Required) Vault Address | `string` | n/a | yes |
| <a name="input_vault_auth_login_namespace"></a> [vault\_auth\_login\_namespace](#input\_vault\_auth\_login\_namespace) | (Required) Vault Namespace | `string` | n/a | yes |
| <a name="input_vault_auth_login_path"></a> [vault\_auth\_login\_path](#input\_vault\_auth\_login\_path) | (Optional) Vault Auth Login Path | `string` | `"auth/aws/login"` | no |
| <a name="input_vault_aws_role_name"></a> [vault\_aws\_role\_name](#input\_vault\_aws\_role\_name) | (Optional) Vault Cross Account AWS Role Name | `string` | `""` | no |
| <a name="input_vault_capabilities"></a> [vault\_capabilities](#input\_vault\_capabilities) | (Optional) Vault Rules Capablities Access. E.g ["create", "read", "update", "delete", "list"] | `list(string)` | <pre>[<br>  "create",<br>  "read",<br>  "update",<br>  "delete",<br>  "list"<br>]</pre> | no |
| <a name="input_vault_token"></a> [vault\_token](#input\_vault\_token) | (Required) Vault Token | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_caller_identity_account_id"></a> [aws\_caller\_identity\_account\_id](#output\_aws\_caller\_identity\_account\_id) | Vault Aws Role |
| <a name="output_backend"></a> [backend](#output\_backend) | n/a |
| <a name="output_role"></a> [role](#output\_role) | n/a |
| <a name="output_vault_aws_iam_assume_role"></a> [vault\_aws\_iam\_assume\_role](#output\_vault\_aws\_iam\_assume\_role) | Vault Aws Role |
| <a name="output_vault_cross_account_aws_role"></a> [vault\_cross\_account\_aws\_role](#output\_vault\_cross\_account\_aws\_role) | Vault Aws Role |
| <a name="output_vault_policies"></a> [vault\_policies](#output\_vault\_policies) | Vault Document Policies |
