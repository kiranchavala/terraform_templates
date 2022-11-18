provider "google" {
  project = var.project_id
  region  = var.region
  credentials = "${file("terraform.tfvars.json")}"
}

data "google_client_config" "default" {}

data "google_container_cluster" "my_cluster" {
  name     = var.gke_cluster_name 
  location = var.region
}



provider "kubectl" {
    host = "https://${var.host}"
    load_config_file       = false
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
}

resource "kubectl_manifest" "test2" {
        yaml_body = templatefile("${path.module}/deployment.tpl", {
        image_name = var.image_name
        replicas = var.replicas
        container_port = var.container_port 
        container_name = var.container_name
})
}








