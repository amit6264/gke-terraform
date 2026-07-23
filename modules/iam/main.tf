resource "google_service_account" "gke_node" {

  account_id   = local.service_accounts.gke_node.account_id

  display_name = local.service_accounts.gke_node.display_name
}

resource "google_service_account" "github" {

  account_id   = local.service_accounts.github.account_id

  display_name = local.service_accounts.github.display_name
}

resource "google_service_account" "argocd" {

  account_id   = local.service_accounts.argocd.account_id

  display_name = local.service_accounts.argocd.display_name
}


resource "google_project_iam_member" "gke_roles" {

  for_each = toset(local.gke_roles)

  project = var.project_id

  role = each.value

  member = "serviceAccount:${google_service_account.gke_node.email}"
}



resource "google_project_iam_member" "github_roles" {

  for_each = toset(local.github_roles)

  project = var.project_id

  role = each.value

  member = "serviceAccount:${google_service_account.github.email}"
}



resource "google_project_iam_member" "argocd_roles" {

  for_each = toset(local.argocd_roles)

  project = var.project_id

  role = each.value

  member = "serviceAccount:${google_service_account.argocd.email}"
}




resource "google_service_account_iam_binding" "workload_identity" {

  service_account_id = google_service_account.gke_node.name

  role = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project_id}.svc.id.goog[default/default]"
  ]
}
