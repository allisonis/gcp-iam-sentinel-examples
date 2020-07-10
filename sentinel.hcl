# Organization IAM Sentinel Policies
policy "terraform-restrict-organization-iam-members" {
 source            = "./sentinel-policies/restrict-organization-iam-members.sentinel"
 enforcement_level = "hard-mandatory"
}

policy "terraform-restrict-organization-iam-policies" {
  source            = "./sentinel-policies/restrict-organization-iam-policies.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "terraform-restrict-organization-iam-bindings" {
  source            = "./sentinel-policies/restrict-organization-iam-bindings.sentinel"
  enforcement_level = "hard-mandatory"
}

# Folder IAM Sentinel Policies
policy "terraform-restrict-folder-iam-members" {
  source            = "./sentinel-policies/restrict-folder-iam-members.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "terraform-restrict-folder-iam-policies" {
  source            = "./sentinel-policies/restrict-folder-iam-policies.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "terraform-restrict-folder-iam-bindings" {
  source            = "./sentinel-policies/restrict-folder-iam-bindings.sentinel"
  enforcement_level = "hard-mandatory"
}

# Project IAM Sentinel Policies
policy "terraform-restrict-project-iam-members" {
  source            = "./sentinel-policies/restrict-project-iam-members.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "terraform-restrict-project-iam-policies" {
  source            = "./sentinel-policies/restrict-project-iam-policies.sentinel"
  enforcement_level = "hard-mandatory"
}

#policy "terraform-restrict-project-iam-bindings" {
#  source            = "./sentinel-policies/restrict-project-iam-bindings.sentinel"
#  enforcement_level = "hard-mandatory"
#}

# Import modules
module "tfplan-functions" {
  source = "./modules/tfplan-functions.sentinel"
}