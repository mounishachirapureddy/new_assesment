variable "network-subnet-cidr" {
  type        = string
  description = "The CIDR for the network subnet"
  default = "10.0.0.0/16"
}
variable "subnet" {
  type        = string
  description = "The CIDR for the network subnet"
  default = "public_subnet"
}
variable "gcp_region" {
  type        = string
  description = "name of the gcp project"
}