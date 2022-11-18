variable "region" {
  default = "us-east-2"
}

variable "access_key" {
  description = "access key"
  
 

}

variable "secret_key" {
  description = "secret key"
  
  

}

variable "subnet_prefix" {
  description = "cidr block for the subnet"
  default = "10.0.1.0/24"


}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_tagName" {
  default = "production"
}

variable "subnet1_az" {
  default = "us-east-2a"
}

variable "rt-tagName" {
  default = "Prod"
}

variable "sg_name" {
  default = "allow_web_traffic"
}

variable "sg_description" {
  default = "Allow Web inbound traffic"
}

variable "sg_tagName" {
  default = "allow_web"
}

variable "nic_privateips" {
  default = "10.0.1.50"
}

variable "instance_ami" {
  default ="ami-00399ec92321828f5"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_az" {
  default = "us-east-2a"
}

variable "instance_key_name" {
  default = "main1-key"
}

variable "instance_tagname" {
  default = "web-server"
}
