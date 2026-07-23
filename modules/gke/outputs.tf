#############################################################
# Cluster Information
#############################################################

output "cluster_name" {
  description = "GKE Cluster Name"
  value       = google_container_cluster.this.name
}

output "cluster_id" {
  description = "GKE Cluster ID"
  value       = google_container_cluster.this.id
}

output "cluster_location" {
  description = "Cluster Region"
  value       = google_container_cluster.this.location
}

#############################################################
# Kubernetes API Endpoint
#############################################################

output "cluster_endpoint" {
  description = "Kubernetes API Endpoint"
  value       = google_container_cluster.this.endpoint
}

#############################################################
# CA Certificate
#############################################################

output "cluster_ca_certificate" {
  description = "Cluster CA Certificate"

  value = google_container_cluster.this.master_auth[0].cluster_ca_certificate

  sensitive = true
}

#############################################################
# Workload Identity
#############################################################

output "workload_identity_pool" {

  description = "Workload Identity Pool"

  value = google_container_cluster.this.workload_identity_config[0].workload_pool

}

#############################################################
# Network
#############################################################

output "network" {

  description = "VPC Network"

  value = google_container_cluster.this.network

}

output "subnetwork" {

  description = "Subnet"

  value = google_container_cluster.this.subnetwork

}

#############################################################
# Services CIDR
#############################################################

output "services_ipv4_cidr" {

  description = "Service CIDR"

  value = google_container_cluster.this.services_ipv4_cidr

}

#############################################################
# Cluster IPv4 CIDR
#############################################################

output "cluster_ipv4_cidr" {

  description = "Pod CIDR"

  value = google_container_cluster.this.cluster_ipv4_cidr

}

#############################################################
# Master Version
#############################################################

output "master_version" {

  description = "Master Version"

  value = google_container_cluster.this.master_version

}

#############################################################
# Release Channel
#############################################################

output "release_channel" {

  description = "Release Channel"

  value = google_container_cluster.this.release_channel[0].channel

}
