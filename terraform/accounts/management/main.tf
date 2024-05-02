resource "aws_organizations_account" "management" {
  name  = "Management"
  email = "management@example.com"

  tags = {
    Name = "Management Account"
  }
}

resource "aws_cloudformation_stack" "management_resources" {
  name = "Management-Resources"
  template_body = file("${path.module}/template.json")
}
