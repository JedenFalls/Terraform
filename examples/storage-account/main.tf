terraform {
  required_version = ">= 1.0.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.78.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  tenant_id                  = var.tenant_id
  subscription_id            = var.subscription_id
  client_id                  = var.terraform_client_id
  client_secret              = var.terraform_client_secret
  skip_provider_registration = true

  features {}
}

module "storage-accounts" {
  source = "github.com/JedenFalls/Terraform.git//_modules/azurerm.storage-account?ref=azstorageaccount"
  
  rg_name                  = var.rg_name
  location                 = var.location

  for_each                 = var.sa_settings
  sa_name                  = each.value.name
  sa_tier                  = each.value.sa_tier
  sa_replication_type      = each.value.sa_replication_type
  network_rules_settings   = each.value.network_rules_settings
  identity_settings        = each.value.identity_settings
}
