###AWS Credentials###

provider "aws" {
        shared_credentials_file = "/root/.aws/credentials"
        region = "${var.region}"
        profile = "default"
}

###Creating VPC###

resource "aws_vpc" "mediawiki-VPC" {
        cidr_block = "${var.cidr_block}"
        instance_tenancy = "default"
        tags = {
                Name = "MediaWiki-VPC"
        }
}

###Creating Internet gateway###

resource "aws_internet_gateway" "mediawiki-gateway" {
  vpc_id = aws_vpc.mediawiki-VPC.id

  tags = {
    Name = "MediaWiki-gateway"
  }
}

###Creating a Subnet###

resource "aws_subnet" "mediawiki-subnet" {
        vpc_id = aws_vpc.mediawiki-VPC.id
        cidr_block = "${var.subnet_cidr}"
        availability_zone = "${var.availability_zone}"
        tags = {
                Name = "MediaWiki-subnet"
        }
}

###Adding Internet gateway to the route table###

resource "aws_default_route_table" "mediawiki-route" {
        default_route_table_id = aws_vpc.mediawiki-VPC.default_route_table_id

        route {
                gateway_id = aws_internet_gateway.mediawiki-gateway.id
                cidr_block = "0.0.0.0/0"
        }

        tags = {
                Name = "MediaWiki-route"
        }
}


###Creating a Sercurity Group###

resource "aws_security_group" "mediawiki-security-group" {
        name = "MediaWiki-security-group"
        description = "this is for MediaWiki nodes"
        vpc_id = aws_vpc.mediawiki-VPC.id

        ingress {
          description = "Allowing all ports"
          from_port = 22
          to_port = 22
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
          description = "Allowing 80 port for HTTP"
          from_port = 80
          to_port = 80
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
          description = "Allowing 443 port for HTTPS"
          from_port = 443
          to_port = 443
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
          from_port   = 0
          to_port     = 65335
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
}