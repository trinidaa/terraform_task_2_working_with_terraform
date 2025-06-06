locals {
  st_account_name          = "stmatecon${lower(substr(md5(local.resource_group_name), 0, 4))}"
  account_tier             = "Standard"
  storage_replication_type = "LRS"
  resource_group_name      = "materesources1"
  owner                    = "Kaliak"
}
