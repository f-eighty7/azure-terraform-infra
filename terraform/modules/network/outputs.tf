output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "ID för VNet"
}

output "app_subnet_id" {
  value       = azurerm_subnet.snet_app.id
  description = "ID för snet-app"
}

output "db_subnet_id" {
  value       = azurerm_subnet.snet_database.id
  description = "ID för snet-database"
}

output "bastion_subnet_id" {
  value       = azurerm_subnet.snet_bastion.id
  description = "ID för AzureBastionSubnet"
}