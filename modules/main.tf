provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_ec2_service" {
  ami = "ami-0e2031728ef69a466"
  instance_type = "t2.micro"

  tags = {
    Name = "App server"
  }
}