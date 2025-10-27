rgs = {
  prod_rg1 = {
    name     = "prod-rg1"
    location = "centralus"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "prod"
    }
  }
}

aks_clusters = {
  prod_aks1 = {
    name                = "prod-aks-cluster"
    location            = "centralus"
    resource_group_name = "prod-rg1"
    dns_prefix          = "prodaks"

    default_node_pool = {
      name       = "default"
      node_count = 2
      vm_size    = "Standard_B2ms"
    }

    identity = {
      type = "SystemAssigned"
    }

    network_profile = {
      load_balancer_sku = "standard"
      network_plugin    = "azure"
    }

    tags = {
    ManagedBy   = "Terraform"
    Owner       = "ElearnTeam"
    Environment = "prod"
    }
  }
}

acrs = {
  prod_acr1 = {
    name                = "prodacr"
    resource_group_name = "prod-rg1"
    location            = "centralus"
    sku                 = "Premium"
    admin_enabled       = false
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "prod"
    }
  }
}

public_ips = {
  prod_pip1 = {
    name                = "prod-public-ip"
    resource_group_name = "prod-rg1"
    location            = "centralus"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "prod"
    }
  }
}

key_vaults = {
  kv1 = {
    name                        = "prod-key-vault"
    location                    = "centralus"
    resource_group_name         = "prod-rg1"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = true
    sku_name                    = "standard"
    tags = {
      Environment = "prod"
      Owner       = "ElearnTeam"
      ManagedBy   = "Terraform"
    }

    access_policies = [
      {
        # tenant_id = "986adbdb-7abc-4f8a-b65c-bd58c967382b"   
        object_id           = "f1234567-89ab-4cde-90f1-23456789abcd"
        key_permissions     = ["Get", "List", "Create", "Delete"]
        secret_permissions  = ["Get", "List", "Set", "Delete"]
        certificate_permissions = []
        storage_permissions = []
      }
    ]
  }
}

sql_servers = {
  prod_sql1 = {
    name                         = "prod-sql-server"
    resource_group_name          = "prod-rg1"
    location                     = "centralus"
    version                      = "12.0"
    admin_login                  = "sqladminuser"
    admin_password               = "P@ssw0rd1234!"
    minimum_tls_version          = "1.2"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "prod"
    }
  }
}

sql_dbs = {
  prod_sqldb1 = {
    name         = "prod-sql-database"
    server_id    = "/subscriptions/dc1b0d18-b7a7-4981-90c1-5f01ea6fc258/resourceGroups/prod-resource-group-1/providers/Microsoft.Sql/servers/prod-sql-server-1"
    sku_name     = "S0"
    max_size_gb  = 10
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "BasePrice"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "prod"
    }
  }
}

stgs = {
  prod_stg1 = {
    name                     = "prodstorageacct"
    resource_group_name       = "prod-rg"
    location                  = "centralus"
    account_tier              = "Standard"
    account_replication_type  = "LRS"
    tags = {
      environment = "prod"
    }
  }
}