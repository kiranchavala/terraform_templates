
output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.default.name
}

output "resource_gp_name" {
 value = var.resource_gp_name

}

 output "host" {
   value = azurerm_kubernetes_cluster.default.kube_config.0.host
   sensitive = true
 }

# output "client_key" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.client_key
# }

# output "client_certificate" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.client_certificate
# }

#output "kube_config" {
#   value = azurerm_kubernetes_cluster.default.kube_config_raw
#   sensitive = true
# }

# output "cluster_username" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.username
# }

# output "cluster_password" {
#   value = azurerm_kubernetes_cluster.default.kube_config.0.password
# }

#output "run_this_command_to_configure_kubectl" {
#  value = "az aks get-credentials --resource-group kiran-rg --name $(terraform output -raw kubernetes_cluster_name)"
#}
