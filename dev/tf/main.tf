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
    #ami                     = "ami-06fd8a495a537da8b"
    ami                     = "ami-0bce4e4fa191ff9a0"
    instance_type           = "t2.micro"
    security_groups         = [aws_security_group.allow_http_from_alb.name]
    key_name                = "ubuntu_desktop"
    tags                    =  {
        Name                = "NodeJS"
    }
    user_data = <<-EOF
	#! /bin/bash
    sudo docker run -d --name node-web-app-c -p 80:8080 -v node-web-volume:/usr/src/app jimmy/node-web-app
    EOF
}