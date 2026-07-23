locals {

  service_accounts = {
    gke_node = {
      account_id   = "${var.environment}-gke-node-sa"
      display_name = "GKE Node Service Account"
    }

    github = {
      account_id   = "${var.environment}-github-actions-sa"
      display_name = "GitHub Actions Service Account"
    }

    argocd = {
      account_id   = "${var.environment}-argocd-sa"
      display_name = "ArgoCD Service Account"
    }
  }

  gke_roles = [
    "roles/artifactregistry.reader",
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/stackdriver.resourceMetadata.writer",
    "roles/secretmanager.secretAccessor",
    "roles/cloudsql.client"
  ]

  github_roles = [
    "roles/artifactregistry.writer",
    "roles/container.developer",
    "roles/iam.serviceAccountUser"
  ]

  argocd_roles = [
    "roles/container.developer",
    "roles/artifactregistry.reader"
  ]
}
