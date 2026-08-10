variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "ayman-tf-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada Central"
}

variable "vm_name" {
  description = "Name of the Ubuntu VM"
  type        = string
  default     = "ayman-vm"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_D2als_v6"
}

variable "admin_username" {
  description = "Administrator username"
  type        = string
  default     = "ayman"
}