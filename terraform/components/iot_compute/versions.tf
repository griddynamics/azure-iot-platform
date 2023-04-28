terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.47.0, < 4.0.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }

  required_version = "~> 1.4.0"
}
