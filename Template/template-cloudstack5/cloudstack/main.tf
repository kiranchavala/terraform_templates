provider "cloudstack" {
  api_url    = var.cloudstack_api_url
  api_key    = var.cloudstack_api_key
  secret_key = var.cloudstack_secret_key
  timeout = 3600

}



resource "cloudstack_instance" "test" {
  name             = var.instance_name[count.index]
  service_offering = var.instance_service_offering
  network_id       = var.network_id
  template         = var.instance_template
  zone             = var.zone
  count = var.instancecount
  expunge = true


}








