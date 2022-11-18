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
variable "host" {
  description = "paste the kubernetes server master ip"

}


variable "cluster_ca_certificate" {
  description = "paste the cluster.pem in base64 encoded format"

}

variable "client_certificate" {
  description = "paste the client.pem in base64 encoded format"

}

variable "client_key" {
  description = "paste the client_key.pem in base64 encoded format"

}