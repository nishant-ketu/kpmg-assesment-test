resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = "my-vpc-subnetwork"
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = "10.0.0.0/24"
}

output "network" {
  value = google_compute_network.vpc_network.name
}

output "subnetwork" {
  value = google_compute_subnetwork.vpc_subnetwork.name
}
