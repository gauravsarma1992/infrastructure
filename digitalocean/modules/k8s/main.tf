resource "digitalocean_kubernetes_cluster" "this" {
  name     = "${var.environment}-${var.cluster_name}" 
  region   = var.region 
  version  = var.cluster_version 
  vpc_uuid = data.digitalocean_vpc.vpc.id

  node_pool {
    name       = var.node_pool_name 
    size       = var.node_size 
    auto_scale = true
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
  }
}

resource "local_file" "kubeconfig_file" {
  content  = digitalocean_kubernetes_cluster.this.kube_config.0.raw_config
  filename = "/tmp/${var.cluster_name}.kubeconfig"
}
