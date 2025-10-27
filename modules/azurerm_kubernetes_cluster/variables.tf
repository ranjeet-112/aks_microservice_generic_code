variable "aks_clusters" {
  description = "Map of AKS clusters"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })
    identity = optional(object({
      type = string
    }))
    network_profile = optional(object({
      load_balancer_sku = string
      network_plugin    = string
    }))
    tags = optional(map(string))
  }))
}

variable "aks_tags" {
  description = "Common AKS tags"
  type        = map(string)
  default     = {}
}
