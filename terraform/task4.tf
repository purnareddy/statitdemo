resource "aws_vpc" "statit_vpc" {
  cidr_block       = "10.10.0.0/16"
}

resource "aws_internet_gateway" "statit_igw" {
  vpc_id = aws_vpc.statit_vpc.id
}

resource "aws_subnet" "statit_subnet" {
  vpc_id = aws_vpc.statit_vpc.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "statit_rt" {
  vpc_id = aws_vpc.statit_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.statit_igw.id
  }
}

resource "aws_route_table_association" "statit_rta" {
  subnet_id      = aws_subnet.statit_subnet.id
  route_table_id = aws_route_table.statit_rt.id
}

resource "aws_security_group" "statit_sg" {
  name        = "statit-security-group"
  vpc_id      = aws_vpc.statit_vpc.id
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "statit_ec2_instance" {
  ami             = "ami-048ff3da02834afdc" 
  instance_type   = "t2.small"
  subnet_id       = aws_subnet.statit_subnet.id
  security_groups = [aws_security_group.statit_sg.id]

  user_data = <<EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y httpd
  EOF
}