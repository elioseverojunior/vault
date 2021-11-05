provider "vault" {
  address   = var.vault_address
  namespace = var.vault_auth_login_namespace
  token     = var.vault_token
  # auth_login {
  #   path      = var.vault_auth_login_path
  #   method    = "aws"
  #   namespace = var.vault_auth_login_namespace
  #   parameters = {
  #     role      = "k8s-role"
  #     namespace = var.vault_auth_login_namespace
  #   }
  # }
}
