# resource "aws_vpc" "vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "terraform-vpc"
#   }
# }

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name tag for the VPC."
  type        = string
  default     = "terraform-vpc"
}