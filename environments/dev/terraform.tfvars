rgs = {
  dev_rg1 = {
    name     = "dev-rg"
    location = "centralus"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

aks_clusters = {
  dev_aks1 = {
    name                = "devakscluster"
    location            = "centralus"
    resource_group_name = "dev-rg"
    dns_prefix          = "devaks"

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
    Environment = "dev"
    }
  }
}

acrs = {
  dev_acr1 = {
    name                = "devcontainer"
    resource_group_name = "dev-rg"
    location            = "centralus"
    sku                 = "Premium"
    admin_enabled       = false
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

public_ips = {
  dev_pip1 = {
    name                = "devPIP"
    resource_group_name = "dev-rg"
    location            = "centralus"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

key_vaults = {
  kv1 = {
    name                        = "devKV"
    location                    = "centralus"
    resource_group_name         = "dev-rg"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = true
    sku_name                    = "standard"
    tags = {
      Environment = "dev"
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
  dev_sql1 = {
    name                         = "devsqlserver"
    resource_group_name          = "dev-rg"
    location                     = "centralus"
    version                      = "12.0"
    admin_login                  = "sqladminuser"
    admin_password               = "P@ssw0rd1234!"
    minimum_tls_version          = "1.2"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

sql_dbs = {
  dev_sqldb1 = {
    name         = "devsqldatabase"
    server_id    = "/subscriptions/dc1b0d18-b7a7-4981-90c1-5f01ea6fc258/resourceGroups/dev-resource-group-1/providers/Microsoft.Sql/servers/dev-sql-server-1"
    sku_name     = "S0"
    max_size_gb  = 10
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "BasePrice"
    tags = {
      ManagedBy   = "Terraform"
      Owner       = "ElearnTeam"
      Environment = "dev"
    }
  }
}

stgs = {
  dev_stg1 = {
    name                     = "devstorageacct"
    resource_group_name       = "dev-rg"
    location                  = "centralus"
    account_tier              = "Standard"
    account_replication_type  = "LRS"
    tags = {
      environment = "dev"
    }
  }
}
