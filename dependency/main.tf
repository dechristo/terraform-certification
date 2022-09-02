
data "aws_instance" "db_search" {
  filter {
    name = "tag:Name"
    values = ["DB Server"]
  } 
}

data "aws_instance" "ec2_search" {
  filter {
    name = "tag:Name"
    values = ["App server"]
  } 
}

output "db_servers" {
  value = data.aws_instance.db_search.availability_zone
}

output "app_servers" {
  value = data.aws_instance.ec2_search.availability_zone
}