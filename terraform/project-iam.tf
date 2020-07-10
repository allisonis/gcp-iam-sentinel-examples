# google_project_iam_binding non authoritative project IAM binding
# https://www.terraform.io/docs/providers/google/r/google_project_iam.html#google_project_iam_member-1
resource "google_project_iam_member" "iam_member" {
  project = var.project_id
  role    = var.role
  member  = var.sa_member
}

# google_project_iam_binding Authoritatice project IAM binding
# https://www.terraform.io/docs/providers/google/r/google_project_iam.html#google_project_iam_binding-1
# Authoritative
resource "google_project_iam_binding" "iam_binding" {
  project = var.project_id
  role    = var.role

  members = [
    var.sa_member
  ]
}

# google_project_iam_policy Authoritative project level IAM binding
# https://www.terraform.io/docs/providers/google/r/google_project_iam.html#google_project_iam_policy-1  
resource "google_project_iam_policy" "project" {
  project     = var.project_id
  policy_data = data.google_iam_policy.test_default_project_iam.policy_data
}

data "google_iam_policy" "test_default_project_iam" {
  binding {
    role = "roles/editor"

    members = [
      var.sa_member
    ]
  }
}
