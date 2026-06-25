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

variable "security_group_id" {
  description = "Security group ID for the EC2 instance."
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name for SSH access."
  type        = string
}

variable "private_key_path" {
  description = "Local SSH private key path for provisioner connection."
  type        = string
  default     = "~/.ssh/my_aws_key"
}



variable "owner_id" {
  description = "Owner ID for the AMI."
  type        = string
  default     = "137112412989"
}

variable "git_repo_url" {
  description = "Git repository URL to clone."
  type        = string
  default     = "https://github.com/sumit-8305/website_aws_project.git"
}
