output "gateway_id" {
  sensitive = true
  value     = aws_internet_gateway.igw.id
}