provider "aws" {
    region = "eu-central-1"
    shared_credentials_files = ["C:/Users/ayush/.aws/credentials"]
    profile = "dev"

}

resource "aws_s3_bucket" "bucket-1" {
    tags = {
        "name" = "test-bucket-1"
    
    }
}

resource "aws_instance" "ec2_example" {
    ami = ""
    instance_type = "t2.micro"

    tags = {
        Name = "Terraform EC2"
    }

    depends_on = [aws_s3_bucket.bucket-1]

}