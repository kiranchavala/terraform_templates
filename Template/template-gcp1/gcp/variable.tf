variable "project_id" {}

variable "region" {
  default="us-central1"
}
variable "zone" {
  default="us-central1-c"
}
variable "instance_name" {}

variable "machine_type" {
  default="f1-micro"
}
variable "network_name" {}

variable "private_key_id" {}

variable "client_x509_cert_url" {}

variable "boot_disk_image" {
  default ="debian-cloud/debian-10"
}

variable "subnetwork_name" {
  default = "test-subnetwork"
}
variable "subnet_ip_cidr_range" {
  default = "10.2.0.0/16"
}
variable "subnet_region" {
  default = "us-central1"
}

variable "user_data" {
  default = "echo hi > /test.txt"
}