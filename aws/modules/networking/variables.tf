variable "vpc_cidr_block" {
  type = string
  default = "172.31.0.0/16"
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
  default = "ap-south-1a"
}

variable "subnet_cidr_block" {
  type = string
  default = "172.31.10.0/24"
}
