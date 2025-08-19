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

resource "aws_iam_user" {
    count = length(var.usernames)
    name  = var.usernames[count.index]
}

variable "user_names" {
    description = "IAM usernames"
    type = list(string)
    default = ['user1','user2','user3']

}
