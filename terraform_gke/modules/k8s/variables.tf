variable "pod_range_name" {
  description = "Name of the secondary range for Kubernetes pods"
  type        = string
  default     = "k8s-pod-range"
}
variable "service_range_name" {
  description = "Name of the secondary range for Kubernetes services"
  type        = string
  default     = "k8s-service-range"
}
variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "new_cluster"
}

variable "cluster_location" {
  description = "Location of the cluster"
  type        = string
  default     = "us-central1-a"
}
variable "node_locations" {
  description = "Location of the node"
  type        = string
  default     = "us-central1-b"
}
