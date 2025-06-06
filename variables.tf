variable "azregion" {
  type    = string
  default = null
}

variable "st_account_name" {
  type    = string
  default = "stmatecon9999"
}

variable "container_name" {
  type    = string
  default = "vhds"
}

variable "blob_name" {
  type    = string
  default = "terraform.tfstate"
}

variable "resource_group_name" {
  type    = string
  default = "materesources1"
}

variable "subscription_id" {
  type    = string
  default = "9c2e0e5d-9337-4855-af79-231071eb6983"
  sensitive = true
}