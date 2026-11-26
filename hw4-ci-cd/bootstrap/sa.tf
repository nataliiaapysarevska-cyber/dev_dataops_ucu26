resource "google_service_account" "infra" {
  project      = var.project_id
  account_id   = "hw4-infras-sa"
  display_name = "HW4 Infras CI/CD"

  depends_on = [google_project_service.required_apis]
}

resource "google_service_account" "app" {
  project      = var.project_id
  account_id   = "hw4-app-sa"
  display_name = "HW4 App CI/CD"

  depends_on = [google_project_service.required_apis]
}

resource "google_service_account" "gke_node" {
  project      = var.project_id
  account_id   = "hw4-gke-node-sa"
  display_name = "HW4 GKE Node"

  depends_on = [google_project_service.required_apis]
}