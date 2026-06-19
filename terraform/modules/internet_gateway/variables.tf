# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.vpc.id
#   tags = {
#     Name = var.igw_name
#   }
# }

variable "vpc_id" {
  description = "The ID of the VPC to attach the Internet Gateway to."
  type        = string
}

variable "igw_name" {
  description = "The name of the Internet Gateway."
  type        = string
}