# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "gke_service_account" {
  account_id = var.service_account_id
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
#resource "google_project_iam_member" "project_iam_member" {
# project = var.project_id
# role    = var.project_role
# member  = "serviceAccount:${google_service_account.service_account.email}"
#}

resource "google_project_iam_member" "gke_roles" {
  for_each = toset([
    "roles/container.admin",
    "roles/compute.networkAdmin",
    "roles/compute.instanceAdmin",
    "roles/iam.serviceAccountUser",
    "roles/storage.admin"
  ])

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam
resource "google_service_account_iam_member" "gke_service_account" {
  service_account_id = google_service_account.gke_service_account.id
  role               = var.service_account_role
  member             = "serviceAccount:devops-v4.svc.id.goog[staging/gke_service_account]"
}
