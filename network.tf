# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = "demoVnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  depends_on = [azurerm_resource_group.rg_name]
}

# # Create subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = "demoSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.my_terraform_network.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [azurerm_virtual_network.my_terraform_network]
}

# # Create public IPs
resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                = "demoPublicIP"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  depends_on = [azurerm_resource_group.rg_name]
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name                = "myNetworkSecurityGroup"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}