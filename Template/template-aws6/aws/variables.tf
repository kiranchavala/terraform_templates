variable "region" {
  default = "us-east-2"
}

variable "access_key" {
  description = "access key"

}

variable "secret_key" {
  description = "secret key"

}
variable "instancecount" {
  description = "The number of vm to launch"
  type        = number
  default     = 3
}

variable "instance_name"{
  description = "Create instances with these names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
  }
  