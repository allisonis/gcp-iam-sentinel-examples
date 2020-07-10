# google_project_iam_binding 
# Non authoritative project IAM binding
# https://www.terraform.io/docs/providers/google/r/google_organization_iam_member.html
resource "google_organization_iam_member" "iam_member" {
  org_id = var.organization_id
  role    = var.role
  member  = var.sa_member
}

# google_organization_iam_binding 
# Authoritative organization IAM binding
# https://www.terraform.io/docs/providers/google/r/google_organization_iam_binding.html
# Authoritative
resource "google_organization_iam_binding" "iam_binding" {
  org_id = var.organization_id
  role    = var.role

  members = [
    var.sa_member,
  ]
}

# google_organization_iam_policy 
# Authoritative organization level IAM binding
# https://www.terraform.io/docs/providers/google/r/google_organization_iam_policy.html
resource "google_organization_iam_policy" "iam_policy_binding" {
  org_id     = var.organization_id
  policy_data = data.google_iam_policy.organization_iam_policy_data.policy_data
}

data "google_iam_policy" "organization_iam_policy_data" {
  binding {
    role = "roles/editor"

    members = [
      "serviceAccount:697046005533-compute@developer.gserviceaccount.com",
    ]
  }
}
