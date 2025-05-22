output "vpc_id" {
  value = aws_vpc.vpc_main.id
}

output "subnet_id" {
  value = aws_subnet.subnet_main.id
}

output "subnet_secondary_id" {
  value = aws_subnet.subnet_secondary.id
}

output "sg" {
  value = aws_security_group.allow_tls
}
