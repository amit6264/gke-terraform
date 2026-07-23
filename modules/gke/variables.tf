variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Cluster Region"
  type        = string
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "network" {
  description = "VPC Name"
  type        = string
}

variable "subnetwork" {
  description = "Subnet Name"
  type        = string
}

variable "pods_secondary_range_name" {
  description = "Pods Secondary Range"
  type        = string
}

variable "services_secondary_range_name" {
  description = "Services Secondary Range"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "master_ipv4_cidr_block" {
  description = "Master CIDR Block"
  type        = string

  default = "172.16.0.0/28"
}

variable "enable_private_nodes" {

  type = bool

  default = true

}

variable "enable_private_endpoint" {

  type = bool

  default = false

}

variable "release_channel" {

  type = string

  default = "REGULAR"

}

variable "admin_cidr" {

  type = string

  description = "Office VPN/Public IP"

}

variable "deletion_protection" {

  type = bool

  default = false

}

variable "maintenance_start_time" {

  type = string

  default = "03:00"

}
