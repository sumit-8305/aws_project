# resource "aws_instance" "ec2_instance" {
#     ami = vars.ami_id
#     instance_type = vars.instance_type
#     subnet_id = aws_subnet.subnet.id
#     tags = {
#         Name = vars.instance_name
#     }
# }

variable "instance_type" {
  description = "type of EC2 instance."
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "EC2 instance name."
  type        = string
  default     = "my-ec2-instance"
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance."
  type        = string
}

variable "owner_id" {
  description = "Owner ID for the AMI."
  type        = string
  default     = "137112412989"
}
