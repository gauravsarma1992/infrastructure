variable "cluster_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
  default = "blr1"
}

variable "cluster_version" {
  type = string
  default = "1.25.4-do.0"
}

variable "node_pool_name" {
  type = string
}

variable "node_size" {
  type = string
  default = "s-2vcpu-2gb"
}

variable "min_nodes" {
  type = number
  default = 1
}

variable "max_nodes" {
  type = number
  default = 2
}
