terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id   = "9c2e0e5d-9337-4855-af79-231071eb6983"
}

provider "archive" {}