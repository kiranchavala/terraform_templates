output "instanceid" {
  description = "instance id"
  value       = openstack_compute_instance_v2.basic.id
}

output "flavor_name" {
  description = "flavor_name"
  value       = openstack_compute_instance_v2.basic.flavor_name
}

output "networkid" {
  description = "instance network uuid"
  value       = var.network_id
}

output "ipaddress" {
  description = "instance ip address"
  value       = openstack_compute_instance_v2.basic.access_ip_v4
}
output "volumeid" {
  description = "volume_id"
  value       = openstack_blockstorage_volume_v2.volume_1.id
}

output "volume_size" {
  description = "volume_size"
  value       = openstack_blockstorage_volume_v2.volume_1.size
  
}