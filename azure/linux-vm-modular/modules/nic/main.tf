resource "azurerm_network_interface" "nic" {
    name = "default-nic"
    location = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name = "internal"
        subnet_id = var.subnet_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = var.public_ip

    }
}