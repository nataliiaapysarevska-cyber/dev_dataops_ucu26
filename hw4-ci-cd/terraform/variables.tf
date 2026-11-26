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
variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "hw4-gke-cluster"
}
variable "machine_type" {
  description = "Machine type for GCE instance."
  type        = string
  default     = "e2-standard-2"
}
variable "node_count" {
  description = "GKE node count."
  type        = number
  default     = 2
}

variable "gke_node_sa" {
  description = "GKE node Service Account."
  type        = string
}