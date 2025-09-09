variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  
}

variable "vm_location" {
  description = "The location of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username of the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password of the virtual machine"
  type        = string
}

variable "os_disk_caching" {
  description = "The caching type of the OS disk"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "The storage account type of the OS disk"
  type        = string
}

variable "source_image_reference" {
  description = "The source image reference of the virtual machine"
  type        = map(string)
}

variable "computer_name" {
  description = "The computer name of the virtual machine"
  type        = string
}

variable "disable_password_authentication" {
  description = "Whether to disable password authentication"
  type        = bool
}

variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
}

variable "subnet_name" {
  description = "The ID of the subnet"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}




