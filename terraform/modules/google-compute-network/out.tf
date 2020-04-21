output "vpc" {
  value = "${
    map(
      "id", "${google_compute_network.my-network.id}",
      "self", "${google_compute_network.my-network.self_link}"
    )
  }"
}

output "public_subnet" {
  value = "${google_compute_subnetwork.public_subnet.self_link}"
}


output "private_subnet" {
  value = "${google_compute_subnetwork.private_subnet.*.self_link}"
}

