/**
* # Edge component for IoT
*
* Creates Azure Virtual machine and additional resources which represents Edge device
*/


module "edge_device" {
  source                 = "../../modules/virtual_machine"
  public_ip_name         = var.public_ip_name
  network_interface_name = var.network_interface_name
  virtual_machine_name   = var.virtual_machine_name
  security_group_name    = var.security_group_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  subnet_id              = var.subnet_id
  source_cidr            = var.source_cidr
  admin_user_name        = var.admin_user_name
  ssh_key_path           = var.ssh_key_path
  tags                   = var.tags
}
