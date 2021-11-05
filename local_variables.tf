
locals {
  environment_prefix = replace(lower(var.environment), "/\\d{1,}/", "")
  environment_number = format("%02s", replace(lower(var.environment), "/\\D{3,}/", ""))
  environment        = (local.environment_prefix == "stage" ? format("stg%s", local.environment_number) : (local.environment_number == "00" ? format("%s01", local.environment_prefix) : format("%s%s", local.environment_prefix, local.environment_number)))
  role_name          = lower(format("%s-%s-%s-%s", var.market, local.environment, var.capability, var.application))
  vault_role_name    = lower(replace(local.role_name, "-", "_"))
}