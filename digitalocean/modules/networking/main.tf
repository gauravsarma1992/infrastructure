resource "digitalocean_vpc" "this" {
  name     = "${var.environment}-vpc" 
  region   = var.region 
  ip_range = var.cidr_block
}
