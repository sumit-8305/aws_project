data "aws_ami" "amazon_linux" {
  most_recent      = true
  owners           = [var.owner_id]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-*-x86_64"]
  }

  # filter {
  #   name   = "architecture"
  #   values = ["x86_64"]
  # }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}