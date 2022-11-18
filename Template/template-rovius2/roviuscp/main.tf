# Configure the CloudStack Provider
provider "cloudstack" {
  api_url    = var.cloudstack_api_url
  api_key    = var.cloudstack_api_key
  secret_key = var.cloudstack_secret_key

}



resource "cloudstack_instance" "subnet-1VM" {
  name             = var.instance_name
  service_offering = var.instance_service_offering
  network_id       = var.instance_network
  template         = var.instance_template
  zone             = var.zone
  user_data        = var.user_data
  expunge = true
}
