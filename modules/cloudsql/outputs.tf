output "connection_string" {
  value     = "postgresql://${var.db_user}:${var.db_password}@${google_sql_database_instance.instance.private_ip_address}:5432/${var.database_name}"
  sensitive = true
}