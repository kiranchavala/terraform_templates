packer {
  required_plugins {
    azure = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/azure"
    }
  }
}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "managed_image_resource_group_name" {}
variable "managed_image_name" {}
variable "os_type" {}
variable "image_publisher" {}
variable "image_offer" {}
variable "image_sku" {}
variable "location" {}
variable "vm_size" {}

source "azure-arm" "ubuntu" {
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
    managed_image_resource_group_name = var.managed_image_resource_group_name
    managed_image_name = var.managed_image_name  
    os_type = var.os_type
    image_publisher = var.image_publisher
    image_offer = var.image_offer
    image_sku = var.image_sku
    location = var.location
    vm_size = var.vm_size
  
}

build {
  sources = ["sources.azure-arm.ubuntu"]
  post-processor "manifest" {
    output = "output.json"
    strip_path = true
    }
}
