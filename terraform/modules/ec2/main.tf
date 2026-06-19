resource "aws_instance" "ec2_instance" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    associate_public_ip_address = true
    tags = {
        Name = var.instance_name
    }
}