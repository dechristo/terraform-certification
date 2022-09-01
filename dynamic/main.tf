provider "aws" {
  region = "eu-central-1"
}

variable "ingress_rules" {
  type    = list(number)
  default = [25, 80, 443, 8080, 8443]
}

variable "egress_rules" {
  type    = list(number)
  default = [443, 8443]
}

resource "aws_instance" "my_ec2_db" {
  ami           = "ami-0e2031728ef69a466"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]
  tags = {
    Name = "DB Server"
  }
}

resource "aws_security_group" "web_traffic" {
    name = "Secure Server"
    dynamic "ingress" {
        iterator = port
        for_each = var.ingress_rules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" {
        iterator = port
        for_each = var.egress_rules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}