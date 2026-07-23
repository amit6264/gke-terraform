#############################################################
# GKE Node Pool
#############################################################

resource "google_container_node_pool" "primary" {

  name     = var.node_pool_name
  project  = var.project_id
  location = var.region
  cluster  = var.cluster_name

  ###########################################################
  # Initial Nodes
  ###########################################################

  initial_node_count = var.min_node_count

  ###########################################################
  # Autoscaling
  ###########################################################

  autoscaling {

    min_node_count = var.min_node_count
    max_node_count = var.max_node_count

  }

  ###########################################################
  # Node Management
  ###########################################################

  management {

    auto_repair  = true
    auto_upgrade = true

  }

  ###########################################################
  # Upgrade Strategy
  ###########################################################

  upgrade_settings {

    max_surge       = var.max_surge
    max_unavailable = var.max_unavailable

  }

  ###########################################################
  # Node Configuration
  ###########################################################

  node_config {

    #########################################################
    # Compute
    #########################################################

    machine_type = var.machine_type

    spot = var.spot

    #########################################################
    # Disk
    #########################################################

    disk_type = var.disk_type

    disk_size_gb = var.disk_size_gb

    image_type = var.image_type

    #########################################################
    # Service Account
    #########################################################

    service_account = var.service_account

    oauth_scopes = var.oauth_scopes

    #########################################################
    # Metadata
    #########################################################

    metadata = {

      disable-legacy-endpoints = "true"

    }

    #########################################################
    # Workload Metadata
    #########################################################

    workload_metadata_config {

      mode = "GKE_METADATA"

    }

    #########################################################
    # Shielded VM
    #########################################################

    shielded_instance_config {

      enable_secure_boot = true

      enable_integrity_monitoring = true

    }

    #########################################################
    # Labels
    #########################################################

    labels = local.common_labels

    #########################################################
    # Tags
    #########################################################

    tags = var.node_tags

    #########################################################
    # Linux Node Config
    #########################################################

    linux_node_config {

      sysctls = {

        "net.core.somaxconn" = "1024"

      }

    }

    #########################################################
    # Dynamic Node Taints
    #########################################################

    dynamic "taint" {

      for_each = var.node_taints

      content {

        key = taint.value.key

        value = taint.value.value

        effect = taint.value.effect

      }

    }

  }

}
