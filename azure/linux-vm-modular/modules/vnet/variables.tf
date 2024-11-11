variable "address_space" {
    description = "address space for vnet"
    type = list(string)
    default = ["10.0.0.0/16"]
   
   
}

variable "location" {
    description = "location of vnet"
    type = string
}

variable "resource_group_name" {
    description = "resource_group_name"
    type = string
}

variable "virtual_network_name" {
    description =  "virtual network name"
    type = string
}