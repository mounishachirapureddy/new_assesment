
data "template_file" "windows-metadata" {
template = <<EOF
# Install IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools;
EOF
}

# Create VM
resource "google_compute_instance" "vm_instance_public" {
  name         = var.windows_instance_name
  machine_type = var.windows_instance_type
  zone         = var.gcp_zone
  tags         = ["rdp","http"]

  boot_disk {
    initialize_params {
      image = var.windows_2022_sku
    }
  }

  metadata = {
    sysprep-specialize-script-ps1 = data.template_file.windows-metadata.rendered
  }

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    access_config { }
  }
} 
