
output "vpc" {
  value = "${module.google-compute-network.vpc}"
  #This module outputs id,self-link for the Google Compute Network (VPC)
}


output "public_subnet" {
  value = "${module.google-compute-network.public_subnet}"
  #This module lists the id and self link for the Google Sub Networks (Subnets)
}
