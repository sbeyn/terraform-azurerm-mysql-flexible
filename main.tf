data "azurerm_client_config" "current" {}

resource "random_password" "main" {
  count       = var.mysqlflex_admin_password == null ? 1 : 0
  length      = var.mysqlflex_random_password_length
  min_upper   = 4
  min_lower   = 2
  min_numeric = 4
  special     = false

  keepers = {
    administrator_login_password = var.mysqlflex_name
  }
}

resource "azurerm_mysql_flexible_server" "main" {
  name                              = var.mysqlflex_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  administrator_login               = var.mysqlflex_admin_username == null ? "sqladmin" : var.mysqlflex_admin_username
  administrator_password            = var.mysqlflex_admin_password == null ? random_password.main.0.result : var.mysqlflex_admin_password
  sku_name                          = var.mysqlflex_sku_name
  version                           = var.mysqlflex_version
  create_mode                       = var.mysqlflex_create_mode
  delegated_subnet_id               = var.mysqlflex_delegated_subnet_id
  private_dns_zone_id               = var.mysqlflex_private_dns_zone_id
  zone                              = var.mysqlflex_zone
  replication_role                  = var.mysqlflex_replication_role
  backup_retention_days             = var.mysqlflex_backup_retention_days
  geo_redundant_backup_enabled      = var.mysqlflex_geo_redundant_backup_enabled
  point_in_time_restore_time_in_utc = var.mysqlflex_point_in_time_restore_time_in_utc 
  
  storage {
    auto_grow_enabled = var.mysqlflex_auto_grow_enabled
    iops              = var.mysqlflex_iops
    size_gb           = var.mysqlflex_size_gb
  }

  dynamic "high_availability" {
    for_each = var.mysqlflex_high_availability_enabled == true ? [1] : []
    content {
      mode                      = var.mysqlflex_mode
      standby_availability_zone = var.mysqlflex_standby_availability_zone
    }
  }

  maintenance_window {
    day_of_week  = var.mysqlflex_day_of_week
    start_hour   = var.mysqlflex_start_hour
    start_minute = var.mysqlflex_start_minute 
  }

  tags = merge(
    {
      "Terraform" = "true"
    },
    var.tags,
  )
}

resource "azurerm_mysql_flexible_database" "main" {
  name                = var.mysqlflex_database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.main.name
  charset             = var.mysqlflex_charset
  collation           = var.mysqlflex_collation
}

resource "azurerm_mysql_flexible_server_configuration" "main" {
  for_each            = var.mysqlflex_configuration != null ? { for k, v in var.mysqlflex_configuration : k => v if v != null } : {}
  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.main.name
  value               = each.value
}

resource "azurerm_mysql_flexible_server_firewall_rule" "main" {
  for_each            = var.mysqlflex_firewall_rules != null ? { for k, v in var.mysqlflex_firewall_rules : k => v if v != null } : {}
  name                = format("%s", each.key)
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.main.name
  start_ip_address    = each.value["start_ip_address"]
  end_ip_address      = each.value["end_ip_address"]
}
