variable "aws_region" {
  default = "us-west-2"
}

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}


variable "access_key" {
  description = "The aws access key for the account"
  type        = string  

}

variable "secret_key" {
  description = "The aws secret key for the account"
  type        = string  

}