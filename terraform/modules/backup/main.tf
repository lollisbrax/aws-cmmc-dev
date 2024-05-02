# S3 bucket for backups
resource "aws_s3_bucket" "backup_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "Backup Bucket"
  }
}