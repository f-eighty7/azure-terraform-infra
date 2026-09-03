variable "vm_name" {
  type        = string
  description = "Namnet på den virtuella maskinen"
}

variable "location" {
  type        = string
  description = "Azure-regionen"
}

variable "resource_group_name" {
  type        = string
  description = "Namnet på resursgruppen"
}

variable "subnet_id" {
  type        = string
  description = "Subnäts-ID där nätverkskortet ska placeras"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2ats_v2"
  description = "Storlek på virtuell maskin"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Administratörsanvändarnamn"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Sökväg till lokal publik SSH-nyckel"
}

variable "enable_public_ip" {
  type        = bool
  default     = false
  description = "Styr om publik IP ska allokeras till nätverkskortet"
}

variable "public_ip_name" {
  type        = string
  default     = null
  description = "Valfritt anpassat namn på den publika IP-resursen"
}