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

module "firewall" {
  source        = "./modules/firewall"
}

module "service_account" {
  source        = "./modules/service_account"
  project_id = var.gcp_project
}

module "subnets" {
  source        = "./modules/subnets"
  region = var.region
}

module "router" {
  source        = "./modules/router"
  region = var.region
}

module "nodepools" {
  source        = "./modules/nodepools"
}

module "nat" {
  source        = "./modules/nat"
  region = var.region
}

module "k8s" {
  source        = "./modules/k8s"
}

module "firewalls" {
  source        = "./modules/firewalls" 
}

