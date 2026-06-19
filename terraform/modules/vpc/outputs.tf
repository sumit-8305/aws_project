output "vpc_id" {
  sensitive = true
  value     = aws_vpc.vpc.id
}