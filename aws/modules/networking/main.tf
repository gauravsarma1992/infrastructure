resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.environment
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block = var.subnet_cidr_block
  availability_zone = var.region
  tags = {
    Name = var.environment
  }
}

resource "aws_subnet" "rds_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "172.35.12.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "${var.environment}-rds"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.environment
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.environment
  }
}

resource "aws_route_table_association" "rt_association" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.example.id
}

resource "aws_security_group" "sg" {
  name        = var.environment
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from anywhere"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH from Anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Postgres"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    #cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Pgbouncer"
    from_port        = 6432
    to_port          = 6432
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    #cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.environment
    Env = var.environment
  }
}

resource "aws_eip" "bar" {
  vpc = true
  depends_on = [aws_internet_gateway.igw]
}
