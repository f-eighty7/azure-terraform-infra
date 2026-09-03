variable "bastion_name" {
  type        = string
  default     = "bastion-host"
  description = "Namnet på Azure Bastion-resursen"
}

variable "pip_name" {
  type        = string
  default     = "pip-bastion"
  description = "Namnet på den publika IP-adressen för Bastion"
}

variable "resource_group_name" {
  type        = string
  description = "Namnet på resursgruppen"
}

variable "location" {
  type        = string
  description = "Azure-regionen"
}

variable "subnet_id" {
  type        = string
  description = "Resurs-ID för AzureBastionSubnet"
}