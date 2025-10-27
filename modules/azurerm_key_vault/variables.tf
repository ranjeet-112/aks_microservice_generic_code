variable "key_vaults" {
  description = "Map of Key Vault configurations"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
    tags                        = map(string)
    access_policies = optional(list(object({
      # don't accept tenant_id here to reduce mistakes; but keep optional if you must:
      tenant_id           = optional(string)
      object_id           = string
      key_permissions     = optional(list(string))
      secret_permissions  = optional(list(string))
      certificate_permissions = optional(list(string))
      storage_permissions = optional(list(string))
    })), [])
  }))
}