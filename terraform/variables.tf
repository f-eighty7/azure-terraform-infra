variable "location" {
  type        = string
  default     = "denmarkeast"
  description = "Azure-region för distributionen"
}

variable "resource_group_name" {
  type        = string
  default     = "uppgift3-rg"
  description = "Namnet på resursgruppen"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Lokal sökväg till publik SSH-nyckel"
}