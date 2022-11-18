provider "openstack" {
  user_name   = var.user_name
  tenant_name = var.tenant_name
  domain_name = var.domain_name
  password    = var.password
  auth_url    = var.auth_url
  region      = var.region
}



resource "openstack_containerinfra_cluster_v1" "cluster_1" {
  name                = var.cluster_name
  cluster_template_id = var.cluster_template_id
  master_count        = var.master_count
  node_count          = var.node_count
  keypair             = var.key_pair
  create_timeout      = 60
  floating_ip_enabled = true
}