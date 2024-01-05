
// Resource group create
resource "azurerm_resource_group" "rg_name" {
    name = var.resource_group_name
    location = var.resource_group_location
    tags = {
       App-Code       =      "demo"
       BusinessUnit   =      "CORP"
       Cloud          =      "EastUS"
       Deploy         =      "Deployed for demo"
       Env            =      "Devlopment"
       Type           =      "IaaS"    
       Resource_type  =      "VM"

    }
}

# terraform {
#   backend "azurerm" {
#     resource_group_name = "Terraform_State"
#     storage_account_name = "tfstatedemo"
#     container_name = "tfstate"
#     key = "terraformdev.tfstate"

# }
# }