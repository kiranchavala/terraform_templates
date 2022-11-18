provider "cloudstack" {
  api_url    = var.cloudstack_api_url
  api_key    = var.cloudstack_api_key
  secret_key = var.cloudstack_secret_key
  timeout = 3600

}

resource "cloudstack_kubernetes_cluster" "cluster1" {
  name = var.name
  zone = var.zone
  kubernetes_version = var.kubernetes_version
  service_offering = var.service_offering
  size = var.size
  network_id = var.network_id
  keypair = var.keypair
 


}
