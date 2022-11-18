packer {
  required_plugins {
    googlecompute = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/googlecompute"
    }
  }
}

variable "project_id" {}
variable "source_image" {}
variable "ssh_username" {}
variable "zone" {}
variable "region" {}
variable "machine_type" {}
variable "image_description" {}
variable "image_name" {}
variable "disk_size" {}
variable "network" {}
variable "subnetwork" {}

variable "type" {}
variable "private_key_id" {}
variable "private_key" {}
variable "client_id" {}
variable "client_email" {}
variable "auth_uri" {}
variable "token_uri" {}
variable "auth_provider_x509_cert_url" {}
variable "client_x509_cert_url" {}

source "googlecompute" "ubuntu" {
 account_file = "variables.pkrvars.json"
 project_id  = var.project_id
 source_image = var.source_image
 ssh_username = var.ssh_username 
 zone = var.zone
 region = var.region
 machine_type = var.machine_type
 image_description = var.image_description
 image_name = var.image_name
 disk_size = var.disk_size
 network = var.network
 subnetwork = var.subnetwork
 disable_default_service_account =true

}

build {
  sources = ["sources.googlecompute.ubuntu"]
  post-processor "manifest" {
    output = "output.json"
    strip_path = true
    }
  }