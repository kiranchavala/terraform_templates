output "vpcname" {
value = cloudstack_vpc.vpctf1.name
}

output "vpcid" {
value = cloudstack_vpc.vpctf1.id
}

output "networkid" {
value = cloudstack_network.subnet-1.id
}

output "networkdisplaytext" {
value = cloudstack_network.subnet-1.display_text
}

output "instancename"{
value = cloudstack_instance.subnet-1VM.display_name
}

output "instanceid" {
value = cloudstack_instance.subnet-1VM.id
}

output "volumeid"{
value = cloudstack_disk.test-disk.id
}
