# The Storage bucket consist of the following modules:
## Google Storage Bucket



# The network layer consists of the following modules:
## Google Compute Network-vpc
module "google-compute-network" {
  source = "./../../modules/google-compute-network"

  # vars.tf
  deployment_tag = "${var.deployment_tag}"
  vpc_cidr       = "${var.vpc_cidr}"
  region         = "${var.region}"
}

module "google-compute-instance" {
  source = "./../../modules/google-compute-instance"
  
    deployment_tag = "${var.deployment_tag}"
  vpc_cidr       = "${var.vpc_cidr}"
  region         = "${var.region}"
  public_subnet ="${module.google-compute-network.public_subnet}"
}

module "storage-bucket" {
  source = "./../../modules/storage-bucket"

  #vars.tf
  deployment_tag             = "${var.deployment_tag}"
  region                     = "${var.region}"
  bucket_suffix              = "${var.bucket_suffix}"
}


