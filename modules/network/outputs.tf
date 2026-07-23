output "network_name" {
  value = google_compute_network.vpc.name
}

output "network_id" {
  value = google_compute_network.vpc.id
}

output "subnet_name" {
  value = google_compute_subnetwork.private.name
}

output "subnet_id" {
  value = google_compute_subnetwork.private.id
}

output "pods_secondary_range_name" {
  value = google_compute_subnetwork.private.secondary_ip_range[0].range_name
}

output "services_secondary_range_name" {
  value = google_compute_subnetwork.private.secondary_ip_range[1].range_name
}
