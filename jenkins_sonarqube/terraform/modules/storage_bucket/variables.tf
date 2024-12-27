variable "bucket_name" {
  type        = string
  description = "name of the bucket"
  default = "jenkins_sonarqube"
}
variable "location" {
  type        = string
  description = "location of the bucket"
  default = ""
}
