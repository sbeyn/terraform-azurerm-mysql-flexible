output "id" {
  description = "The resource ID of the MySQL Server"
  value       = azurerm_mysql_flexible_server.main.id
}

output "fqdn" {
  description = "The FQDN of the MySQL Server"
  value       = azurerm_mysql_flexible_server.main.fqdn
}

output "database_id" {
  description = "The resource ID of the MySQL Database"
  value       = azurerm_mysql_flexible_database.main.id
}

output "database_name" {
  description = "The database name of the MySQL Database"
  value       = var.mysqlflex_database_name
}

output "administrator_login" {
  description = "The administrator login of the MySQL Database"
  value = var.mysqlflex_admin_username == null ? "sqladmin" : var.mysqlflex_admin_username
}

output "administrator_password" {
  description = "The administrator password of the MySQL Database"
  value       = var.mysqlflex_admin_password == null ? random_password.main.0.result : var.mysqlflex_admin_password
  sensitive   = true
}
