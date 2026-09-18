resource "google_storage_bucket" "gcs" {
  name          = var.gcs_bucket
  location      = var.gcs_location
  storage_class = var.gcs_type

  uniform_bucket_level_access = true
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id    = var.bq_dataset_id
  friendly_name = var.bq_dataset_friendly_name
  description   = var.bq_dataset_description
  location      = var.bq_dataset_location

  labels = {
    env = "dev"
  }

}

resource "google_compute_instance" "vm" {
  name         = var.vm_machine_name
  machine_type = var.vm_machine_type
  zone         = var.zone

  tags = ["dev"]

  boot_disk {
    initialize_params {
      image = "centos-stream-9"
    }
  }

  network_interface {
    network    = var.vm_network
    subnetwork = var.vm_subnetwork
    access_config {
    }
  }
}
