###################
## VPC
###################
resource "google_compute_network" "my-network" {
  name    = "${var.deployment_tag}-gcnetwork"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

##################
# Subnets
##################

# Subnet
resource "google_compute_subnetwork" "public_subnet" {

  #vars.tf
  ip_cidr_range = "${var.public_subnet}"
  name          = "${var.deployment_tag}-public-subnet"
  network       = google_compute_network.my-network.name
  region        = "${var.region}"
}

resource "google_compute_subnetwork" "private_subnet" {

  #vars.tf
  ip_cidr_range = "${var.private_subnet}"
  name          = "${var.deployment_tag}-gc-private-subnet"
  network       = google_compute_network.my-network.self_link
  region        = "${var.region}"
}

##################
##NAT
##################

resource "google_compute_router" "router" {
  name    = "${var.router_name}"
  region  = "${var.region}"
  network = google_compute_network.my-network.name

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.router_name}-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.private_subnet.self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

###################
## Firewall
###################

# Firewall
resource "google_compute_firewall" "allow-bastion" {

  #vars.tf
  name    = "${var.deployment_tag}-gcfw-allow-bastion"
  network = "${google_compute_network.my-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  target_tags = ["bastion"]
  source_tags = ["ssh"]
}

resource "google_compute_firewall" "allow-internal" {

  #vars.tf
  name    = "${var.deployment_tag}-ssh-gcfw-allow-internal"
  network = "${google_compute_network.my-network.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [
    "${var.private_subnet}",
    "${var.private_subnet}"
  ]

  target_tags = ["ssh"]
}
