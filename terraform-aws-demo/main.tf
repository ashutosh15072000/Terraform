provider "aws" {
    region="eu-central-1"
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
