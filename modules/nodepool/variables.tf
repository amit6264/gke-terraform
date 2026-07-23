variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "cluster_name" {
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

variable "service_account" {
  type = string
}
