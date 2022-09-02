output "private_ip" {
    value = aws_instance.my_ec2_db.private_ip
}

output "public_ip" {
    value = aws_instance.my_ec2_db.public_ip
}