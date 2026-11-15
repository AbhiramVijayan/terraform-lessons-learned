# Terraform Lessons Learned

Practical Terraform examples based on lessons from managing multiple repositories and private modules.

## Repository structure

```text
terraform-lessons-learned/
├── provision/
│   ├── main.tf
│   ├── variables.tf
│   └── asp.tf
└── variables/
    ├── dev.tfvars
    ├── qa.tfvars
    └── prod.tfvars
```

## What this example demonstrates

1. Separate Linux and Windows ASP variables, even when their current values are the same.
2. Use `count` to enable or disable each module independently.
3. Keep environment-specific values in separate `.tfvars` files.
4. Reuse a private Terraform module.

## Important: update before running

The module source in `provision/asp.tf` is illustrative:

```hcl
source = "tfe.abhiram.com/abhiram/asp/azurerm"
```

Replace it with the actual hostname, organization, module name, and provider for your Terraform Enterprise private registry.

The module input names (`name`, `location`, `resource_group_name`, `sku_name`, and `os_type`) are examples. Confirm that they match the input variables exposed by your private ASP module.

The Azure provider block also requires appropriate Azure authentication in your environment.

## Commands

Run from the repository root:

```bash
terraform -chdir=provision init
terraform -chdir=provision validate

terraform -chdir=provision plan -var-file=../variables/dev.tfvars
terraform -chdir=provision plan -var-file=../variables/qa.tfvars
terraform -chdir=provision plan -var-file=../variables/prod.tfvars
```

## Example: disable Windows ASP in Dev

Set this in `variables/dev.tfvars`:

```hcl
enable_linux_asp   = true
enable_windows_asp = false
```

Terraform will configure zero instances of the Windows module and one instance of the Linux module.

> Note: `count` is useful when a module should have zero or one instances. For multiple keyed instances, consider `for_each`.
