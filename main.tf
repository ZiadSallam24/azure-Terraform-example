terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
}

provider "azurerm" {
  features {
        resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
    subscription_id = "7316150c-a2e6-41d4-b67a-6a988553edb7"

}

resource "azurerm_resource_group" "example" {
  name     = "azure-terraform-rg"
  location = "uaenorth"
}

resource "azurerm_storage_account" "example" {
  name                     = "terraformsacc123zz"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}