provider "aws" {
    region = ""
    access_key = ""
    secret_key = ""
}

locals {
    instance_name = "${terrform.workspace}-instance"
}

resource "aws-instance" "ec2_example" {
    ami = ""
    instance_type = var.instance_type
    tags = {
        Name = "local.instance_name"
    }
    }