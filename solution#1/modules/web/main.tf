resource "google_compute_instance" "web_instance" {
  name         = "web-instance"
  machine_type = var.type
  zone         = var.zone
  lifecycle {
    create_before_destroy = false
  }
  boot_disk {
    initialize_params {
      image = var.image
      size  = var.size
    }
  }
  network_interface {
    subnetwork = var.subnetwork
    access_config {
      // Define access config for external IP
    }
  }
  metadata = {
    sshKeys = var.sshKeys
    startup-script = var.startup_script
  }

  service_account {
    email  = var.service_account
    scopes = [ 
      "https://www.googleapis.com/auth/cloud-platform", 
      "https://www.googleapis.com/auth/compute", 
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

output "instance_id" {
  value = google_compute_instance.instance.self_link
}

output "name" {
 value = google_compute_instance.instance.name
}
