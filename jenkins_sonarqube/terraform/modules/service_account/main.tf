resource "google_service_account" "vm_sa" {
  account_id   = "vm_service_account"
  display_name = "vm_service_account"
}
resource "google_project_iam_member" "bastion_sa_compute_instance_admin" {
  project     = var.gcp_project
  role   = "roles/compute.instanceAdmin"
  member = "serviceAccount:${google_service_account.vm_sa.email}"
}

resource "google_project_iam_member" "bastion_sa_service_account_user" {
  project     = var.gcp_project
  role   = "roles/iam.serviceAccountUser"
  member = "serviceAccount:${google_service_account.vm_sa.email}"
}
