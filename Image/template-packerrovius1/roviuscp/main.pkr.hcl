variable "cloudstack_api_url" {}
variable "cloudstack_api_key" {}
variable "cloudstack_secret_key" {}
variable "zone" {}
variable "network" {}
variable "template_password_enabled" {}
variable "disk_offering" {}
variable "template_scalable" {}
variable "template_os" {}
variable "template_name" {}
variable "template_featured" {}
variable "service_offering" {}
variable "template_display_text" {}
variable "ssh_username" {}
variable "ssh_password" {}
variable "source_template" {}

packer {
 required_plugins {
    cloudstack = {
        version = ">=1.0.0"
        source = "github.com/hashicorp/cloudstack"
        }
    }
}
source "cloudstack" "sampletemplate" {
    api_key = var.cloudstack_api_key
    api_url = var.cloudstack_api_url
    disk_offering = var.disk_offering
    network = var.network
    secret_key = var.cloudstack_secret_key
    service_offering = var.service_offering
    source_template = var.source_template
    ssh_username = var.ssh_username
    ssh_password = var.ssh_password
    template_display_text = var.template_display_text
    template_featured = var.template_featured
    template_name = var.template_name
    template_os = var.template_os
    template_password_enabled = var.template_password_enabled
    template_scalable = var.template_scalable
    zone = var.zone
    expunge = true
}

build {
 sources = ["source.cloudstack.sampletemplate"]
 post-processor "manifest" {
    output = "output.json"
    strip_path = true
    }
}


