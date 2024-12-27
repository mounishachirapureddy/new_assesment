variable "subnetwork_name" {
  description = "Name of the subnetwork"
  type        = string
  default     = "private"
}

variable "ip_cidr_range" {
  description = "Primary IP range for the subnetwork"
  type        = string
  default     = "10.0.0.0/18"
}

variable "region" {
  description = "Region for the subnetwork"
  type        = string
  #default     = "us-central1"
}

variable "pod_range_name" {
  description = "Name of the secondary range for Kubernetes pods"
  type        = string
  default     = "k8s-pod-range"
}

variable "pod_ip_cidr_range" {
  description = "IP range for Kubernetes pods"
  type        = string
  default     = "10.48.0.0/14"
}

variable "service_range_name" {
  description = "Name of the secondary range for Kubernetes services"
  type        = string
  default     = "k8s-service-range"
}

variable "service_ip_cidr_range" {
  description = "IP range for Kubernetes services"
  type        = string
  default     = "10.52.0.0/20"
}

