provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}




 resource "aws_instance" "web-server-instance" {
   ami               = var.instance_ami
   instance_type     = var.instance_type
   availability_zone = var.instance_az
   key_name          = var.instance_key_name
   subnet_id = var.subnet_id
   security_groups = [ var.sg_id ]

   user_data = var.instance_user_data

   tags = {
     Name = var.instance_tagname
   }
 }


