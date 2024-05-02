# Example service: AWS EC2 instance
resource "aws_instance" "service_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "Service Instance"
  }
}