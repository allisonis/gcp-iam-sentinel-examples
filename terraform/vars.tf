# Name of TFC/TFE organization
variable "organization_name" {
    type = string
    default = ""
    description = "Terraform organization name."
}

# TFE workspace to apply policies to
variable "workspace_name" {
    type = string
    default = ""
    description = "Workspace for TFE/TFC backend configuration"
}

# GCP Organization ID
variable "oranization_id" {
    type = string
    default = 
    description = "Organization ID"
}

#GCP Folder ID
variable "folder_id" {
    type = string
    # this can be a list of folder ID's default = [folder1, folder2, etc]
    default = ""
    description = "Folder name"
}
variable "project_id" {
    type = string
    # This can be a list of project ID's default = [project1, project2, etc]
    default = ""
    description = "Project ID"
}

# Example memeber IAM binding for TFE binding examples
variable "sa_member" {
    type = string
    default = ""
    description = "Service account"
}
