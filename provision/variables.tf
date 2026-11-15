variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

# Linux ASP variables
variable "enable_linux_asp" {
  description = "Enable or disable Linux App Service Plan"
  type        = bool
  default     = true
}

variable "linux_asp_name" {
  description = "Linux App Service Plan name"
  type        = string
}

variable "linux_asp_sku" {
  description = "Linux App Service Plan SKU"
  type        = string
}

# Windows ASP variables
variable "enable_windows_asp" {
  description = "Enable or disable Windows App Service Plan"
  type        = bool
  default     = true
}

variable "windows_asp_name" {
  description = "Windows App Service Plan name"
  type        = string
}

variable "windows_asp_sku" {
  description = "Windows App Service Plan SKU"
  type        = string
}
