data "aws_vpc" "vpc" {
  tags = {
    Name = var.environment
  }
}

data "aws_subnet" "subnet" {
  tags = {
    Name = var.environment
  }
}

data "aws_security_group" "sg" {
  tags = {
    Name = var.environment
  }
}
