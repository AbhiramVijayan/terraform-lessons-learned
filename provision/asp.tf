# GOOD PRACTICE:
# 1. Use count to control module deployment based on environment requirements.
# 2. Use variables instead of hardcoding environment-specific values.
# 3. Use separate variables for Linux and Windows ASPs.


# Linux App Service Plan
module "linux_asp" {
  source = "tfc.abhiram.com/abhiram/asp/azurerm"

  count = var.enable_linux_asp ? 1 : 0 #(1)

  name                = var.linux_asp_name 
  location            = var.location #(2)
  resource_group_name = var.resource_group_name
  sku_name            = var.linux_asp_sku #(3)
  os_type             = "Linux"
}


# Windows App Service Plan
module "windows_asp" {
  source = "tfc.abhiram.com/abhiram/asp/azurerm"

  count = var.enable_windows_asp ? 1 : 0

  name                = var.windows_asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.windows_asp_sku
  os_type             = "Windows"
}