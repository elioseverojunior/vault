output "aws_caller_identity_account_id" {
  description = "Vault Aws Role"
  value       = data.aws_caller_identity.current.account_id
}

output "vault_cross_account_aws_role" {
  description = "Vault Aws Role"
  value       = data.aws_iam_role.vault_cross_account_aws_role
}

output "vault_policies" {
  description = "Vault Document Policies"
  value       = data.aws_iam_policy_document.vault_aws_iam_assume_role_policy.json
}

output "vault_aws_iam_assume_role" {
  description = "Vault Aws Role"
  value       = aws_iam_role.vault_aws_iam_assume_role
}

output "backend" {
  value = vault_aws_secret_backend.aws.path
}

output "role" {
  value = vault_aws_secret_backend_role.admin.name
}
