# S3 bucket for backups
resource "aws_s3_bucket" "backup_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "Backup Bucket"
  }
}

# AWS Backup Vault
resource "aws_backup_vault" "main_vault" {
  name = "MainBackupVault"
}

# AWS Backup Plan
resource "aws_backup_plan" "backup" {
  name = "Main-Backup-Plan"

  rule {
    rule_name         = "DailyBackup"
    target_vault_name = aws_backup_vault.main_vault.name
    schedule          = "cron(0 12 * * ? *)"
  }
}