output "cluster_endpoint" {
  value = google_container_cluster.cluster.endpoint
}

output "cluster_name" {
  value = google_container_cluster.cluster.name
}