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