variable "description" {
  type        = string
  description = "The description you would like to use for your gallery"
}

variable "gallery_name" {
  type        = string
  description = "The name of the gallery"
}

variable "location" {
  description = "The location for this resource to be put in"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists"
  type        = string
  validation {
    condition     = length(var.rg_name) > 1 && length(var.rg_name) <= 24
    error_message = "Resource group name is not valid."
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    source = "terraform"
  }
}
