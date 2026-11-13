# Outputs del entorno de desarrollo
# Superficie de práctica - TODO(reto): definir los outputs expuestos

# Outputs de red
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.network.private_subnet_ids
}

# Outputs de compute
output "api_endpoint" {
  description = "Endpoint del Load Balancer para la API"
  value       = "http://${module.compute.alb_dns_name}/api/pedidos"
}

output "api_status" {
  description = "Estado del endpoint de API"
  value       = "active"
}

output "db_endpoint" {
  description = "Endpoint de la base de datos"
  value       = module.database.db_endpoint
}

output "db_port" {
  description = "Puerto de la base de datos"
  value       = module.database.db_port
}

output "db_name" {
  description = "Nombre de la base de datos"
  value       = module.database.db_name
}

# Outputs de almacenamiento
output "static_files_bucket_name" {
  description = "Nombre del bucket de archivos estáticos"
  value       = module.storage.static_files_bucket_name
}

output "logs_bucket_name" {
  description = "Nombre del bucket de logs"
  value       = module.storage.logs_bucket_name
}

output "backups_bucket_name" {
  description = "Nombre del bucket de backups"
  value       = module.storage.backups_bucket_name
}

# Outputs de información general del entorno
output "environment" {
  description = "Nombre del entorno"
  value       = var.environment
}

output "region" {
  description = "Región de AWS donde está desplegada la infraestructura"
  value       = "us-east-1"
}