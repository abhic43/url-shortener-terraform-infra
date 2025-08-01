variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "pod_range_cidr" {
  type = string
}

variable "service_range_cidr" {
  type = string
}

variable "deletion_protection" {
  type    = bool
  default = false
}