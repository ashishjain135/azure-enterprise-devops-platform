terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  backend "azurerm" {
  use_oidc             = true
  use_azuread_auth     = true
  resource_group_name  = "rg-aedp-tfstate"
  storage_account_name = "staedptfstate001"
  container_name       = "tfstate"
  key                  = "preprod.tfstate"
}
}

provider "azurerm" {
  features {}
}
