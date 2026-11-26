resource "google_project_service" "required_apis" {
  for_each = toset([
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "sts.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "container.googleapis.com"
  ])

  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}
