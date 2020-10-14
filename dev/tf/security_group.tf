resource "aws_security_group" "allow_http_from_alb" {
    name        = "allow_http_from_alb"
    description = "allow http:80 inboud traffic from alb"
    #vpc_id      = aws_vpc.default_vpc.id

    ingress {
        from_port           = 80
        to_port             = 80
        protocol            = "tcp"
        security_groups   = [aws_security_group.allow_http.id]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

     tags = {
         Name = "allow_http_from_alb"
    }
}

resource "aws_security_group" "allow_http" {
    name        = "allow_http"
    description = "allow http:80 inboud traffic to alb"
    #vpc_id      = aws_vpc.default_vpc.id

    ingress {
        from_port           = 80
        to_port             = 80
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
        #security_groups   = aws_security_group.allow_http_to_alb.id
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

     tags = {
         Name = "allow_http"
    }
}