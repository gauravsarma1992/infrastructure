module "aws_networking" {
  source = "../../modules/networking"
  environment = var.environment
  vpc_cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
}
