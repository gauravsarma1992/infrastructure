variable "node_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "size" {
  type = string
  default = "s-1vcpu-1gb"
}

variable "image" {
  type = string
  default = "ubuntu-18-04-x64"
}

variable "region" {
  type = string
  default = "blr1"
}
