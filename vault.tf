data "vault_policy_document" "vault_policy_rule" {
  rule {
    path         = "secret/*"
    capabilities = var.vault_capabilities
    description  = "Vault Policy Rule"
  }
}

resource "vault_policy" "vault_policy" {
  name   = "${local.vault_role_name}_policy"
  policy = data.vault_policy_document.vault_policy_rule.hcl
}

resource "vault_aws_secret_backend" "aws" {
  path                      = var.vault_auth_login_path
  default_lease_ttl_seconds = "120"
  max_lease_ttl_seconds     = "240"
}

resource "vault_aws_secret_backend_role" "admin" {
  backend         = vault_aws_secret_backend.aws.path
  credential_type = "assumed_role"
  name            = local.vault_role_name
  policy_document = data.aws_iam_policy_document.vault_aws_iam_assume_role_policy.json
  role_arns       = toset([data.aws_iam_role.vault_cross_account_aws_role.arn])
}

resource "vault_aws_auth_backend_role" "vault_iam_auth_role" {
  backend                  = vault_aws_secret_backend.aws.path
  role                     = local.vault_role_name
  auth_type                = "iam"
  bound_iam_principal_arns = [data.aws_iam_role.vault_cross_account_aws_role.arn]
  token_ttl                = 60
  token_max_ttl            = 120
  token_policies           = ["default", "dev", "prod"]
}
