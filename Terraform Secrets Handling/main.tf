provider "aws" {
    region = "eu-central-1"
    shared_credentials_files = ["C:/Users/ayush/.aws/credentials"]
    profile = "dev"
}

resource "aws_instance" "ec2_example" {
    ami = ""
    instance_type = var.instance_type
    tags = {
        Name = "Terraform EC2"
    }

}


variable "instance_type" {
    description = "instance Type t2.micro"
    type = string
    default = "t2.micro"
}