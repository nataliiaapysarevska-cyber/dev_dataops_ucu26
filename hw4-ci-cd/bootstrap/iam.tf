resource "google_service_account_iam_member" "infra_github_access" {
  service_account_id = google_service_account.infra.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.workflow/${var.github_repository}/.github/workflows/hw4-infra.yml@refs/heads/main"
  depends_on         = [google_iam_workload_identity_pool_provider.github]
}

resource "google_project_iam_member" "infra_roles" {
  project = var.project_id
  role    = "roles/container.clusterAdmin"
  member  = "serviceAccount:${google_service_account.infra.email}"
}

resource "google_storage_bucket_iam_member" "infra_state_access" {
  bucket = "terraform-backend-bucket-ex1"
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.infra.email}"
}

resource "google_service_account_iam_member" "app_github_access" {
  service_account_id = google_service_account.app.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.workflow/${var.github_repository}/.github/workflows/hw4-app.yml@refs/heads/main"
  depends_on         = [google_iam_workload_identity_pool_provider.github]
}

resource "google_project_iam_member" "app_roles" {
  project = var.project_id
  role    = "roles/container.developer"
  member  = "serviceAccount:${google_service_account.app.email}"
}

resource "google_project_iam_member" "gke_node_roles" {
  project = var.project_id
  role    = "roles/container.defaultNodeServiceAccount"
  member  = "serviceAccount:${google_service_account.gke_node.email}"
}

resource "google_service_account_iam_member" "infra_node_access" {
  service_account_id = google_service_account.gke_node.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_service_account.infra.email}"
}