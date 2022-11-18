provider "cloudstack" {
  api_url    = var.cloudstack_api_url
  api_key    = var.cloudstack_api_key
  secret_key = var.cloudstack_secret_key

}


resource "cloudstack_network" "test-network" {
  name             = var.network_name
  cidr             = "10.0.0.0/24"
  network_offering = var.network_offering
  zone             = var.zone
  
}



resource "cloudstack_instance" "test-vm" {
  name             = var.instance_name
  service_offering = var.instance_service_offering
  network_id       = cloudstack_network.test-network.id
  template         = var.instance_template
  zone             = var.zone
  expunge = true
  depends_on = [
   cloudstack_network.test-network
 ]
}

resource "cloudstack_disk" "test-disk" {
  name               = "test-disk"
  attach             = "true"
  disk_offering      = var.disk_offering
  virtual_machine_id = cloudstack_instance.test-vm.id
  zone               = var.zone

}
