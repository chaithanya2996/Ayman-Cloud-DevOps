variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "ayman-rg"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "Canada Central"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "stracc1ayman05aug2026"
}

variable "str_count" {
  description = "The tier of the storage account"
  type        = number
  default     = 5
}
