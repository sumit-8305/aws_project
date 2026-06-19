# resource "aws_subnet" "subnet" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = "10.0.1.0/24"
#   tags = {
#     Name = "terraform-subnet"
#   }
# }

variable "vpc_id" {
  description = "The ID of the VPC where the subnet will be created."
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "The name tag for the subnet."
  type        = string
  default     = "terraform-subnet"
}