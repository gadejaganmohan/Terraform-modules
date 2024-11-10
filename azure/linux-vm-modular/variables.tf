variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default = "eastus-rg"
}

variable "location" {
  description = "Azure location for resources."
  type        = string
  default = "eastus"
}

variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
  default = "default-vm"
}

variable "vm_size" {
  description = "Size of the virtual machine."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM."
  type        = string
  default = "jagan"
}

variable "admin_password" {
  description = "Admin password for the VM."
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "subscription_id"
  type = string
  sensitive = true
}