resource "azurerm_subnet" "subnet" {
    name = "default-subnet"
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network
    address_prefixes = var.address_prefixes
}