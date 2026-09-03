terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-ug3-rg"
    storage_account_name = "tfstate32714"
    container_name       = "tfstate"
    key                  = "uppgift3.terraform.tfstate"
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
}

# Resursgrupp
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Nätverksmodul
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

# App-server (Publik IP aktiverad)
module "app_server" {
  source              = "./modules/compute"
  vm_name             = "app-vm"
  public_ip_name      = "pip-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = module.network.app_subnet_id
  enable_public_ip    = true
  ssh_public_key_path = var.ssh_public_key_path
}

# Databasserver (Ingen publik IP)
module "db_server" {
  source              = "./modules/compute"
  vm_name             = "db-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = module.network.db_subnet_id
  enable_public_ip    = false
  ssh_public_key_path = var.ssh_public_key_path
}

# Bastion Host
module "bastion" {
  source              = "./modules/bastion"
  bastion_name        = "bastion-host"
  pip_name            = "pip-bastion"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = module.network.bastion_subnet_id
}