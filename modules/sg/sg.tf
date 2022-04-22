resource "aws_security_group" "sg_lab" {
    name        = "sg_lab"
    vpc_id      = var.vpcid
    description = "allow ssh and http access"
    ingress {
        from_port   = var.ssh
        to_port     = var.ssh
        protocol    = var.protocol_type_ssh
        cidr_blocks = var.cidr_default
    }
    ingress {
        from_port   = var.http
        to_port     = 8089
        protocol    = var.protocol_type_ssh
        cidr_blocks = var.cidr_default
    }
    egress{
        from_port   = var.egress_port
        to_port     = var.egress_port
        protocol    = "-1"
        cidr_blocks = var.cidr_default
    }
}
