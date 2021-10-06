module "storage-accounts" {
  source = "github.com/JedenFalls/Terraform.git//azurerm.storage-account?ref=azstorageaccount"
  
  rg_name                  = var.rg_name
  location                 = var.location

  for_each                 = var.sa_settings
  sa_name                  = each.value.name
  sa_tier                  = each.value.sa_tier
  sa_replication_type      = each.value.sa_replication_type
  network_rules_settings   = each.value.network_rules_settings
  identity_settings        = each.value.identity_settings
}
