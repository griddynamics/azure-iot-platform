locals {

  tags = {
    platform = var.platform
    solution = var.solution
    location = var.location
    owner    = var.owner
    source   = "terraform"
  }

}
