variable "service_account_id" {
  description = "The account ID for the service account"
  type        = string
  default     = "gke_service_account"
}

variable "project_id" {
  description = "The project ID where resources will be created"
  type        = string
  #default     = ""
}

# variable "project_role" {
#   description = "The IAM role to assign at the project level"
#   type        = string
#   default     = "roles/storage.admin"
# }

variable "service_account_role" {
  description = "The IAM role to assign to the service account"
  type        = string
  default     = "roles/iam.workloadIdentityUser"
}

variable "service_account_member" {
  description = "The member binding for the service account IAM"
  type        = string
  default     = "serviceAccount:devops-v4.svc.id.goog[staging/service_account]"
}
