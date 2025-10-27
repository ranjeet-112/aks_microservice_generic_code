resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.sql_servers

  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_password
  minimum_tls_version          = each.value.minimum_tls_version

  tags                         = each.value.tags
}

output "sql_server_ids" {
  description = "The IDs of the SQL Servers."
  value       = { for k, v in azurerm_mssql_server.sql_server : k => v.id }
}

