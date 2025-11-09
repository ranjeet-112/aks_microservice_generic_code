terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ran_rg"
    storage_account_name = "ranjeetsingh112"
    container_name       = "ranjeetcontainer"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "85002d33-efb7-4e6a-8e6d-7457837654e2"
}
