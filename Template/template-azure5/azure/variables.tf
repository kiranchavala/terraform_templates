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

variable "container_name" {
  description = "Please provide the container name"

}  

variable "image_name" {
  description = "Please provide the image name"

}  
variable "replicas" {
  description = "Please provide the no of replicas"

}  
variable "container_port" {
  description = "Please provide the container port"

}  
