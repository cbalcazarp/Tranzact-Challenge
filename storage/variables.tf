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

variable "account_tier" {
  type = string
  description = "This describes the account tier"
}

variable "account_replication_type" {
  type = string
  description = "This describes the replication type"
}

variable "container_access_type" {
  type = string
  description = "This describes the access type to the container"
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

variable "bypass" {
  type = string
  description = "This specifies whether traffic is bypassed for Logging/Metrics/AzureServices"  
}