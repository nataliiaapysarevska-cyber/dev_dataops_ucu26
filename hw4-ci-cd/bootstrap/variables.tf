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

variable "github_repository" {
  description = "GitHub repository allowed to authenticate"
  type        = string
  default     = "nataliiaapysarevska-cyber/dev_dataops_ucu26"
}