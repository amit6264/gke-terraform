resource "google_container_node_pool" "primary" {

  name     = var.node_pool_name
  location = var.region
  cluster  = var.cluster_name

  initial_node_count = var.min_node_count

  autoscaling {

    min_node_count = var.min_node_count
    max_node_count = var.max_node_count

  }

  management {

    auto_repair  = true
    auto_upgrade = true

  }

  upgrade_settings {

    max_surge       = 1
    max_unavailable = 0

  }

  node_config {

    machine_type = var.machine_type

    disk_size_gb = var.disk_size_gb

    disk_type = var.disk_type

    service_account = var.service_account

    image_type = "COS_CONTAINERD"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      environment = "dev"
      managed_by  = "terraform"
    }

    tags = [
      "gke-node"
    ]

    shielded_instance_config {

      enable_secure_boot          = true
      enable_integrity_monitoring = true

    }

    workload_metadata_config {

      mode = "GKE_METADATA"

    }
  }
}
