variable "instance_name" {
  type        = string
  description = "name of the instance"
  default     = "jenkins_sonarqube"
}
variable "instance_type" {
  type        = string
  description = "VM instance type"
  default     = "e2-medium"
}
variable "zone" {
  type        = string
  description = "VM instance zone"
  default     = "us-central1-a"
}
variable "windows_instance_type" {
  type        = string
  description = "VM instance type"
  default     = "n2-standard-2"
}
variable "windows_instance_type" {
  type        = string
  description = "VM instance type"
  default     = "n2-standard-2"
}
