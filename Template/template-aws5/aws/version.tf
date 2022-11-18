terraform {
  required_providers {
  aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
     
    }
      kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
  }
  }

  required_version = ">= 0.14"
}
