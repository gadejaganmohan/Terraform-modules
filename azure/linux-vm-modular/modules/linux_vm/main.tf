resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
}

resource "azurerm_virtual_network" "vnet" {
    name = "${var.vm_name}-vnet"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
    name = "${var.vm_name}-subnet"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
    name = "${var.vm_name}-public-ip"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Static"
    sku = "Basic"
}

resource "azurerm_network_interface" "nic" {
    name = "${var.vm_name}-nic"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
        name = "internal"
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.public_ip.id
    }
}

resource "azurerm_linux_virtual_machine" "vm" {
    name = var.vm_name
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    size = var.vm_size
    admin_username = var.admin_username
    admin_password = var.admin_password

    network_interface_ids = [azurerm_network_interface.nic.id]
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-LTS"
        version = "latest"
    }

    computer_name = var.vm_name
    disable_password_authentication = false
}