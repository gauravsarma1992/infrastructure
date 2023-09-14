variable "environment" {
  type = string
}

variable "region" {
  type = string
  default = "blr1"
}

variable "cidr_block" {
  type = string
  default = "10.10.0.0/16"
}
