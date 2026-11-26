terraform {
  backend "gcs" {
    bucket = "terraform-backend-bucket-ex1"
    prefix = "hw4-ci-cd/infra"
  }
}
