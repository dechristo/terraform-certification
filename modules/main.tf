provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_ec2_service" {
  ami           = "ami-0e2031728ef69a466"
  instance_type = "t2.micro"

  tags = {
    Name = "App server"
  }
}

module "db_server" {
  source = "./db"
}

output "db_private_ip" {
  value = module.db_server.private_ip
}


output "db_public_ip" {
  value = module.db_server.public_ip
}
