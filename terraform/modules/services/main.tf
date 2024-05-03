# Example service: AWS EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-0965eacc05e445912"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

  tags = {
    Name = "ExampleInstance"
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
