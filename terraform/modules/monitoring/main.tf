# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/terraform/example"

  retention_in_days = 14

  tags = {
    Name = "Example Log Group"
  }
}