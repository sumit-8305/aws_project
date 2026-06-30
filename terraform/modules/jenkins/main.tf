resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
  tags = {
    Name = var.instance_name
    Role = "jenkins"
  }

  user_data = <<-EOF
  #!/bin/bash
  # 1. Update and install dependencies
  dnf update -y
  dnf install -y wget git unzip java-21-amazon-corretto


  # 3. Install Jenkins
  wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo
  rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key
  sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/jenkins.repo
  dnf install -y jenkins


  # 5. Add Jenkins to wheel group for sudo access
  usermod -aG wheel jenkins
  echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/jenkins


  # 7. Start Jenkins
  systemctl enable --now jenkins

  # 8. Wait for password to be generated, then print to log
  echo "Waiting for Jenkins to initialize..."
  sleep 30
  echo "************************************************************"
  echo "JENKINS INITIAL ADMIN PASSWORD:"
  cat /var/lib/jenkins/secrets/initialAdminPassword
  echo "************************************************************"
  EOF
}