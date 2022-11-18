output "instanceid" {
value = cloudstack_instance.test-vm.id
}


output "networkid" {
value = cloudstack_network.test-network.id
}



output "instancename"{
value = cloudstack_instance.test-vm.display_name
}

output "volumeid"{
value = cloudstack_disk.test-disk.id
}

