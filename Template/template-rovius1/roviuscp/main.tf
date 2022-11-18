




# Configure the CloudStack Provider
provider "cloudstack" {
  api_url    = var.cloudstack_api_url
  api_key    = var.cloudstack_api_key
  secret_key = var.cloudstack_secret_key

}



# Set up the new vpc
resource "cloudstack_vpc" "vpctf1" {
  name         = var.vpc_name
  display_text = var.vpc_desc
  cidr         = var.vpc_super_cidr
  vpc_offering = var.vpc_offering
  zone         = var.zone
}

#Setup a default network ACL 
resource "cloudstack_network_acl" "default" {
  name   = "nw-acl-01"
  vpc_id = cloudstack_vpc.vpctf1.id
}
resource "cloudstack_network_acl_rule" "default" {
  acl_id = cloudstack_network_acl.default.id

  rule {
    action       = "allow"
    cidr_list    = ["0.0.0.0/0"]
    protocol     = "tcp"
    ports        = ["443", "80", "22"]
    traffic_type = "ingress"
  }
}



#Setup a subnet within the VPC 
resource "cloudstack_network" "subnet-1" {
  name             = var.subnet_name
  display_text     = var.subnet_desc
  cidr             = var.subnet_cidr
  network_offering = var.network_offering
  zone             = var.zone
  vpc_id           = cloudstack_vpc.vpctf1.id
}



resource "cloudstack_instance" "subnet-1VM" {
  name             = var.instance_name
  service_offering = var.instance_service_offering
  network_id       = cloudstack_network.subnet-1.id
  template         = var.instance_template
  zone             = var.zone
  user_data        = var.user_data
  expunge = true
  

  
}

resource "cloudstack_disk" "test-disk" {
  name               = "test-disk"
  attach             = "true"
  disk_offering      = var.disk_offering
  virtual_machine_id = cloudstack_instance.subnet-1VM.id
  zone               = var.zone

}
