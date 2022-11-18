packer {
  required_plugins {
    openstack = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/openstack"
    }
  }
}

variable "user_name" {}
variable "tenant_name" {}
variable "domain_name" {}
variable "image_id" {}
variable "flavor_name" {}
variable "image_name" {}
variable "region" {}
variable "auth_url" {}
variable "password" {}
variable "network_id" {}
variable "security_group_id" {}
variable "floating_ip_id" {}

source "openstack" "example" {
  domain_name       = var.domain_name
  flavor            = var.flavor_name
  identity_endpoint = var.auth_url
  image_name        = var.image_name
  insecure          = "true"
  password          = var.password
  region            = var.region
  source_image      = var.image_id
  ssh_username      = "cirros"
  tenant_name       = var.tenant_name
  username          = var.user_name
  networks =  [var.network_id]
  security_groups = [var.security_group_id]
  floating_ip=  var.floating_ip_id
}

build {
  sources = ["source.openstack.example"]
   post-processor "manifest" {
    output = "output.json"
    strip_path = true
    }
}

