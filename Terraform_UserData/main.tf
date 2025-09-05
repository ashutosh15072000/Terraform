provider "aws" {
    region = "eu-central-1"
    shared_credentials_files = ["C:/Users/ayush/.aws/credentials"]
    profile = "dev"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-00366ee91f1f30a7b"
    instance_type = "t2.micro"
    user_data     =  "${file("install_apache.sh")}"
    //user_data = <<-EOF
                  #!/bin/bash
                  echo "Hello world!" >hello.txt
                  EOF
}
resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress                = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    }
  ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = ""
}

output "fetched_info_from_aws" {
  value = format("%s%s","ssh -i C:/Users/ayush/.ssh/id_rsa ubuntu@",aws_instance.ec2_example.public_dns)
}