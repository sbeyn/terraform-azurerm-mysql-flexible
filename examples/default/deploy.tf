resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}

resource "azurerm_resource_group" "example" {
  name     = "tftest${random_string.this.result}"
  location = "West Europe"
  tags = {
    test = "tftest${random_string.this.result}"
  }
}

module "resource_group" {
  source = "../../"

  mysqlflex_name                = "mysqlflex-${random_string.this.result}"
  resource_group_name           = "tftest${random_string.this.result}"
  location                      = "West Europe"
  mysqlflex_database_name       = "tftest"

  mysqlflex_configuration = {
    require_secure_transport = "OFF"
  }

  mysqlflex_firewall_rules = {
    "AZURE-SERVICES" = {
      start_ip_address = "0.0.0.0"
      end_ip_address   = "0.0.0.0"
    }
  } 

  tags = {
    Terratest       = "true"
  }
}
