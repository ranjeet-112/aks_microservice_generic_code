variable "acrs" {
  description = "Map of Azure Container Registries"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
    tags                = optional(map(string))
  }))
}
variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}