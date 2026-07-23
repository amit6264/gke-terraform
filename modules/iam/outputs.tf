output "gke_node_service_account_email" {

  value = google_service_account.gke_node.email
}

output "github_actions_service_account_email" {

  value = google_service_account.github.email
}

output "argocd_service_account_email" {

  value = google_service_account.argocd.email
}
