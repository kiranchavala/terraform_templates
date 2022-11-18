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

variable "cluster_name" {
  description = "Name of the kubernetes cluster"

}

variable "yaml_body" {
  description = "Please provide the yaml content in base64"

}  
  
