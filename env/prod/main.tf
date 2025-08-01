module "network" {
  source = "../../modules/network"

  project_id   = var.project_id
  region       = var.region
  vpc_name     = "url-shortener-vpc-${var.environment}"
  subnet_cidr  = "10.0.0.0/17"
}

module "gke" {
  source = "../../modules/gke"

  project_id       = var.project_id
  region           = var.region
  cluster_name     = "url-shortener-cluster-${var.environment}"
  vpc_name         = module.network.vpc_name
  subnet_name      = module.network.subnet_name
  pod_range_cidr   = "192.168.0.0/18"
  service_range_cidr = "192.168.64.0/18"
}

module "cloudsql" {
  source = "../../modules/cloudsql"

  project_id       = var.project_id
  region           = var.region
  database_name    = "url_shortener"
  instance_name    = "url-shortener-db-${var.environment}"
  vpc_name         = module.network.vpc_name
  db_user          = "postgres"
  db_password      = var.db_password
}

module "loadbalancer" {
  source = "../../modules/loadbalancer"

  project_id       = var.project_id
  region           = var.region
  cluster_name     = module.gke.cluster_name
  service_name     = "url-shortener-service-${var.environment}"
  subnet_name      = module.network.subnet_name
}