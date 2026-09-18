/* Common variables */
variable "project_id" {
  description = "Project ID to create resources in."
  type        = string
  default     = "dev-dataops"
}

variable "region" {
  description = "Region to place compute resources at."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone to place compute resource at."
  type        = string
  default     = "us-central1-c"
}

variable "gcs_bucket" {
  description = "Bucket Name"
  type        = string
  default     = "dev-dataops-terraform-ex1"
}

variable "gcs_location" {
  description = "Bucket location"
  type        = string
  default     = "US"
}
variable "gcs_type" {
  description = "Bucket Type"
  type        = string
  default     = "STANDARD"
}
variable "bq_dataset_id" {
  description = "BQ dataset ID"
  type        = string
  default     = "dev_db"
}

variable "bq_dataset_friendly_name" {
  description = "BQ dataset name"
  type        = string
  default     = "DEV dataset"
}

variable "bq_dataset_description" {
  description = "BQ dataset description"
  type        = string
  default     = "DEV dataset for testing terraform command"
}

variable "bq_dataset_location" {
  description = "BQ dataset location"
  type        = string
  default     = "us-central1"
}

variable "vm_machine_type" {
  description = "Machine type for GCE instance."
  type        = string
  default     = "e2-standard-2"
}

variable "vm_machine_name" {
  description = "Compute Instance name."
  type        = string
  default     = "vm-v1"
}

variable "vm_network" {
  description = "Network to create compute resources in."
  type        = string
  default     = "default"
}

variable "vm_subnetwork" {
  description = "Subnet to create compute resources in."
  type        = string
  default     = "default"
}

# terraform-backend-bucket-ex1