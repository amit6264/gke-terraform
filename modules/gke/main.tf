resource "google_container_cluster" "gke" {

  name     = var.cluster_name
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {

    cluster_secondary_range_name  = "pods"

    services_secondary_range_name = "services"

  }

  private_cluster_config {

    enable_private_nodes = true

    enable_private_endpoint = false

    master_ipv4_cidr_block = "172.16.0.0/28"

  }

  workload_identity_config {

    workload_pool = "${var.project_id}.svc.id.goog"

  }

  release_channel {

    channel = "REGULAR"

  }

  logging_service = "logging.googleapis.com/kubernetes"

  monitoring_service = "monitoring.googleapis.com/kubernetes"

  network_policy {

    enabled = true

  }

  vertical_pod_autoscaling {

    enabled = true

  }

  master_auth {

    client_certificate_config {

      issue_client_certificate = false

    }

  }

  node_config {

    service_account = var.gke_service_account

    shielded_instance_config {

      enable_secure_boot = true

      enable_integrity_monitoring = true

    }

  }
}
