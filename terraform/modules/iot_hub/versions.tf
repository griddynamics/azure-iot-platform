terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.47.0, < 4.0.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }

  }

  required_version = "~> 1.5.0"
}
