#########################
## GCP Provider - Main ##
#########################

# Define Terraform provider
terraform {
  required_version = "~> 1.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      // version = "4.11.0" # pinning version
    }
  }
}

provider "google" {
  credentials = file(var.gcp_auth_file)
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}

module "bastion_host" {
  source        = "./modules/bastion_host"
  gcp_zone        = var.gcp_zone
}

module "firewall" {
  source        = "./modules/firewall"
}

module "service_account" {
  source        = "./modules/service_account"
  gcp_project     = var.gcp_project
}

module "subnets" {
  source        = "./modules/subnets"
  gcp_region      = var.gcp_region
}

module "vm" {
  source        = "./modules/vm"
  gcp_zone        = var.gcp_zone
}

module "vpc" {
  source        = "./modules/vpc"
}