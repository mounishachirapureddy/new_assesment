# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "gke_router" {
  name    = var.router_name
  region  = var.region
  network = google_compute_network.custom_network.id
}