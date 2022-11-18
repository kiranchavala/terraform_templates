output "vpcname" {
value = aws_vpc.prod-vpc.tags_all
}

output "vpcid" {
value = aws_vpc.prod-vpc.id
}

output "subnet1arn"{
value = aws_subnet.subnet-1.arn
}

output "subnet1name"{
value = aws_subnet.subnet-1.tags_all
}

output "websecuritygrouparn"{
value = aws_security_group.allow_web.arn
}

output "networkinterfaceid" {
value = aws_network_interface.web-server-nic.id
}

output "instanceid" {
   value = aws_instance.web-server-instance.arn
 }

 output "volumeid" {
  value =aws_instance.web-server-instance.root_block_device.0.volume_id
 }


output "instancetype" {
   value = aws_instance.web-server-instance.instance_type
 }

output "instance_state" {
value = aws_instance.web-server-instance.instance_state
}
