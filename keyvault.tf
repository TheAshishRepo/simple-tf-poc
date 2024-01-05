# #Creates Key Vault

resource "azurerm_key_vault" "key_vault" {
  name                       = var.key_Vault
  location                   = var.resource_group_location
  resource_group_name        = var.resource_group_name
  tenant_id                  = var.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7
#   soft_delete_enabled = false
#   purge_protection_enabled = false
    
  access_policy {
    tenant_id = var.tenant_id
    object_id = var.client_id
    key_permissions = [
      "Create",
      "Delete",
      "Get",
      "Purge",
      "Recover",
      "Update"
    #   "GetRotationPolicy"
    ]

    secret_permissions = [
      "Set",
    ]
  }
    tags = {
    App-Code       =      "demo"
    BusinessUnit   =      "CORP"
    Cloud          =      "EastUS"
    Deploy         =      "Terraform"
    Env            =      "Devlopment"
    Type           =      "IaaS"    
    Resource_type  =      "Key Vault"
}
}