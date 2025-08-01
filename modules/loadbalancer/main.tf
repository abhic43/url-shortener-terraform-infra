resource "google_compute_forwarding_rule" "frontend" {
  name                  = "${var.service_name}-frontend"
  project               = var.project_id
  region                = var.region
  ip_protocol           = "TCP"
  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.backend.id
  ports                 = ["80"]
  subnetwork            = google_compute_subnetwork.subnet.self_link
}

resource "google_compute_region_backend_service" "backend" {
  name                  = "${var.service_name}-backend"
  project               = var.project_id
  region                = var.region
  protocol              = "TCP"
  load_balancing_scheme = "INTERNAL"
  health_checks         = [google_compute_region_health_check.health_check.id]
}

resource "google_compute_region_health_check" "health_check" {
  name               = "${var.service_name}-health-check"
  project            = var.project_id
  region             = var.region
  check_interval_sec = 5
  timeout_sec        = 5
  tcp_health_check {
    port = 80
  }
}

data "google_compute_subnetwork" "subnet" {
  name    = var.subnet_name
  project = var.project_id
  region  = var.region
}