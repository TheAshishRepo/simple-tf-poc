
// Storage Account
resource "azurerm_storage_account" "storageaccount_name" {
    name                    = var.storage_account_name
    resource_group_name     = var.resource_group_name
    location                = var.resource_group_location
    account_kind            = "StorageV2"
    account_tier            = "Standard"
    account_replication_type = "RAGRS"
    tags = {
       App-Code       =      "BDAAS"
       BusinessUnit   =      "CORP"
       Cloud          =      "EastUS"
       Deploy         =      "Terraform"
       Env            =      "Devlopment"
       Type           =      "IaaS"    
       Resource_type  =      "Storage"
    }
    depends_on = [azurerm_resource_group.rg_name]

}

# module "inbound-storage-dfs-private-endpoint" {
#   source  = ""
#   version = ""
#   # insert required variables here
#   endpoint_resource_id = module.inbound_storage_account.id
#   pe_resource_group_name = var.storage_resource_group_name
#   pe_resource_name = ""
#   private_dns_zone_group_name = ""
#   private_dns_zone_ids        = ["{{subscription_link}}/providers/Microsoft.Network/privateDnsZones/privatelink.dfs.core.windows.net"]
#   subresource_names           = ["dfs"]
#   subnet_id = data.azurerm_subnet.private_subnet.id
#   tags =  {
  
#   }
#   depends_on = [
#     module.inbound_storage_account
#   ]

# }

#Container
resource "azurerm_storage_container" "landing" {
  name                  = "landing"
  storage_account_name  = resource.azurerm_storage_account.storageaccount_name.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "inbound" {
  name                  = "inbound"
  storage_account_name  = resource.azurerm_storage_account.storageaccount_name.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "outbound" {
  name                  = "outbound"
  storage_account_name  = resource.azurerm_storage_account.storageaccount_name.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "logs" {
  name                  = "logs"
  storage_account_name  = resource.azurerm_storage_account.storageaccount_name.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "etl" {
  name                  = "etl"
  storage_account_name  = resource.azurerm_storage_account.storageaccount_name.name
  container_access_type = "private"
}


# #Blob
resource "azurerm_storage_blob" "raw_file" {
  name                      = "raw/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.landing.name
  type                      = "Block"
}
resource "azurerm_storage_blob" "processed_file" {
  name                   = "processed/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.inbound.name
  type                   = "Block"
}
resource "azurerm_storage_blob" "history_file" {
  name                   = "history/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.inbound.name
  type                   = "Block"
}
resource "azurerm_storage_blob" "extract_file" {
  name                   = "extract/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.outbound.name
  type                   = "Block"
}
resource "azurerm_storage_blob" "ingestion_file" {
  name                   = "ingestion/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.logs.name
  type                   = "Block"
}
resource "azurerm_storage_blob" "processing_file" {
  name                   = "processing/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.logs.name
  type                   = "Block"
}
resource "azurerm_storage_blob" "extraction_file" {
  name                   = "extraction/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.logs.name
  type                   = "Block"
}
resource "azurerm_storage_blob" "codebase_file" {
  name                   = "Code_base/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.etl.name
  type                   = "Block"
}
resource "azurerm_storage_blob" "Executables_file" {
  name                   = "Executables/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.etl.name
  type                   = "Block"
}
resource "azurerm_storage_blob" "SQL_Queries_file" {
  name                   = "SQL_Queries/test.txt"
  storage_account_name      = resource.azurerm_storage_account.storageaccount_name.name
  storage_container_name    = resource.azurerm_storage_container.etl.name
  type                   = "Block"
}
