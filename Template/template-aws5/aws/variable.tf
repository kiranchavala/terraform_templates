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

variable "container_name" {
  description = "Please provide the image name"

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
