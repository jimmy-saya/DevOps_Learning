resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Default subnet for eu-west-1a"
  }
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Default subnet for eu-west-1b"
  }
}

resource "aws_default_subnet" "default_az3" {
  availability_zone = "eu-west-1c"

  tags = {
    Name = "Default subnet for eu-west-1c"
  }
}

#resource "aws_vpc" "default_vpc" {
#    cidr_block = "10.0.0.0/16"
#    enable_dns_hostnames = true

#    tags = {
#        Name = "default_vpc"
#    }
#}
