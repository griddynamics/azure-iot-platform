/**
 * # Azure VM module
 *
 * Terraform module which creates Azure Virtual Machine
 *
 */

resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  tags                = var.tags
}

resource "azurerm_network_interface" "this" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id

  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                            = var.virtual_machine_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = "Standard_B2s"
  admin_username                  = "adpadmin"
  disable_password_authentication = true
  custom_data                     = base64encode(file("${path.module}/files/userdata/iot/simulator.sh"))
  tags                            = var.tags
  network_interface_ids           = [azurerm_network_interface.this.id]

  admin_ssh_key {
    username   = var.admin_user_name
    public_key = file(var.ssh_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}
