variable "windows_instance_type" {
  type        = string
  description = "VM instance type"
  default     = "n2-standard-2"
}

variable "windows_2022_sku" {
  type        = string
  description = "SKU for Windows Server 2022"
  default     = "windows-cloud/windows-2022"
}

variable "windows_instance_name" {
  type        = string
  description = "name of the vm instance"
  default     = "windows_private_instance"
}

variable "gcp_zone" {
  type        = string
  description = "name of the gcp zone"
  
}