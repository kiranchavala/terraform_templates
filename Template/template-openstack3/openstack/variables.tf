
variable "yaml_body" {
  description = "name of the kubernetes cluster"

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