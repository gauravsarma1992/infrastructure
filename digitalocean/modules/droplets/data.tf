data "digitalocean_vpc" "vpc" {
  name = "${var.environment}-vpc"
}

