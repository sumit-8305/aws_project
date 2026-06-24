variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "jenkins_instance_type" {
  description = "EC2 instance type for Jenkins."
  type        = string
  default     = "t3.small"
}

variable "jenkins_instance_name" {
  description = "Name tag for the Jenkins EC2 instance."
  type        = string
  default     = "jenkins-server"
}

variable "jenkins_key_name" {
  description = "EC2 key pair name for Jenkins instance SSH access."
  type        = string
  default     = "login-key"
}

