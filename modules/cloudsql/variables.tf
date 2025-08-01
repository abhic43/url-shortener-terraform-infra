variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "database_name" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
}

variable "db_tier" {
  type    = string
  default = "db-f1-micro"
}

variable "deletion_protection" {
  type    = bool
  default = false
}