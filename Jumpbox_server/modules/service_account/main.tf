resource "google_service_account" "bastion_sa" {
  account_id   = "bastion_service_account"
  display_name = "bastion_service_account"
}
resource "google_project_iam_member" "bastion_sa_compute_instance_admin" {
  project     = var.gcp_project
  role   = "roles/compute.instanceAdmin"
  member = "serviceAccount:${google_service_account.bastion_sa.email}"
}

resource "google_project_iam_member" "bastion_sa_service_account_user" {
  project     = var.gcp_project
  role   = "roles/iam.serviceAccountUser"
  member = "serviceAccount:${google_service_account.bastion_sa.email}"
}
