terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }

     backend "azurerm" {
    resource_group_name = "todo-infra-rg" 
    storage_account_name = "infrastgmain"                                 
    container_name       = "todocon"                                  
    key                  = "infratodo.terraform.tfstate"                   
  }
}

provider "azurerm" {
 features {}
    subscription_id = "c3865c7c-745d-4121-96d0-d7b70aedb514"
}


   