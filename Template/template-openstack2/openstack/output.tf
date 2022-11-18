output "cluster_id" {
  description = "Openstack cluster ID."
  value       = openstack_containerinfra_cluster_v1.cluster_1.id
}

output "cluster_template_id" {
  description = "Openstack cluster ID."
  value       = openstack_containerinfra_cluster_v1.cluster_1.cluster_template_id
}

output "api_address" {
  description = "api_address"
  value       = openstack_containerinfra_cluster_v1.cluster_1.api_address
}

output "coe_version" {
  description = "coe version"
  value       = openstack_containerinfra_cluster_v1.cluster_1.coe_version
}


output "stack_id" {
  description = "stack_id"
  value       = openstack_containerinfra_cluster_v1.cluster_1.stack_id
}

output "flavor_of_worker_nodes" {
  description = "flavor of worker nodes"
  value       = openstack_containerinfra_cluster_v1.cluster_1.flavor
}

output "flavor_of_master_nodes" {
  description = "flavor of master nodes"
  value       = openstack_containerinfra_cluster_v1.cluster_1.master_flavor
}

output "Network_of_the_cluster" {
  description = "Network of the cluster"
  value       = openstack_containerinfra_cluster_v1.cluster_1.fixed_network
}

output "kubeconfig_raw" {
  description = "raw_kube_config"
  value       = openstack_containerinfra_cluster_v1.cluster_1.kubeconfig.raw_config
  sensitive = true
}

output "kubeconfig_host" {
  description = "host"
  value       = openstack_containerinfra_cluster_v1.cluster_1.kubeconfig.host
  sensitive = true
}

output "ca_certificate" {
  description = "ca_certificate"
  value       = openstack_containerinfra_cluster_v1.cluster_1.kubeconfig.cluster_ca_certificate
  sensitive = true
}

output "client_certificate" {
  description = "client_certificate"
  value       = openstack_containerinfra_cluster_v1.cluster_1.kubeconfig.client_certificate
  sensitive = true
}

output "client_key" {
  description = "client_key"
  value       = openstack_containerinfra_cluster_v1.cluster_1.kubeconfig.client_certificate
  sensitive = true
}