
variable "region" {

  description = "The full name of the region to select."
  type = "string"
  # default = ["us-east1", "asia-southeast1", "europe-west3"]
}

variable "vpc_cidr" {
  description = "The cidr block of the desired VPC."
  default = "10.0.0.0/16"
}

variable "public_subnet" {
        default = "10.26.4.0/24"
    }

variable "private_subnet" {
        default = "10.26.6.0/24"
    }

variable "router_name" {
	default = "osi-pi-router"
}
variable "deployment_tag" {
  description = "Default tag to be added to each and every resource representing the deployment"

  type = "string"
}

variable "zone" {
  description = "Zone where the resources will be created"
  default     = "us-east1-b"
}

variable "bucketname" {

  default = "osi-test-bucket"
}

variable "bucket_suffix" {
  description = "Default suffix for buckets"

  type    = "string"
}
