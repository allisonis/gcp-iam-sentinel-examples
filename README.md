# Google Cloud Platform IAM Sentinel Policies
 
This repository contains a [Sentinel policy set]([https://www.terraform.io/docs/cloud/sentinel/manage-policies.html#policies-and-policy-sets]) to restrict IAM configurations [Terraform Enterprise workspace](terraform.io/docs/cloud/workspaces/index.html) using the Google Cloud Platform provider. This policy set demonstrates how to restrict allowing workspaces to set IAM role bindings using the default Compute Engine and App Engine service accounts. And restrict setting IAM bindings with known dangerous roles. 
 
There are two rules per policy. One that restricts using default service accounts. And one for restricting using IAM roles that enable impersonation at the project, folder, and organization level.
 
Sentinel policies evaluate the resources in a terraform enterprise workspace run against applied policies. Sentinel policies have three separate enforcement modes that you can use.
 
### Set Up
For more information on how to configure Sentinel policies in your organization please refer to Hashicorp's official documentation.
https://www.terraform.io/docs/cloud/sentinel/index.html

The Sentinel policy set `sentinel-policies` contains three folders with policies for the associated resource. 


To test these sentinel policies you can use the example terraform resources under the `terraform/` directory to create violating resources. 
Note:
```text
Sentinel policies can only manage resources that are applied and managed using TFE. IAM bindings made using GCP APIs outside of Terraform are not subject to Sentinel policies and additional controls and defense in depth techniques are required to enforce restrictions on IAM bindings.
```
 
* [Hard mandatory](https://www.terraform.io/docs/cloud/sentinel/manage-policies.html#hard-mandatory) enforces if a run violates a policy, that the run cannot be applied even by an administrator of the workspace or organization.
 
* [Soft Mandantory](https://www.terraform.io/docs/cloud/sentinel/manage-policies.html#soft-mandatory) will restrict applying runs if a policy is violated, but can be overridden by a workspace or organization administrator.
 
* [Advisory](https://www.terraform.io/docs/cloud/sentinel/manage-policies.html#advisory) which logs the violating resources in a run, but fails open.
 
There are three sentinel policies per resource level for each of the potential IAM resources available.
#### IAM Bindings
* [Google Project IAM Binding](https://www.terraform.io/docs/providers/google/r/google_project_iam.html#google_project_iam_binding-1)
* [Google Folder IAM Binding](https://www.terraform.io/docs/providers/google/r/google_folder_iam_binding.html)
* [Google Organization IAM Binding](https://www.terraform.io/docs/providers/google/r/google_organization_iam_binding.html)
#### IAM Policies
* [ Project IAM Policy](https://www.terraform.io/docs/providers/google/r/google_project_iam.html#google_project_iam_policy)
* [Folder IAM Policy](https://www.terraform.io/docs/providers/google/r/google_folder_iam_policy.html)
* [Organization IAM Policy](https://www.terraform.io/docs/providers/google/r/google_organization_policy.html)
 
#### IAM Members
* [Google Project IAM Member ](https://www.terraform.io/docs/providers/google/r/google_project_iam.html#google_project_iam_member-1)
* [Google Folder IAM Member](https://www.terraform.io/docs/providers/google/r/google_folder_iam_member.html)
* [Google Oganization IAM Member](https://www.terraform.io/docs/providers/google/r/google_organization_iam_member.html)
 
Roles that are restricted contain IAM permissions that enable a user with the role to impersonate or manage service accounts in a GCP project or across an organization through IAM inheritance from a higher resource, i.e folders and organization IAM bindings.
 

### Restricting Default Service Account IAM Bindings
Default service accounts should not be used in any circumstance where possible. 

In order to enforce that default service accounts are not used at the project, folder, and organization level this repository includes sentinel policies that demonstrate how to restrict IAM policies where the default Compute Engine or Appspot servic account are used. 

*Default Compute Engine Service Account:*
Used by GKE, Compute, DataProc, DataFlow, Composer.

```bash
project-number-compute@developer.gserviceaccount.com
``` 

*Default Appspot Service Account:*
Used by App Engine, Cloud Functions, App Engine based services.

```bash 
project-id@appspot.gserviceaccount.com
```
### Roles for User Impersonation
The following roles enable identities to impersonate all service account identities within a project if the identity is granted the role at the project, folder, or organization level. This is not an exhaustive list as permissions and roles change frequently.
 
*Primitive Roles:*
 
* roles/owner
 
* roles/editor
 
*Predefined Roles:*
 
* roles/iam.securityAdmin
 
* roles/iam.serviceAccountAdmin
 
* roles/iam.serviceAccountKeyAdmin
 
* roles/iam.serviceAccountUser
 
* roles/iam.serviceAccountTokenCreator
 
* roles/iam.workloadIdentityUser
 
* roles/dataproc.editor
 
* roles/dataproc.admin
 
* roles/dataflow.developer

* roles/resourcemanager.folderAdmin
 
* roles/resourcemanager.folderIamAdmin
 
* roles/resourcemanager.projectIamAdmin
 
* roles/resourcemanager.organizationAdmin
 
* roles/cloudasset.viewer
 
* roles/cloudasset.owner
 
*Service Agent Roles:*
Service agent roles should not be used for any identities other than the Google managed service account they are associated with.
 
* roles/serverless.serviceAgent
* roles/dataproc.serviceAgent
 
 
TODO:
* Add tests
* Add policies to restrict setting default service accounts for Compute and App Engine backed services