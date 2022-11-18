variable "access_key" {
  description = "access key"

}

variable "secret_key" {
  description = "secret key"

}

variable "aws_region" {
  default = "us-east-2"
  description = "aws region"
}

variable "cluster_name" {
  description = "Name of the kubernetes cluster"
}

variable "yaml_body" {
  description = "Please provide the yaml content in base64 format"

}  

