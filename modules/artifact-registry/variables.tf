variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Artifact Registry region"
  type        = string
}

variable "repository_name" {
  description = "Artifact Registry Repository Name"
  type        = string
}

variable "description" {
  description = "Repository Description"
  type        = string
  default     = "Docker repository for GKE applications"
}
