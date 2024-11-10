module "linux_vm" {
    source = "./modules/linux_vm"
    resource_group_name = var.resource_group_name
    location = var.location
    vm_name = var.vm_name
    vm_size = var.vm_size
    admin_username = var.admin_username
    admin_password = var.admin_password
}