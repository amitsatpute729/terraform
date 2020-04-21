variable "region" {

  description = "The full name of the region to select."

  type = "string"
  # default = ["us-east1", "asia-southeast1", "europe-west3"]
  #default = ["us-east1"]
}

variable "vpc_cidr" {
  description = "The cidr block of the desired VPC."

  type = "string"
}

variable "deployment_tag" {
  description = "Default tag to be added to each and every resource representing the deployment"

  type = "string"
}

variable "zone" {
  description = "Zone where the resources will be created"
  default     = "us-east1-b"
}

variable "public_subnet" {
  type = "string"
}

