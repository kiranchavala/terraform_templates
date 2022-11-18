 variable "subscription_id" {
  description = "Enter Subscription ID for provisioning resources in Azure"
}


variable "tenant_id" {
  description = "Enter Tenant ID / Directory ID of your Azure AD. Run Get-AzureSubscription to know your Tenant ID"
} 

variable "client_id" {
  description = "Enter Client ID for Application created in Azure AD"
}

variable "client_secret" {
  description = "Enter Client secret for Application in Azure AD"
}

variable "resource_gp_name" {
  description = "Resource group name"
  type = string
 
}

variable "location" {
  description = "Location for the deployment"
  
}

variable "cluster_name" {
  description = "k8s cluster name"
  type = string
 
}
