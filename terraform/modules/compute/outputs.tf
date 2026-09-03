output "vm_id" {
  value       = azurerm_linux_virtual_machine.vm.id
  description = "Resurs-ID för virtuell maskin"
}

output "private_ip" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "Privat IP-adress för nätverkskortet"
}

output "public_ip" {
  value       = var.enable_public_ip ? azurerm_public_ip.pip[0].ip_address : null
  description = "Publik IP-adress (null om avstängd)"
}