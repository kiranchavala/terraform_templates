packer { 
  required_plugins {
    amazon = {
      version = ">=1.0.0"
      source  = "github.com/hashicorp/amazon"
     } 
    }
   }

variable "access_key" {}
variable "secret_key" {}
variable "ami_name" {}
variable "instance_type" {}
variable "region" {}
variable "source_ami" {}
variable "ssh_username" {}
variable "subnet_id" {}

source "amazon-ebs" "ubuntu" {

  access_key   = var.access_key
  secret_key   = var.secret_key
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  source_ami    = var.source_ami
  ssh_username  = var.ssh_username
  subnet_id        =  var.subnet_id
  force_deregister = true
  force_delete_snapshot= true
}

build {
  sources = ["source.amazon-ebs.ubuntu"]
  post-processor "manifest" {
    output = "output.json"
    strip_path = true
    }
}

