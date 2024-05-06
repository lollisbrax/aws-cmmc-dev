output "bucket_id" {
  value = aws_s3_bucket.backup_bucket.id
  description = "The ID of the backup S3 bucket"
}

output "backup_vault_id" {
  value = aws_backup_vault.main_vault.id
  description = "The ID of the backup vault"
}