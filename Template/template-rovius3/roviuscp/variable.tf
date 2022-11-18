variable "cloudstack_api_url" {}
variable "cloudstack_api_key" {}
variable "cloudstack_secret_key" {}
variable "instance_name"{
  description = "Create instances with these names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
  }
variable "network_id"{}
variable "instance_template" {}
variable "zone" {}
variable "instance_service_offering" {}
variable "instancecount" {
  description = "The number of vm to launch"
  type        = number
  default     = 3
}
variable "user_data" {}