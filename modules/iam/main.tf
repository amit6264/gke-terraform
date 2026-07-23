resource "google_service_account" "gke_node_sa" {
  account_id   = "gke-node-sa"
  display_name = "GKE Node Service Account"
}


resource "google_service_account" "github_actions_sa" {
  account_id   = "github-actions-sa"
  display_name = "GitHub Actions Service Account"
}


resource "google_service_account" "argocd_sa" {
  account_id   = "argocd-sa"
  display_name = "ArgoCD Service Account"
}



locals {
  gke_node_roles = [
    "roles/artifactregistry.reader",
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/stackdriver.resourceMetadata.writer"
  ]
}

resource "google_project_iam_member" "gke_node_roles" {

  for_each = toset(local.gke_node_roles)

  project = var.project_id

  role = each.value

  member = "serviceAccount:${google_service_account.gke_node_sa.email}"
}






locals {

  github_roles = [

    "roles/artifactregistry.writer",

    "roles/container.developer",

    "roles/iam.serviceAccountUser"

  ]

}

resource "google_project_iam_member" "github_roles" {

  for_each = toset(local.github_roles)

  project = var.project_id

  role = each.value

  member = "serviceAccount:${google_service_account.github_actions_sa.email}"

}




locals {

  argocd_roles = [

    "roles/container.developer",

    "roles/artifactregistry.reader"

  ]

}

resource "google_project_iam_member" "argocd_roles" {

  for_each = toset(local.argocd_roles)

  project = var.project_id

  role = each.value

  member = "serviceAccount:${google_service_account.argocd_sa.email}"

}
