output "workload_identity_provider" {
  description = "Workload Identity Provider for GitHub Actions"
  value       = google_iam_workload_identity_pool_provider.github.name
}

output "infra_sa" {
  description = "Infrastructure CI/CD Service Account"
  value       = google_service_account.infra.email
}

output "app_sa" {
  description = "Application CI/CD Service Account"
  value       = google_service_account.app.email
}

output "gke_node_sa" {
  description = "GKE Node Service Account"
  value       = google_service_account.gke_node.email
}
