provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}

output "myoutput" {
  value = aws_vpc.my_vpc.id
}

variable "my_tuple" {
  type    = tuple([string, number, string])
  default = ["hey", 1, "joe"]
}

variable "my_object" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "Hey Joe"
    port = [4000, 4001]
  }
}
