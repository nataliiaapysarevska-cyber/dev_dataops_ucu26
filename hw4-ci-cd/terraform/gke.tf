resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.zone

  initial_node_count  = 0
  deletion_protection = false

  release_channel {
    channel = "REGULAR"
  }
}

resource "google_container_node_pool" "primary" {
  name       = "hw4-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.gke.name
  node_count = var.node_count

  node_config {
    machine_type    = var.machine_type
    service_account = var.gke_node_sa

    disk_size_gb = 30
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
