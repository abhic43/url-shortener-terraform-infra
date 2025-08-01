resource "google_container_cluster" "cluster" {
  name               = var.cluster_name
  project            = var.project_id
  location           = var.region
  enable_autopilot   = true
  network            = var.vpc_name
  subnetwork         = var.subnet_name
  deletion_protection = var.deletion_protection

  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-range"
    services_secondary_range_name = "service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}

data "google_client_config" "default" {}