provider "aws" {
    region="eu-central-1"
    access_key=""
    secret_key=""
}
resource "aws_instance" "ec2_example" {
    ami = ""  
    instance_type = var.instance_type
    count = var.instance_count
    associate_public_ip_address=var.enable_public_ip
    tags = var.project_environment
}

resource "aws_iam_user" "example" {
    count = length(var.user_names)
    name = var.user_names[count.index]
}


variable "instance_count" {
    description = "Number of EC2 instances "
    type = number
    default = 1
}

variable "enable_public_ip" {
    description = "Enable public IP for EC2 instances"
    type = bool
    default = true

}

variable "user_names" {
    description = "List of user names"
    type = list(string)
    default = ["user1","user2","user3"]

}

variable "project_environment" {
    description = "Project name and environment"
    type = map(string)
    default = {
        project = "project-alpha"
        environment = "dev"
        
        }

}