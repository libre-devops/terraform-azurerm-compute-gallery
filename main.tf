resource "azurerm_shared_image_gallery" "compute_gallery" {
  for_each = { for k, v in var.compute_gallery : k => v }

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  description         = each.value.description
  tags                = each.value.tags

  dynamic "sharing" {
    for_each = each.value.sharing != null ? [each.value.sharing] : []
    content {
      permission = title(sharing.value.permission)


      dynamic "community_gallery" {
        for_each = sharing.value.community_gallery != null ? [sharing.value.community_gallery] : []
        content {
          eula            = community_gallery.value.eula
          prefix          = community_gallery.value.prefix
          publisher_email = community_gallery.value.publisher_email
          publisher_uri   = community_gallery.value.publisher_uri
        }
      }
    }
  }
}

