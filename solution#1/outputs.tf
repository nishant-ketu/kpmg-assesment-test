output "web_endpoint" {
  description = "The endpoint of the web tier"
  value       = module.web.instance_url
}

output "database_endpoint" {
  description = "The endpoint of the database tier"
  value       = module.database.instance_connection_name
}
