provider "openstack" {
  user_name   = var.user_name
  tenant_name = var.tenant_name
  domain_name = var.domain_name
  password    = var.password
  auth_url    = var.auth_url
  region      = var.region
}

resource "openstack_compute_instance_v2" "basic" {
  name            = var.instance_name
  image_id        = var.image_id
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = [var.security_group_id]
block_device {
    uuid                  = var.image_id
    source_type           = "image"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
    volume_size = var.volume_size
  }
  network {
    uuid = var.network_id
  }
  user_data       = var.user_data
}



resource "openstack_blockstorage_volume_v2" "volume_1" {
  size = var.volume_size
  name = var.volume_name
}
resource "openstack_compute_volume_attach_v2" "va_1" {
  volume_id   = "${openstack_blockstorage_volume_v2.volume_1.id}"
  instance_id = "${openstack_compute_instance_v2.basic.id}"
}