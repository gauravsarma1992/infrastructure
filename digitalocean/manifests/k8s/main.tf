module "k8s" {
  source = "../../modules/k8s"
  cluster_name = var.cluster_name
  node_pool_name = var.node_pool_name
  environment    = var.environment
}
