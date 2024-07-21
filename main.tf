variable "project_id" {
  description = "Cluster Name"
  type        = string
  default     = "agea-challenge"
}

variable "region" {
  default = "us-central1"
  description = "Region Name"
  type        = string
}

provider "google" {
  project     = var.project_id
  region      = var.region
}

resource "google_container_cluster" "primary" {
  name     = "agea-gke-cluster-by-terraform"
  location = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  
  deletion_protection = false

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

}