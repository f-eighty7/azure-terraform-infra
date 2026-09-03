variable "resource_group_name" {
  type        = string
  description = "Namnet på resursgruppen"
}

variable "location" {
  type        = string
  description = "Azure-regionen"
}

variable "vnet_name" {
  type        = string
  default     = "uppgift3-vnet"
  description = "Namnet på virtuellt nätverk"
}

variable "address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Adressrymd för VNet"
}