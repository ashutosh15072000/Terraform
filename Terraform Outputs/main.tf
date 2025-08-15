provider "aws" {
    region=""
    access_key=""
    secret_key=""
}

resource "aws_instance" "ec2_example" {
    ami = ""  
    instance_type = "t2.micro" 
    tags = {
        Name = "Terraform EC2"
    }
}

output "My_Console_Output" {
    value = aws_instance.ec2_example.public_ip
    sensitive = true
}
