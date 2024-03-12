output "gallery_id" {
  description = "The ID of the gallery"
  value       = { for k, v in azurerm_shared_image_gallery.compute_gallery : k => v.id }
}

output "gallery_location" {
  description = "The location name of the gallery"
  value       = { for k, v in azurerm_shared_image_gallery.compute_gallery : k => v.location }
}

output "gallery_name" {
  description = "The name name of the gallery"
  value       = { for k, v in azurerm_shared_image_gallery.compute_gallery : k => v.name }
}

output "gallery_resource_group_name" {
  description = "The rg name of the gallery"
  value       = { for k, v in azurerm_shared_image_gallery.compute_gallery : k => v.resource_group_name }
}

output "gallery_tags" {
  description = "The tags of the gallery"
  value       = { for k, v in azurerm_shared_image_gallery.compute_gallery : k => v.tags }
}

output "gallery_unique_name" {
  description = "The unique name of the gallery"
  value       = { for k, v in azurerm_shared_image_gallery.compute_gallery : k => v.unique_name }
}
