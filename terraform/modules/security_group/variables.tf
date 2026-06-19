variable "sg_name" {
  description = "The name of the security group."
  type        = string
  default     = "terraform-sg"
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
  type        = string
}

variable "cidr_block_id" {
  description = "The CIDR blocks to allow traffic from."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}