resource "azurerm_shared_image_gallery" "compute_gallery" {
  name                = var.gallery_name
  resource_group_name = var.rg_name
  location            = var.location
  description         = try(var.description, null)
  tags                = try(var.tags, null)
}