resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }
  tags = {
    Name = var.instance_name
    Role = "jenkins"
  }

  provisioner "remote-exec" {
    inline = [
      # 1. Update system and install 'wget' (essential for downloading the repo)
      "sudo dnf update -y",
      "sudo dnf install -y wget git",

      # 2. Download the Jenkins repository file
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo",

      # 3. Import the Jenkins GPG key
      "sudo rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key",

      # 4. Force-enable the repository (AL2023 sometimes defaults to disabled)
      "sudo sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/jenkins.repo",

      # 6. Install Java (Corretto 21)
      "sudo dnf install -y java-21-amazon-corretto",

      # 7. Install Jenkins
      "sudo dnf install -y jenkins",

      # 8. Enable and start the service
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",

      # 9. Verify status
      "sudo systemctl status jenkins --no-pager",

      # 10. Output the initial admin password for Jenkins setup

      "echo 'Initial Admin Password: '",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}