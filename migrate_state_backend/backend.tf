terraform {
  backend "gcs" {
    bucket = "terraform-backend-bucket-ex2"
    prefix = "terraform/state"
  }
}
