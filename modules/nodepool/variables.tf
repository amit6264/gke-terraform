#############################################################
# Project
#############################################################

variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

#############################################################
# Region
#############################################################

variable "region" {
  description = "GKE Region"
  type        = string
}

#############################################################
# Cluster
#############################################################

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

#############################################################
# Environment
#############################################################

variable "environment" {
  description = "Environment Name"
  type        = string
}

#############################################################
# Node Pool
#############################################################

variable "node_pool_name" {
  description = "Node Pool Name"
  type        = string
}

#############################################################
# Machine
#############################################################

variable "machine_type" {
  description = "Machine Type"
  type        = string

  default = "e2-standard-2"
}

#############################################################
# Disk
#############################################################

variable "disk_type" {
  description = "Disk Type"
  type        = string

  default = "pd-balanced"
}

variable "disk_size_gb" {
  description = "Disk Size"

  type = number

  default = 100
}

#############################################################
# Image
#############################################################

variable "image_type" {

  description = "Node Image"

  type = string

  default = "COS_CONTAINERD"

}

#############################################################
# Autoscaling
#############################################################

variable "min_node_count" {

  type = number

  default = 2

}

variable "max_node_count" {

  type = number

  default = 5

}

#############################################################
# Spot VM
#############################################################

variable "spot" {

  description = "Use Spot Nodes"

  type = bool

  default = false

}

#############################################################
# Service Account
#############################################################

variable "service_account" {

  description = "GKE Node Service Account"

  type = string

}

#############################################################
# Labels
#############################################################

variable "node_labels" {

  description = "Extra Labels"

  type = map(string)

  default = {}

}

#############################################################
# Tags
#############################################################

variable "node_tags" {

  description = "Network Tags"

  type = list(string)

  default = []

}

#############################################################
# Taints
#############################################################

variable "node_taints" {

  description = "Node Taints"

  type = list(object({

    key = string

    value = string

    effect = string

  }))

  default = []

}

#############################################################
# Upgrade
#############################################################

variable "max_surge" {

  type = number

  default = 1

}

variable "max_unavailable" {

  type = number

  default = 0

}

#############################################################
# OAuth Scopes
#############################################################

variable "oauth_scopes" {

  type = list(string)

  default = [

    "https://www.googleapis.com/auth/cloud-platform"

  ]

}
