resource "aws_key_pair" "ec2_login_key" {
  key_name   = var.key_name
  public_key = var.public_key_content
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
    private_key = var.private_key_content
    host        = self.public_ip
    timeout     = "2m"
  }

  # provisioner "file" {
  #   source      = "${path.root}/../webpage/index.html"
  #   destination = "/tmp/index.html"
  # }

  provisioner "remote-exec" {
    inline = [
      # --- 1. Your Initial Server Setup ---
      "sudo dnf install -y nginx git",
      "sudo systemctl enable --now nginx",
      "sudo rm -rf /usr/share/nginx/html/*",
      "sudo git clone ${var.git_repo_url} /usr/share/nginx/html",
      "sudo systemctl restart nginx",

      # --- 2. Jenkins CI/CD Preparation ---
      # Transfer ownership so Jenkins (ec2-user) can run git pull without sudo
      "sudo chown -R ec2-user:ec2-user /usr/share/nginx/html",

      # Create the deployment script that Jenkins will trigger over SSH
      "echo '#!/bin/bash' > /home/ec2-user/deploy.sh",
      "echo 'cd /usr/share/nginx/html' >> /home/ec2-user/deploy.sh",
      "echo 'git pull origin main' >> /home/ec2-user/deploy.sh",
      "echo 'sudo systemctl restart nginx' >> /home/ec2-user/deploy.sh",

      # Make the deployment script executable
      "chmod +x /home/ec2-user/deploy.sh"
    ]
  }
}
