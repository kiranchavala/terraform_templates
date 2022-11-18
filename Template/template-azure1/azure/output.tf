output "instanceid" {
value = azurerm_virtual_machine.main.id
}

output "subnetid" {
value = azurerm_subnet.internal.id
}

output "subnetname" {
value = azurerm_subnet.internal.name
}

output "networkinterfaceid" {
value = azurerm_network_interface.main.id
}

output "networkid" {
value = azurerm_virtual_network.main.id
}

output "networkname" {
value = azurerm_virtual_network.main.name
}

output "resourcegroupid" {
value = azurerm_resource_group.resource_gp.id
}