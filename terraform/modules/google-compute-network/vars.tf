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
variable "deployment_tag" {
  description = "Default tag to be added to each and every resource representing the deployment"
}
variable "router_name" {
    default = "osi-pi-router"
}

variable "source_ips" {
  default = []
}


variable "region" {
  type = "string"
}


