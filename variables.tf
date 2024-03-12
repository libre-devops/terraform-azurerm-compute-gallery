variable "compute_gallery" {
  description = "The block used to create 1 or more compute galleries"
  type = list(object({
    name        = string
    rg_name     = string
    location    = optional(string, "uksouth")
    description = optional(string, "The default compute gallery used within the azure platform")
    tags        = map(string)
    sharing = optional(object({
      permission = optional(string, "Groups")
      community_gallery = optional(object({
        eula            = string
        prefix          = string
        publisher_email = string
        publisher_uri   = string
      }))
    }))
  }))
}
