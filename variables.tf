variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "environment" {
  type = string
}


variable "network_name" {}
variable "subnet_name" {}
variable "subnet_cidr" {}
variable "pods_cidr" {}
variable "services_cidr" {}


variable "repository_name" {
  type = string
}


variable "cluster_name" {
  type = string
}
