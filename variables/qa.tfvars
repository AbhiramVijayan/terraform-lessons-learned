# BAD PRACTICE:
# Don't leave dummy or placeholder values in environment-specific tfvars files.
# These files are used by multiple engineers, and incorrect values
# can lead to unexpected resource deployments.

# Common variables
location            = "Central India"
resource_group_name = "rg-qa-apps"


# Linux App Service Plan
enable_linux_asp = true
linux_asp_name   = "dummy-asp"
linux_asp_sku    = "B1"


# Windows App Service Plan
enable_windows_asp = true
windows_asp_name   = "dummy-asp"
windows_asp_sku    = "B1"