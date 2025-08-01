resource "google_sql_database_instance" "instance" {
  name             = var.instance_name
  project          = var.project_id
  region           = var.region
  database_version = "POSTGRES_15"
  settings {
    tier = var.db_tier
    ip_configuration {
      private_network = "projects/${var.project_id}/global/networks/${var.vpc_name}"
    }
  }
  deletion_protection = var.deletion_protection
}

resource "google_sql_database" "database" {
  name     = var.database_name
  project  = var.project_id
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "user" {
  name     = var.db_user
  project  = var.project_id
  instance = google_sql_database_instance.instance.name
  password = var.db_password
}