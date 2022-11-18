output "kubernetes_cluster_name" {
value = cloudstack_kubernetes_cluster.cluster1.name
}

output "endpoint" {
value = cloudstack_kubernetes_cluster.cluster1.control_nodes_size

}


output "kubernetesversionid" {
value = cloudstack_kubernetes_cluster.cluster1.kubernetes_version
}

output "description" {
value = cloudstack_kubernetes_cluster.cluster1.description
}