output "instancename"{
value = cloudstack_instance.subnet-1VM.display_name
}

output "instanceid" {
value = cloudstack_instance.subnet-1VM.id
}