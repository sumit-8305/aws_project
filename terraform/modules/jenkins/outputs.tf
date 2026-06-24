output "jenkins_instance_id" {
  description = "The ID of the Jenkins EC2 instance."
  value       = aws_instance.jenkins.id
}

output "jenkins_public_ip" {
  description = "Public IP address of the Jenkins EC2 instance."
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_public_dns" {
  description = "Public DNS name of the Jenkins EC2 instance."
  value       = aws_instance.jenkins.public_dns
}
