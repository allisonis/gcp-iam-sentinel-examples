# google_folder_iam_binding 
# Non authoritative project IAM binding
# https://www.terraform.io/docs/providers/google/r/google_folder_iam_member.html
resource "google_folder_iam_member" "iam_member" {
  folder = var.folder_name
  role    = var.role
  member  = var.sa_member
}

# google_folder_iam_binding 
# Authoritative folder IAM binding
# https://www.terraform.io/docs/providers/google/r/google_folder_iam_binding.html
# Authoritative
resource "google_folder_iam_binding" "iam_binding" {
  folder = var.folder_name
  role    = var.role
  members = [
    var.sa_member,
  ]
}

# google_folder_iam_policy 
# Authoritative folder level IAM binding
# https://www.terraform.io/docs/providers/google/r/google_folder_iam_policy.html
resource "google_folder_iam_policy" "folder_iam_policy" {
  folder     = var.folder_id
  policy_data = data.google_iam_policy.folder_iam_policy_data.policy_data
}

data "google_iam_policy" "folder_iam_policy_data" {
  binding {
    role = "roles/editor"

    members = [
      var.sa_member,
    ]
  }
}
