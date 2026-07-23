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

variable "admin_cidr" {
  type = string
}


variable "node_pool_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "disk_size_gb" {
  type = number
}

variable "disk_type" {
  type = string
}

variable "min_node_count" {
  type = number
}

variable "max_node_count" {
  type = number
}
