variable "gcp_project" {
  type        = string
  description = "GCP project name"
  default = ""
}

# define GCP region
variable "region" {
  type        = string
  description = "GCP region"
  default = " "
}

variable "gcp_zone" {
  type        = string
  description = "GCP zone"
  default = " "
}