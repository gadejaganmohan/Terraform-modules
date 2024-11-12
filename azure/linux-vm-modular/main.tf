module "resource_group" {
    source = "./modules/resource_group"
    resource_group_name = var.resource_group_name
    location = var.location
}

module "network" {
    source = "./modules/vnet"
    virtual_network_name = var.virtual_network_name
    address_space = var.address_space
    location = var.location
    resource_group_name = module.resource_group.rg_name
}

module "subnet" {
    source = "./modules/subnet"
    resource_group_name = var.resource_group_name
    virtual_network = module.network.vnet_name
    address_prefixes = var.address_prefixes
}

module "public_ip" {
    source = "./modules/public_ip"
    resource_group_name = module.resource_group.rg_name
    location = var.location
}

module "nic" {
    source = "./modules/nic"
    location = var.location
    resource_group_name = module.resource_group.rg_name
    public_ip = module.public_ip.public_ip
    subnet_id = module.subnet.subnet_id
    
}

module "linux_vm" {
    source = "./modules/linux_vm"
    vm_name = var.vm_name
    vm_size = var.vm_size
    location = var.location
    resource_group_name = module.resource_group.rg_name
    network_interface_ids = module.nic.nic
    admin_username = var.admin_username
    admin_password = var.admin_password

}