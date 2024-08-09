# aws-cmmc-dev/terraform/modules/organizations/main.tf

# Create the Log Archive account in AWS Organizations
resource "aws_organizations_account" "log_archive" {
  name      = var.log_archive_account_name  # Name of the Log Archive account
  email     = var.log_archive_account_email # Email address for the Log Archive account
  role_name = var.org_role_name             # IAM role name for the new account
}

# Create the Audit account in AWS Organizations
resource "aws_organizations_account" "audit_account" {
  name      = var.audit_account_name  # Name of the Audit account
  email     = var.audit_account_email # Email address for the Audit account
  role_name = var.org_role_name       # IAM role name for the new account
}

# Create an Organizational Unit (OU) for logging
resource "aws_organizations_organizational_unit" "logging" {
  name      = var.logging_ou_name  # Name of the Logging OU
  parent_id = aws_organizations_organization.org.roots[0].id  # ID of the root organization
}

# Create an Organizational Unit (OU) for auditing
resource "aws_organizations_organizational_unit" "audit" {
  name      = var.audit_ou_name  # Name of the Audit OU
  parent_id = aws_organizations_organization.org.roots[0].id  # ID of the root organization
}

# Ensure that AWS Organizations is set to use all features
resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}
