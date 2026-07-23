output "gke_node_sa_email" {
  value = google_service_account.gke_node_sa.email
}

output "github_actions_sa_email" {
  value = google_service_account.github_actions_sa.email
}

output "argocd_sa_email" {
  value = google_service_account.argocd_sa.email
}
