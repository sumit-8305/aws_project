resource "aws_key_pair" "ec2_login_key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/my_aws_key.pub")
}

resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ec2_login_key.key_name
  vpc_security_group_ids      = [var.security_group_id]

  tags = {
    Name = var.instance_name
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
    timeout     = "2m"
  }

  # provisioner "file" {
  #   source      = "${path.root}/../webpage/index.html"
  #   destination = "/tmp/index.html"
  # }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install -y nginx git",
      "sudo systemctl enable --now nginx",
      "sudo rm -rf /usr/share/nginx/html/*",
      "sudo git clone ${var.git_repo_url} /usr/share/nginx/html",
      "sudo systemctl restart nginx"
    ]
  }
}
