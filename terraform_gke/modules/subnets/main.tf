# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "gke_subnet" {
  name                     = var.subnetwork_name
  ip_cidr_range            = var.ip_cidr_range
  region                   = var.region
  network                  = google_compute_network.custom_vpc.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pod_range_name
    ip_cidr_range = var.pod_ip_cidr_range
  }
  secondary_ip_range {
    range_name    = var.service_range_name
    ip_cidr_range = var.service_ip_cidr_range
  }
}