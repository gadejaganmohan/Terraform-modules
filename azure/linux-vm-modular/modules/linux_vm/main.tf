resource "azurerm_linux_virtual_machine" "vm" {
    name = var.vm_name
    location = var.location
    resource_group_name = var.resource_group_name
    size = var.vm_size
    admin_username = var.admin_username
    admin_password = var.admin_password

    network_interface_ids = [var.network_interface_ids]

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