output "instanceid" {
value = google_compute_instance.vm_instance.name
}



output "networkid" {
value = google_compute_network.vpc_network.id
}
