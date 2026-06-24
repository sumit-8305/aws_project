variable "instance_type" {
  description = "EC2 instance type for Jenkins."
  type        = string
  default     = "t3.small"
}

variable "instance_name" {
  description = "Name tag for the Jenkins EC2 instance."
  type        = string
  default     = "jenkins-server"
}

variable "subnet_id" {
  description = "Subnet ID where the Jenkins EC2 instance will be launched."
  type        = string
}

variable "security_group_id" {
  description = "Security group ID attached to the Jenkins EC2 instance."
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name for SSH access to the Jenkins instance."
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