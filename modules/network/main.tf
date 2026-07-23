#############################################
# VPC
#############################################

resource "google_compute_network" "vpc" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

#############################################
# Private Subnet
#############################################

resource "google_compute_subnetwork" "private" {

  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr

  region  = var.region
  network = google_compute_network.vpc.id

  private_ip_google_access = true

  secondary_ip_range {

    range_name    = "pods"

    ip_cidr_range = var.pods_cidr
  }

  secondary_ip_range {

    range_name    = "services"

    ip_cidr_range = var.services_cidr
  }
}

#############################################
# Firewall
#############################################

resource "google_compute_firewall" "internal" {

  name = "${var.network_name}-internal"

  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    var.subnet_cidr,
    var.pods_cidr
  ]
}

#############################################
# SSH Firewall (Optional)
#############################################

resource "google_compute_firewall" "ssh" {

  name = "${var.network_name}-ssh"

  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = [
    "0.0.0.0/0"
  ]

  target_tags = [
    "ssh"
  ]
}

#############################################
# Cloud Router
#############################################

resource "google_compute_router" "router" {

  name = "${var.network_name}-router"

  region = var.region

  network = google_compute_network.vpc.id
}

#############################################
# Cloud NAT
#############################################

resource "google_compute_router_nat" "nat" {

  name = "${var.network_name}-nat"

  router = google_compute_router.router.name

  region = var.region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
