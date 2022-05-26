output "gallery_description" {
  value       = azurerm_shared_image_gallery.compute_gallery.description
  description = "The description of the gallery"
}

output "gallery_id" {
  value       = azurerm_shared_image_gallery.compute_gallery.id
  description = "The id of the gallery"
}

output "gallery_name" {
  value       = azurerm_shared_image_gallery.compute_gallery.name
  description = "The name of the gallery"
}
