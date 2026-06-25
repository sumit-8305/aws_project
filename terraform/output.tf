output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}

output "jenkins_public_ip" {
  value = module.jenkins.jenkins_public_ip
}
