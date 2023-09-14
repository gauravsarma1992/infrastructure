module "kafkavm" {
  source = "../../modules/droplets"

  environment = var.environment
  node_name = "kafkavm"
}
