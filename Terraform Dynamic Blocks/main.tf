provider "aws" {
    region = "eu-central-1"
    access_key = ""
    secret_key = ""
}

locals {
    ingress =[{
        port = 443
        description = "ingress rules for port 443"
    },
    {
        port = 22
        description = "ingress rules for port 22"
    }]
}

resource "aws_instance" "ec2_example" {
    ami = ""
    instance_type = ""
    key_name = "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_security_group"  "main" {
    engress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = ""
            from_port = 0
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
            to_port = 0

        }
        ]
    dynamic "ingress" {
        for_each = local.ingress_rules
        content {
            description = ingress.value.description
            from_port = ingress.value.port
            to_port = ingress.value.port
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]

        }

    }

}

resource "aws_key_pair" "depployer" {
    aws_name = ""
    public_key = ""

}

}