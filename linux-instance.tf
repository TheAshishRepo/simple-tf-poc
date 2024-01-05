# # Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = "demo-nic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = azurerm_public_ip.my_terraform_public_ip.id
  }
    depends_on = [azurerm_subnet.my_terraform_subnet, azurerm_public_ip.my_terraform_public_ip]

}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "demonsg" {
  network_interface_id      = azurerm_network_interface.my_terraform_nic.id
  network_security_group_id = azurerm_network_security_group.my_terraform_nsg.id
  depends_on = [azurerm_network_interface.my_terraform_nic, azurerm_network_security_group.my_terraform_nsg]
}

# Create virtual machine

resource "tls_private_key" "sshkey" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

output "tls_private_key" {

  value     = tls_private_key.sshkey.private_key_pem
  sensitive = true

}

resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = "demo-eu-vm"
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = "Standard_B2ms"
  
  os_disk {
    name                 = "OsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "demovm"
  admin_username = var.username

  admin_ssh_key {
    username   = var.username
    public_key = tls_private_key.sshkey.public_key_openssh
  }
  depends_on = [azurerm_network_interface.my_terraform_nic, azapi_resource_action.ssh_public_key_gen]
    tags = {
       App-Code       =      "demo"
       BusinessUnit   =      "CORP"
       Cloud          =      "EastUS"
       Deploy         =      "Terraform"
       Env            =      "Devlopment"
       Type           =      "IaaS"    
       Resource_type  =      "UbuntuVM"
    }
}
