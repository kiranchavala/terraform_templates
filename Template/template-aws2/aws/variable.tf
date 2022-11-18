variable "region" {
  default = "ap-south-1"
}

variable "access_key" {
  description = "access key"

}

variable "secret_key" {
  description = "secret key"

}

/*variable "vpc_id" {
  default = "vpc-0581e6c2fee5a819f"
}*/

variable "subnet_id" {
  default = "subnet-047ad9cad65437b5a"
}

variable "sg_id" {
  default = "sg-052944e2aa5713ed5"
}

/*variable "route_table_id" {
  default = "rtb-063b8b06911e75262"
}

variable "rt-tagName" {
  default = "Prod"
}

# 2. Create Custom Route Table

 resource "aws_route_table" "prod-route-table" {
   vpc_id = var.vpc_id

   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = "igw-0fd9a79a424acb0be"
   }

   route {
     ipv6_cidr_block = "::/0"
     gateway_id      = "igw-0fd9a79a424acb0be"
   }

   tags = {
     Name = var.rt-tagName
   }
 }

# 3. Associate subnet with Route Table
 resource "aws_route_table_association" "a" {
   subnet_id      = var.subnet_id
   route_table_id = var.route_table_id
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

 # 4. Create Security Group to allow port 22,80,443
 resource "aws_security_group" "allow_web" {
   name        = var.sg_name
   description = var.sg_description
   vpc_id      = var.vpc_id
   ingress {
     description = "HTTPS"
     from_port   = 443
     to_port     = 443
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
     description = "HTTP"
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
     description = "SSH"
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
     Name = var.sg_tagName
   }
 }*/


variable "instance_ami" {
  default ="ami-0851b76e8b1bce90b"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_az" {
  default = "ap-south-1b"
}

variable "instance_key_name" {
  default = "apsouth1-key"
}

variable "instance_tagname" {
  default = "web-server"
}

variable "instance_user_data" { 
  default =  "#!/bin/bash\napt update -y\napt install apache2 -y\nsystemctl start apache2\napt-get update\napt-get -y install net-tools nginx\nMYIP=`ifconfig | grep -E '(inet 10)' | awk '{ print $2 }' | cut -d ':' -f 2`\necho 'Hello Team\nThis is my IP: '$MYIP > /var/www/html/index.html"
}
