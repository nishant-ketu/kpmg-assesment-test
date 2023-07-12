resource "google_sql_database_instance" "database_instance" {
  name             = "database-instance"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    maintenance_window {
      day  = "6"
      hour = "6"
      update_track = "stable"
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network
      require_ssl = true
    }
    availability_type = var.availability
    tier              = var.tier
    disk_size         = var.size
    database_flags {
      name = "temp_file_limit"
      value = "2147483647"      
    }
    backup_configuration {
      enabled = true
      start_time = "06:00"
    }
    location_preference {
      zone             = "${var.region}-b"
    }
  }
}

output "instance_connection_name" {
  value = google_sql_database_instance.database_instance.connection_name
}
