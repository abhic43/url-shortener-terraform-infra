resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.vpc_name}-subnet"
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.subnet_cidr
  secondary_ip_range {
    range_name    = "pod-range"
    ip_cidr_range = var.pod_range_cidr
  }
  secondary_ip_range {
    range_name    = "service-range"
    ip_cidr_range = var.service_range_cidr
  }
  private_ip_google_access = true
}