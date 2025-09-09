module "resource_group" {
  source = "../Child_module/Azure_Resource_Group"
  resource_group_name     = "todorg"
  resource_group_location = "Central India" 
}

module "storage_account" {
    depends_on = [ module.resource_group ]
  source = "../Child_module/Azure_Storage_Ac"
  storage_account_name       = "todostgac"
  storage_account_location   = "Central India"
  resource_group_name        = "todorg"
  account_tier               = "Standard"
  account_replication_type   = "LRS"
  
}

module "vnet" {
    depends_on = [ module.resource_group ]
  source = "../Child_module/Azure_Virtual_Network"
  vnet_name          = "todovnet"
  resource_group_name = "todorg"
  address_space = ["10.0.0.0/16"]
  vnet_location      = "Central India"
  
}


module "frontend_subnet" {
    depends_on = [module.vnet]
  
  source     = "../Child_module/Azure_Subnet"
  resource_group_name  = "todorg"
  vnet_name = "todovnet"
  subnet_name          = "frontend-subnet"
  address_prefixes     = ["10.0.1.0/24"]

}

module "backend_subnet" {
  depends_on = [module.vnet]
  source     = "../Child_module/Azure_Subnet"

  resource_group_name  = "todorg"
  vnet_name = "todovnet"
  subnet_name          = "backend-subnet"
  address_prefixes     = ["10.0.2.0/24"]
}

module "network_interface" {
    depends_on = [module.frontend_subnet, module.backend_subnet]
  source                = "../Child_module/Azure_NIC"
  resource_group_name   = "todorg"                    
  nic_location          = "Central India"
  nic_name              = "todo-nic"
  ip_configuration_name = "todo-ip-config"
  #subnet_id      = module.subnet.subnet_id
  private_ip_address_allocation = "Dynamic"
}

module "public_ip" {
  depends_on = [module.network_interface]
  source     = "../Child_module/Azure_Public_IP"
  resource_group_name  = "todorg"
  public_ip_name       = "todopublicip"
  public_ip_location   = "Central India"
  allocation_method    = "Dynamic"
  
}



# module "virtual_machine_frontend" {
#     depends_on = [module.public_ip, module.network_interface, module.resource_group]
#   source                      = "../Child_module/Azure_VMs"
#   resource_group_name         = "todorg"
#   vm_name                     = "backendtodovm"
#   vm_location                 = "Central India"
#   vm_size                     = "Standard_B1s"
#   admin_username              = "sumit"
#   admin_password              = "Supp0rt@123@#"
#   virtual_network_name = "todovnet"
#   disable_password_authentication = false
#   subnet_name = "frontend_subnet"
#   public_ip_name                 = module.public_ip.public_ip_name
#   network_interface_id        = data.network_interface.network_interface_id.id
#   computer_name = "todofrontend"
#   os_disk_caching             = "ReadWrite"
#   os_disk_storage_account_type = "Standard_LRS"
#   source_image_reference      = {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "22.04-LTS"
#     version   = "latest"
#   }
  
# }

# module "virtual_machine_backend" {
#     depends_on = [module.public_ip, module.network_interface, module.resource_group]
#   source                      = "../Child_module/Azure_VMs"
#   resource_group_name         = "todorg"
#   vm_name                     = "backendtodovm"
#   vm_location                 = "Central India"
#   vm_size                     = "Standard_B1s"
#   admin_username              = "sumit"
#   admin_password              = "Supp0rt@123@#"
#   virtual_network_name = "todovnet"
#   disable_password_authentication = false
#   subnet_name = "backend_subnet"
#   public_ip_name                 = module.public_ip.public_ip_name
#   network_interface_id        = data.network_interface.network_interface_id.id
#   computer_name = "todobackend"
#   os_disk_caching             = "ReadWrite"
#   os_disk_storage_account_type = "Standard_LRS"
#   source_image_reference      = {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "22.04-LTS"
#     version   = "latest"
#   }
  
# }
