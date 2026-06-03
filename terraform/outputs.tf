output "resource_group_id" {
  description = "Resource group ID"
  value       = azurerm_resource_group.tfstate.id
}

output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.tfstate.name
}

output "storage_account_id" {
  description = "Storage account ID for Terraform state"
  value       = azurerm_storage_account.tfstate.id
}

output "storage_account_name" {
  description = "Storage account name"
  value       = azurerm_storage_account.tfstate.name
}

output "storage_container_name" {
  description = "Storage container name for Terraform state"
  value       = azurerm_storage_container.tfstate.name
}

output "backend_config_example" {
  description = "Example backend configuration for terraform init"
  value       = "terraform init -backend-config='resource_group_name=${azurerm_resource_group.tfstate.name}' -backend-config='storage_account_name=${azurerm_storage_account.tfstate.name}' -backend-config='container_name=${azurerm_storage_container.tfstate.name}' -backend-config='key=terraform.tfstate'"
}
