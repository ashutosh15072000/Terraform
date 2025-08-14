provider "aws" {
    region="eu-central-1"
    access_key=""
    secret_key=""
}
resource "aws_instance" "ec2_example" {
    ami = ""  
    instance_type = var.instance_type
    tags = {
        Name = "Terraform EC2"
    }
}