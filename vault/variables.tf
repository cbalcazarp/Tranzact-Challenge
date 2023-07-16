variable "base_name" {
  type = string
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "location" {
  type = string
  description = "The location for the deployment"
}

variable "enabled_for_disk_encryption" {
  type = bool
  description = "This describes if disk encryption should be enabled"
}

variable "soft_delete_retention_days" {
  type = number
  description = "This describes the days retention policy for soft delete"
}

variable "purge_protection_enabled" {
  type = bool
  description = "This describes the protection for purge"
}

variable "sku_name" {
  type = string
  description = "This describes the sku for the service"
}

variable "bypass" {
  type = string
  description = "This describes which traffic can bypass the network rules"
}

variable "default_action" {
  type = string
  description = "This describes the default action for network rules section"
}

variable "ip_rules" {
  type = list(string)
  description = "This describes the list of ips allowed to access"
}

variable "virtual_network_subnet_ids" {
  type = list(string)
  description = "This describes the list subnet ids allowed to access"
}

variable "owner_name" {
  type = string
  description = "This defines the owner's name"  
}
