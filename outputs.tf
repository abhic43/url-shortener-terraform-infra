output "cluster_endpoint" {
  description = "GKE cluster endpoint"
  value       = module.gke.cluster_endpoint
}

output "database_connection_string" {
  description = "Cloud SQL connection string"
  value       = module.cloudsql.connection_string
  sensitive   = true
}

output "load_balancer_ip" {
  description = "Internal load balancer IP"
  value       = module.loadbalancer.load_balancer_ip
}