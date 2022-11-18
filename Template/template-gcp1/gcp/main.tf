


provider "google" {
    credentials = "${file("terraform.tfvars.json")}"
    project = var.project_id
    region = var.region
    zone = var.zone
  
}



resource "google_compute_instance" "vm_instance" {
    name = var.instance_name
    machine_type = var.machine_type
   
   boot_disk {
     initialize_params {
         image = var.boot_disk_image
     }
   }

   network_interface {
      # A default network is created for all GCP projects
      //network = "${google_compute_network.vpc_network.self_link}"
      subnetwork = google_compute_subnetwork.subnetwork.self_link
      access_config {
      // Ephemeral IP
    }
   }

   metadata_startup_script = var.user_data

}



resource "google_compute_network" "vpc_network" {
    name = var.network_name
    auto_create_subnetworks = "false"
  
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnetwork_name
  ip_cidr_range = var.subnet_ip_cidr_range
  region        = var.subnet_region
  network       = google_compute_network.vpc_network.id
  /*secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }*/
}