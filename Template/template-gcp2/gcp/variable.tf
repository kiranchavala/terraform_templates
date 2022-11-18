variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "gke_cluster_name" {
  description = "name of the k8s cluster"
}

variable "vpc_name" {
  description = "name of the vpc"
}

variable "client_email" {
  description = "service account email address"
}
