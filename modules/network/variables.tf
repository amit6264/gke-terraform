variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "pods_cidr" {
  type = string
}

variable "services_cidr" {
  type = string
}

variable "pods_secondary_range_name" {
  type    = string
  default = "pods"
}

variable "services_secondary_range_name" {
  type    = string
  default = "services"
}

variable "environment" {
  type = string
}
