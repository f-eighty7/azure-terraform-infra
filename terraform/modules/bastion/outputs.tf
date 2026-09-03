output "bastion_id" {
  value       = azurerm_bastion_host.bastion.id
  description = "Resurs-ID för Azure Bastion"
}

output "bastion_dns_name" {
  value       = azurerm_bastion_host.bastion.dns_name
  description = "FQDN för Bastion Host"
}