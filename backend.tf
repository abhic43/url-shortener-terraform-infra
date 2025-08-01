terraform {
  backend "gcs" {
    bucket  = "url-shortener-terraform-state"
    prefix  = "env/${terraform.workspace}"
    credentials = "path/to/service-account-key.json"
  }
}