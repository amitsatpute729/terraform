
terraform {
  backend "gcs" {
    bucket      = "osi-pi-terra-bucket"
    prefix      = "gcp-iac/terraform/dev-env/v3"
    # credentials = "service-account-credentials.json"
  }
}


