provider "aws" {
    region = "eu-central-1"
}

provider "aws" {
    region = "eu-north-1"
    alias = sweden
}

resource "aws_vpc" "stockholmvpc" {
    cidr_block = "10.0.0.0/16"
    provider = aws.sweden
}