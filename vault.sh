# Create policy with required permissions
vault policy write us-dev01-payments/devops - <<EOF
path "secret*" {
    capabilities = ["read"]
}
path "auth/token/create" {
    capabilities = ["create", "read", "update"]
}
EOF
 
# enable aws auth engine
vault auth enable aws
 
# configure aws cross account access assumption to vault
vault write auth/aws/config/sts/607546651489 sts_role=arn:aws:iam::607546651489:role/vault-cross-account-access
 
# Create a vault role and bind it with policy created earlier
vault write auth/aws/role/devopspoc auth_type=iam bound_iam_principal_arn="arn:aws:iam::607546651489:role/DevSecOpsAdminRole" policies=us-dev01-payments ttl=24h