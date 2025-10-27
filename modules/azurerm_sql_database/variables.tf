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
