variable "subscription_id" {
  description = "Enter Subscription ID for provisioning resources in Azure"
}

variable "client_id" {
  description = "Enter Client ID for Application created in Azure AD"
}

variable "client_secret" {
  description = "Enter Client secret for Application in Azure AD"
}

variable "tenant_id" {
  description = "Enter Tenant ID / Directory ID of your Azure AD. Run Get-AzureSubscription to know your Tenant ID"
}

variable "resource_gp_name" {}
 
variable "location" {
  default ="eastus"
}

variable "prefix" {
  default = "hp"
}

variable "nw_address_space" {
  default = "10.0.0.0/16"
}

variable "subnet_name" {}
  
variable "subnet_address" {
    default = "10.0.2.0/24"
  
}
variable "tags_owner" {}

variable "instance_user_data" { 
  default = "#!/bin/bash\napt update -y\napt install apache2 -y\nsystemctl start apache2\napt-get update\napt-get -y install net-tools nginx\necho '<h1>Azure Linux VM with Web Server azurerm_virtual_machine.test.name  </h1>' | sudo tee /var/www/html/index.html"
}