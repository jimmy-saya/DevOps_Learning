terraform{
    required_providers{
        aws = {
            source  = "hashicorp/aws"
            version = "~> 2.70"
        }
    }
}

provider "aws" {
    profile = "terraform-user"
    region  = "eu-west-1"
}

resource "aws_instance" "nodejs" {
    ami             = "ami-06fd8a495a537da8b"
    instance_type   = "t2.micro"
    tags            =  {
        Name        = "NodeJS"
    }
}