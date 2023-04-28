resource "azurerm_network_security_group" "this" {
  name                = var.security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "${var.security_group_name}-ssh"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = var.source_cidr
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "22"
}


resource "azurerm_network_security_rule" "mqtt" {
  name                        = "${var.security_group_name}-mqtt"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_address_prefix       = var.source_cidr
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "8883"
}

resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.this.id
}
