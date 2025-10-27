data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "Elearn_keyvault" {
  for_each                    = var.key_vaults
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                    = each.value.sku_name
  tags                        = each.value.tags

  dynamic "access_policy" {
    for_each = lookup(each.value, "access_policies", [])
    content {
      
      tenant_id = data.azurerm_client_config.current.tenant_id

      object_id = access_policy.value.object_id

      key_permissions         = lookup(access_policy.value, "key_permissions", [])
      secret_permissions      = lookup(access_policy.value, "secret_permissions", [])
      certificate_permissions = lookup(access_policy.value, "certificate_permissions", [])
      storage_permissions     = lookup(access_policy.value, "storage_permissions", [])
    }
  }
}