variable "location" {
  default = "eastus2"
}
variable "tenant_id" {}
variable "subscription_id" {}
variable "terraform_client_id" {}
variable "terraform_client_secret" {}

variable "rg_name" {
  default = "rg-terragrunt-poc"
}

variable "sa_settings" {
  default = {
    sa01 = {
      name                     = "amrexamplesa01"
      sa_tier                  = "Standard"
      sa_replication_type      = "LRS"
      network_rules_settings   = []
      identity_settings        = [{ identity_type = "SystemAssigned" }]
    }
  }
}
