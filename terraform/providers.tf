provider "google" {
  project     = ""
  region      = ""
}

# local testing
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "harden"
    workspaces {
      name = "sentinel-examples"
    }
  }
}
