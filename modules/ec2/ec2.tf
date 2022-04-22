resource "aws_instance" "ec2-docker-public" {
    ami = var.ami
    instance_type = var.instance
    subnet_id = var.public_sn_id
    security_groups = [var.sg_id]
    key_name = var.key
    
    tags = { Name = "tf-ec2-public" }
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install docker -y
                systemctl start docker
                sudo usermod -aG docker ec2-user
                docker run -p 8080:80 nginx
                EOF
}

resource "aws_instance" "ec2-docker-private" {
    ami = var.ami
    instance_type = var.instance
    subnet_id = var.private_sn_id
    security_groups = [var.sg_id]
    key_name = var.key
    
    tags = { Name = "tf-ec2-private" }
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install docker -y
                systemctl start docker
                sudo usermod -aG docker ec2-user
                docker run -p 8080:80 nginx
                EOF
}