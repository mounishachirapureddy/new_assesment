# create public subnet
resource "google_compute_subnetwork" "network_subnet" {
  name          = var.subnet
  ip_cidr_range = var.network-subnet-cidr
  network       = google_compute_network.vpc.name
  region        = var.gcp_region
}