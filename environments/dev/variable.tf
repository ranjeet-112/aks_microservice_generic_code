variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

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

variable "public_ips" {
  description = "A map of public IP configurations"
  type = map(object({
	name                = string
	resource_group_name = string
	location            = string
	allocation_method   = string
	sku                 = string
	tags                = map(string)
  }))
}

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
    access_policies = list(object({
      tenant_id           = optional(string)
      object_id           = string
      key_permissions     = optional(list(string))
      secret_permissions  = optional(list(string))
      storage_permissions = optional(list(string))
    }))
  }))
}

variable "sql_servers" {
    description = "A map of SQL Server configurations."
    type = map(object({
        name                         = string
        resource_group_name          = string
        location                     = string
        version                      = string
        admin_login                  = string
        admin_password               = string
        minimum_tls_version          = string
        tags                         = map(string)
    }))
}

variable "sql_dbs" {
    description = "A map of SQL Databases to create."
    type = map(object({
        name         = string
        server_id    = string
        collation    = optional(string)
        license_type = optional(string)
        max_size_gb  = optional(number)
        sku_name     = string
        enclave_type = optional(string)
        tags         = optional(map(string))
    }))
}

variable "stgs" {
  type = map(object({
    name                     = string
    resource_group_name       = string
    location                  = string
    account_tier              = string
    account_replication_type  = string
    tags                      = map(string)
  }))
}