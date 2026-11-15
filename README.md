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
# Terraform Lessons Learned

Over time, I've been managing multiple complex Terraform repositories, many of which consume private Terraform modules.

While managing these repositories, I've made quite a few mistakes. But each mistake taught me something valuable.

Uncle Bob (Robert C. Martin) introduced several software engineering principles. Similarly, based on my experience, I've come up with a few principles of my own for maintaining clean and manageable Terraform repositories, in addition to HashiCorp's Terraform best practices.

Here are some of them:

## 1. Don't unintentionally couple independent modules through shared variables

Using the same variable for multiple modules can create unexpected changes.

For example, let's say you have two Azure App Service Plans (ASPs), one for Linux apps and another for Windows apps. Both are currently using the same SKU.

If both modules use the same Terraform variable and you later decide to upgrade the SKU of the Linux ASP, the Windows ASP will also get the same change.

Keep separate variables for separate modules, even if they currently use the same value.

## 2. Use `count` with Boolean variables to control resource deployment

If the same Terraform codebase is shared across multiple environments, use `count` with a Boolean variable to control resource creation and destruction based on environment requirements.

Set the Boolean variable to `true` to create the resource (`count = 1`) or `false` to remove it (`count = 0`).

This helps avoid deploying resources that are not needed in a particular environment while maintaining a common Terraform codebase.

## 3. Use variables instead of hardcoding values

Avoid hardcoding values wherever possible.

Using variables makes your Terraform code more flexible and easier to maintain. It also allows you to change configurations without modifying the actual module code.

## 4. Set proper variable values for all environments

Don't provide correct values for one environment and leave dummy or placeholder values for the others.

Remember, the same codebase is often managed by multiple people and used across different environments. Incorrect or placeholder values can create confusion and lead to deployment issues.

Make sure every environment has the right configuration.

## 5. Complete the process after making code changes

Making changes to Terraform code is only the first step. Ensure you complete the entire process.

Run formatting, validation and Terraform plan. Review the proposed changes, get the required PR approvals and follow through with the deployment process.

Remember, changing the Terraform configuration doesn't mean the infrastructure changes have been completed. Always ensure the changes are applied successfully.

**Don't leave infrastructure changes halfway.**

## 6. Avoid unnecessary targeted runs

Terraform targeting (`-target`) is useful in certain situations, but don't make it part of your regular workflow.

Frequently using targeted plans or applies can leave your infrastructure in an inconsistent state or cause Terraform to miss other changes that should be applied.

Always prefer a normal Terraform plan and apply unless there is a valid reason to use targeting.

## 7. Take time to review PRs before approving

Don't rush through pull requests.

Take time to review the Terraform logic, variable changes, module references and environment-specific configurations.

A small mistake in a shared Terraform repository can affect multiple environments, so a proper review can save a lot of time and trouble.

## And finally, follow KISS and DRY principles

Keep your code simple (KISS) and avoid unnecessary duplication (DRY).

Apply the same principles to Terraform. Keep your configurations simple, avoid unnecessary complexity, and reuse code wherever it makes sense.

I've shared a few lessons from my experience. What about you? Feel free to share your learnings and mistakes too. Always happy to learn from others!