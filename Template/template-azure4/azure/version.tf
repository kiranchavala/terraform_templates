terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
      kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
  }
  }

  required_version = ">= 0.14"
}

