# Example service: AWS EC2 instance
resource "aws_instance" "service_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "Service Instance"
  }
}
resource "aws_vpc" "service_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "service-vpc"
  }
}
resource "aws_subnet" "service_subnet" {
  vpc_id = aws_vpc.service_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "service-subnet"
  }
}
