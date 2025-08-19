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

resource "aws_iam_user"  "examples" {
    for each = length(var.usernames)
    name  = each.value
}

variable "user_names" {
    description = "IAM usernames"
    type = list(string)
    default = ['user1','user2','user3']

}

output "print_the_names" {
  value = [for name in var.user_names : name]
}