resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr_block_id
    gateway_id = var.gateway_id
  }

  tags = {
    Name = var.Name
  }
}

resource "aws_route_table_association" "pub_association" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.route_table.id
}