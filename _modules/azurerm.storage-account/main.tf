resource "azurerm_storage_account" "sa" {
  resource_group_name = var.rg_name
  location            = var.location

  name                     = var.sa_name
  account_tier             = var.sa_tier
  account_replication_type = var.sa_replication_type

  dynamic "network_rules" {
    for_each = var.network_rules_settings

    content {
      default_action             = network_rules.value.action
      ip_rules                   = network_rules.value.ip_rules
      virtual_network_subnet_ids = network_rules.value.vnet_subnet_ids
    }
  }

  dynamic "identity" {
    for_each = var.identity_settings

    content {
      type = identity.value.identity_type
    }
  }
}