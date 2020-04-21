variable "deployment_tag" {
  description = "Default tag to be added to each and every resource representing the deployment"

  type = "string"
}


variable "region" {
  type = "string"

}


variable "bucket_suffix" {
  description = "Default suffix for buckets"
  type        = "string"

}

