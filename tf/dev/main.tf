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
    ami                     = "ami-06fd8a495a537da8b"
    instance_type           = "t2.micro"
    security_groups         = [aws_security_group.allow_http_from_alb.name]
    tags                    =  {
        Name                = "NodeJS"
    }
}