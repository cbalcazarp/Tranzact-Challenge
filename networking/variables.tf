variable "base_name" {
  type = string
}

variable "location" {
  type = string
  description = "This defines the location"
}

variable "virtual_network_address_space" {
  type = list(string)
  description = "This defines the virtual network address space"
}

variable "address_prefixes" {
  type = list(string)
  description = "This defines the subnet address space"
}

variable "owner_name" {
  type = string
  description = "This defines the owner's name"  
}