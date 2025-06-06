resource "azurerm_subscription" "example" {
  alias             = "examplesub"
  subscription_name = "My Example Subscription"
  subscription_id   = var.subscription_id
}

resource "azurerm_resource_group" "mate_example" {
  name     = var.resource_group_name
  location = coalesce(var.azregion, "West Europe")
}

resource "azurerm_storage_account" "example_st" {
  name                     = coalesce(var.st_account_name, local.st_account_name) # если var.storage_account_name == null, возьмёт local.storage_account_name
  resource_group_name      = azurerm_resource_group.mate_example.name
  location                 = coalesce(var.azregion, "West Europe")
  account_tier             = local.account_tier
  account_replication_type = local.storage_replication_type
  tags                     = { owner = local.owner }
}

resource "azurerm_storage_container" "example_stc" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.example_st.id
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.example_st]
}

resource "azurerm_storage_blob" "terraform_zip" {
  name                   = var.blob_name
  storage_container_name = azurerm_storage_container.example_stc.name
  type                   = "Block"
  source                 = data.archive_file.terraform_code.output_path
  depends_on             = [data.archive_file.terraform_code]
  storage_account_name   = azurerm_storage_account.example_st.name
}

data "archive_file" "terraform_code" {
  type        = "zip"
  source_dir  = "${path.module}/."  # Путь к папке с Terraform кодом
  output_path = "${path.module}/terraform-code.zip"  # Куда сохранить архив
  excludes    = [".terraform", "terraform.tfstate", "*.zip", ".github", ".venv", "README.md", ".git", ".idea", "*.*~"]  # Исключаемые файлы
}



