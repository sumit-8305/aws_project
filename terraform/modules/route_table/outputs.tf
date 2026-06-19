output "route_table_id" {
  sensitive = true
  value     = aws_route_table.route_table.id
}