```hcl
resource "azurerm_shared_image_gallery" "compute_gallery" {
  for_each = { for gal in var.compute_gallery : gal.name => gal }

  name                = each.value.name
  resource_group_name = each.value.rg_name
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

```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_shared_image_gallery.compute_gallery](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/shared_image_gallery) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compute_gallery"></a> [compute\_gallery](#input\_compute\_gallery) | The block used to create 1 or more compute galleries | <pre>list(object({<br>    name        = string<br>    rg_name     = string<br>    location    = optional(string, "uksouth")<br>    description = optional(string, "The default compute gallery used within the azure platform")<br>    tags        = map(string)<br>    sharing = optional(object({<br>      permission = optional(string, "Groups")<br>      community_gallery = optional(object({<br>        eula            = string<br>        prefix          = string<br>        publisher_email = string<br>        publisher_uri   = string<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gallery_id"></a> [gallery\_id](#output\_gallery\_id) | The ID of the gallery |
| <a name="output_gallery_location"></a> [gallery\_location](#output\_gallery\_location) | The location name of the gallery |
| <a name="output_gallery_name"></a> [gallery\_name](#output\_gallery\_name) | The name name of the gallery |
| <a name="output_gallery_rg_name"></a> [gallery\_rg\_name](#output\_gallery\_rg\_name) | The rg name of the gallery |
| <a name="output_gallery_tags"></a> [gallery\_tags](#output\_gallery\_tags) | The tags of the gallery |
| <a name="output_gallery_unique_name"></a> [gallery\_unique\_name](#output\_gallery\_unique\_name) | The unique name of the gallery |
