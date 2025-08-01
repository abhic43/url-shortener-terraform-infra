output "load_balancer_ip" {
  value = google_compute_forwarding_rule.frontend.ip_address
}