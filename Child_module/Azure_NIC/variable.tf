variable "nic_name" {
  description = "The name of the network interface"
  type        = string
  
}
variable "nic_location" {
  description = "The location of the network interface"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration"
  type        = string
}

# variable "subnet_id" {
#   description = "The ID of the subnet"
#   type        = string
# }

variable "private_ip_address_allocation" {
  description = "The private IP address allocation method"
  type        = string
}





