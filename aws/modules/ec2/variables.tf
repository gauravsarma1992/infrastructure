variable "instance_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
  default = "ap-south-1c"
}

variable "ami_id" {
    type = string
    default = "ami-06984ea821ac0a879"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "pg-key"
}
