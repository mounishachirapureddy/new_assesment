provider "google"{ 
  project     = var.gcp_project
  region      = var.region
  zone        = var.gcp_zone
}
# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "<your-bucket>"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
module "vpc" {
  source        = "./modules/vpc"
}

module "firewalls" {
  source        = "./modules/firewalls"
}

module "service_account" {
  source        = "./modules/service_account"
  gcp_project = var.gcp_project
}

module "subnets" {
  source        = "./modules/subnets"
  gcp_region = var.region
 
}

module "vm" {
  source        = "./modules/vm"
}


