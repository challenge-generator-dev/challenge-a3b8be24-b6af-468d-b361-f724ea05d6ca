# Módulo de base de datos para la infraestructura del backend de la app móvil
# TODO(reto): Implementar la definición de la base de datos RDS PostgreSQL con replicación y backup.
# Requisitos:
# - Instancia RDS PostgreSQL con versión 15.4
# - Multi-AZ para alta disponibilidad
# - Backup automático con retención de 7 días
# - Storage de 20GB con opción de escalado
# - Parámetros de configuración para optimización

variable "vpc_id" {
  description = "ID de la VPC donde se desplegará la base de datos"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "ID del security group para RDS"
  type        = string
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "apppedidosdb"
}

variable "db_username" {
  description = "Usuario maestro de la base de datos"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Contraseña del usuario maestro de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Clase de instancia para RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Storage asignado en GB"
  type        = number
  default     = 20
}

# TODO(reto): Definir subnet group para RDS
# TODO(reto): implementa este bloque
# resource "aws_db_subnet_group" "rds" {
#   name       = "rds-subnet-group"
#   subnet_ids = var.private_subnet_ids
#
#   tags = {
#     Name = "rds-subnet-group"
#   }
# }

# TODO(reto): Definir instancia RDS PostgreSQL
# TODO(reto): implementa este bloque
# resource "aws_db_instance" "postgresql" {
#   identifier             = "app-pedidos-db"
#   engine                 = "postgres"
#   engine_version         = "15.4"
#   instance_class         = var.db_instance_class
#   allocated_storage      = var.allocated_storage
#   max_allocated_storage  = 100
#   storage_type           = "gp2"
#   db_name                = var.db_name
#   username               = var.db_username
#   password               = var.db_password
#   db_subnet_group_name   = aws_db_subnet_group.rds.name
#   vpc_security_group_ids = [var.rds_security_group_id]
#   multi_az               = true
#   publicly_accessible    = false
#   skip_final_snapshot    = true
#   backup_retention_period = 7
#
#   tags = {
#     Name = "app-pedidos-db"
#   }
# }

# TODO(reto): Definir parámetros de configuración para RDS
# TODO(reto): implementa este bloque
# resource "aws_db_parameter_group" "postgresql" {
#   name   = "app-pedidos-postgresql-pg"
#   family = "postgres15"
#
#   parameter {
#     name  = "shared_buffers"
#     value = "256MB"
#   }
#
#   parameter {
#     name  = "work_mem"
#     value = "16MB"
#   }
#
#   parameter {
#     name  = "maintenance_work_mem"
#     value = "64MB"
#   }
#
#   tags = {
#     Name = "app-pedidos-postgresql-pg"
#   }
# }

output "db_endpoint" {
  description = "Endpoint de conexión a la base de datos"
  value = null # TODO(reto): aws_db_instance.postgresql.endpoint
}

output "db_port" {
  description = "Puerto de la base de datos"
  value = null # TODO(reto): aws_db_instance.postgresql.port
}

output "db_name" {
  description = "Nombre de la base de datos"
  value       = var.db_name
}