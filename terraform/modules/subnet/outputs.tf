output "subnet_id" {
  sensitive = true
  value     = aws_subnet.subnet.id
}