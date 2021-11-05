variable "market" {
  description = "(Optional) Market ID"
  type        = string
  default     = "us"
}

variable "environment" {
  description = "(Optional) Environment Name"
  type        = string
  default     = "dev01"
}

variable "application" {
  description = "(Optional) Application Name"
  type        = string
  default     = "devops"
}

variable "capability" {
  description = "(Optional) Capability Name"
  type        = string
  default     = "devops"
}

variable "aws_role_name" {
  description = "(Optional) AWS Role Name"
  type        = string
  default     = "DevSecOpsAdminRole"
}

variable "vault_aws_role_name" {
  description = "(Optional) Vault Cross Account AWS Role Name"
  type        = string
  default     = ""
}

variable "vault_address" {
  description = "(Required) Vault Address"
  type        = string
}

variable "vault_token" {
  description = "(Required) Vault Token"
  type        = string
  sensitive   = true
  default     = ""
}

variable "vault_capabilities" {
  description = "(Optional) Vault Rules Capablities Access. E.g [\"create\", \"read\", \"update\", \"delete\", \"list\"]"
  type        = list(string)
  default     = ["create", "read", "update", "delete", "list"]
}

variable "vault_auth_login_path" {
  description = "(Optional) Vault Auth Login Path"
  type        = string
  default     = "auth/aws/login"
}

variable "vault_auth_login_namespace" {
  description = "(Required) Vault Namespace"
  type        = string
}

variable "aws_role_max_session_duration" {
  description = "(Optional) AWS Role Max Session Duration"
  type        = number
  validation {
    condition     = ((var.aws_role_max_session_duration >= 3600) && (var.aws_role_max_session_duration <= 43200))
    error_message = "The variable can not be lower than 3600 and greater than 43200."
  }
  default = 3600
}

variable "tags" {
  description = "(Optional) AWS Resource Tags"
  type        = map(any)
  default     = {}
}
