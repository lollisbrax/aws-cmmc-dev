variable "bucket_name" {
  description = "Name of the S3 bucket for backups"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID associated with the backup resources"
  type        = string
}