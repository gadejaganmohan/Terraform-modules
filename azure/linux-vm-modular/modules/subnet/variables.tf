variable "resource_group_name" {
    description = "resource group name"
    type = string
}

variable "virtual_network" {
    description = "virtual network name"
    type = string
}

variable "address_prefixes" {
    description = "address prefixes"
    type =list(string)
    default = ["10.0.1.0/24"]
   
}