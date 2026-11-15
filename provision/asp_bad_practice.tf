# BAD PRACTICE:
# 1. Both modules reuse the same SKU variable, coupling their configurations.
# 2. No count is used to control module deployment based on environment requirements.
#    This means both modules are always instantiated.
# 3. Hardcoding values makes the configuration less flexible.
# Any environment-specific change requires modifying the Terraform code.

module "linux_asp" {
  source = "tfc.abhiram.com/abhiram/asp/azurerm"
  name                = var.linux_asp_name
  sku_name            = var.asp_sku  #(1)
  location            = "Central India" #(3)
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
}

module "windows_asp" {
  source = "tfc.abhiram.com/abhiram/asp/azurerm"
  name                = var.windows_asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.asp_sku
  os_type             = "Windows"
}