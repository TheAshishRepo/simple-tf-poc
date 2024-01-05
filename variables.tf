
variable "resource_group_name" {
  type        = string
  default     = "bdaas-eu-rg"
  description = "Resource Group Name"
}

variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}
variable "storage_account_name" {
  type        = string
  default     = "bdaaseustorage01"
  description = "Storage account name."
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "bdaasadmin"
}

variable "app_insights" {
  type        = string
  description = "App Insights Name."
  default     = "bdass-eu-appinsights"
}

variable "log_analytics" {
  type        = string
  description = "Log Analytics Name."
  default     = "bdass-eu-log-analytics"
}
variable "app_service_plan" {
  type        = string
  description = "Web Application Name."
  default     = "bdass-eu-webapp-plan"
}

variable "app_service_ui" {
  type        = string
  description = "Web Application Name."
  default     = "bdass-eu-ui-webapp"
}
variable "app_service_nodejs" {
  type        = string
  description = "Web Application Name."
  default     = "bdass-eu-nodejs-webapp"
}
variable "key_Vault" {
  type        = string
  description = "Key Vault Name."
  default     = "bdass-eu-akv"
}
variable "ssh_key" {
  type        = string
  description = "SSh Key Name."
  default     = "ssh-vm-key"
}
variable "tenant_id" {
  type        = string
  description = "Tenent ID authentication for key vault."
  default     = "a1a556a4-ef96-44a7-9887-aa86acdea510"
}
variable "client_id" {
  type        = string
  description = "Client ID authentication for key vault."
  default     = "f434fccf-b0bf-4ad1-86da-508f6412343f"
}

variable "app_service_plan_id" {
  type        = string
  description = "App Service Plan ID"
  default     = "/subscriptions/daf23aa6-5067-4e7f-a6d5-571fbfbf7d83/resourceGroups/BDaaS/providers/Microsoft.Web/serverfarms/bdaasinitPlan"
}

// variable "prefix" {
//   type        = string
//   default     = "win-vm-iis"
//   description = "Prefix of the resource name"
// }


variable "location" {
  type    = string
  default = "eastus"
}
variable "resourceGroupName" {
  type    = string
  default = "myTerraformRG"
}
variable "tags" {
  type = map(any)
  default = {
    "Env" = "Test"
  }
}
variable "vnetname" {
  type = string

}

variable "subnetname" {
  type = string
}

variable "ipaddressname" {
  type = string

}
variable "nsgname" {
  type = string

}

variable "nicname" {
  type = string

}
variable "virtualmachinename" {
  type = string

}