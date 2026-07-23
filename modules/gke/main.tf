#############################################################
# GKE Cluster
#############################################################

resource "google_container_cluster" "this" {

  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  ###########################################################
  # Network
  ###########################################################

  network    = var.network
  subnetwork = var.subnetwork

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {

    cluster_secondary_range_name  = var.pods_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name

  }

  ###########################################################
  # Private Cluster
  ###########################################################

  private_cluster_config {

    enable_private_nodes    = var.enable_private_nodes

    enable_private_endpoint = var.enable_private_endpoint

    master_ipv4_cidr_block = var.master_ipv4_cidr_block

  }

  ###########################################################
  # Remove Default Node Pool
  ###########################################################

  remove_default_node_pool = true

  initial_node_count = 1

  ###########################################################
  # Workload Identity
  ###########################################################

  workload_identity_config {

    workload_pool = "${var.project_id}.svc.id.goog"

  }

  ###########################################################
  # Release Channel
  ###########################################################

  release_channel {

    channel = var.release_channel

  }

  ###########################################################
  # Dataplane V2
  ###########################################################

  datapath_provider = "ADVANCED_DATAPATH"

  ###########################################################
  # Network Policy
  ###########################################################

  network_policy {

    enabled = true

  }

  ###########################################################
  # Vertical Pod Autoscaler
  ###########################################################

  vertical_pod_autoscaling {

    enabled = true

  }

  ###########################################################
  # Logging
  ###########################################################

  logging_config {

    enable_components = [

      "SYSTEM_COMPONENTS",

      "WORKLOADS"

    ]

  }

  ###########################################################
  # Monitoring
  ###########################################################

  monitoring_config {

    enable_components = [

      "SYSTEM_COMPONENTS",

      "WORKLOADS"

    ]

  }

  ###########################################################
  # Cluster Addons
  ###########################################################

  addons_config {

    http_load_balancing {

      disabled = false

    }

    horizontal_pod_autoscaling {

      disabled = false

    }

    dns_cache_config {

      enabled = true

    }

    gce_persistent_disk_csi_driver_config {

      enabled = true

    }

  }

  ###########################################################
  # Maintenance Window
  ###########################################################

  maintenance_policy {

    recurring_window {

      start_time = "2026-01-01T${var.maintenance_start_time}:00Z"

      end_time = "2026-01-01T05:00:00Z"

      recurrence = "FREQ=WEEKLY;BYDAY=SU"

    }

  }

  ###########################################################
  # Authorized Networks
  ###########################################################

  master_authorized_networks_config {

    cidr_blocks {

      cidr_block = var.admin_cidr

      display_name = "Admin"

    }

  }

  ###########################################################
  # Resource Labels
  ###########################################################

  resource_labels = local.common_labels

  ###########################################################
  # Security
  ###########################################################

  deletion_protection = var.deletion_protection

}
