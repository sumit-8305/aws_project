# resource "aws_route_table" "example" {
#   vpc_id = aws_vpc.vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "example"
#   }
# }

# resource "aws_route_table_association" "pub_association" {
#   subnet_id      = aws_subnet.subnet.id
#   route_table_id = aws_route_table.example.id
# }

variable "vpc_id" {
  description = "The ID of the VPC where the route table will be created."
  type        = string
}

variable "gateway_id" {
  description = "The ID of the Internet Gateway to use for the default route."
  type        = string
}

variable "cidr_block_id" {
  description = "The CIDR block for the default route."
  type        = string
  default     = "0.0.0.0/0"
}

variable "name" {
  description = "The name tag for the route table."
  type        = string
  default     = "rt_ec2"
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the route table."
  type        = string
}


