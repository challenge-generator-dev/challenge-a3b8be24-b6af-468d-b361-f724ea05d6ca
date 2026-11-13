# Módulo de storage para la infraestructura del backend de la app móvil
# TODO(reto): Implementar la definición de buckets S3 para almacenamiento de archivos estáticos y logs.
# Requisitos:
# - Bucket para archivos estáticos con políticas de acceso público
# - Bucket para logs con ciclo de vida para archivado
# - Bucket para backups con versionado habilitado
# - Políticas de acceso adecuadas para cada bucket

variable "environment" {
  description = "Entorno de despliegue (dev, prod)"
  type        = string
}

# TODO(reto): Definir bucket para archivos estáticos
# TODO(reto): implementa este bloque
# resource "aws_s3_bucket" "static_files" {
#   bucket = "app-pedidos-static-files-${var.environment}"
#
#   tags = {
#     Name        = "app-pedidos-static-files"
#     Environment = var.environment
#   }
# }

# TODO(reto): Configurar acceso público para el bucket de archivos estáticos
# TODO(reto): implementa este bloque
# resource "aws_s3_bucket_public_access_block" "static_files" {
#   bucket = aws_s3_bucket.static_files.id
#
#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# TODO(reto): implementa este bloque
# resource "aws_s3_bucket_policy" "static_files" {
#   bucket = aws_s3_bucket.static_files.id
#
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect    = "Allow"
#         Principal = "*"
#         Action    = "s3:GetObject"
#         Resource  = "${aws_s3_bucket.static_files.arn}/*"
#       }
#     ]
#   })
# }

# TODO(reto): Definir bucket para logs
# TODO(reto): implementa este bloque
# resource "aws_s3_bucket" "logs" {
#   bucket = "app-pedidos-logs-${var.environment}"
#
#   tags = {
#     Name        = "app-pedidos-logs"
#     Environment = var.environment
#   }
# }

# TODO(reto): Configurar ciclo de vida para el bucket de logs
# TODO(reto): implementa este bloque
# resource "aws_s3_bucket_lifecycle_configuration" "logs" {
#   bucket = aws_s3_bucket.logs.id
#
#   rule {
#     id     = "archive-logs"
#     status = "Enabled"
#
#     transition {
#       days          = 30
#       storage_class = "STANDARD_IA"
#     }
#
#     transition {
#       days          = 90
#       storage_class = "GLACIER"
#     }
#
#     expiration {
#       days = 365
#     }
#   }
# }

# TODO(reto): Definir bucket para backups
# TODO(reto): implementa este bloque
# resource "aws_s3_bucket" "backups" {
#   bucket = "app-pedidos-backups-${var.environment}"
#
#   tags = {
#     Name        = "app-pedidos-backups"
#     Environment = var.environment
#   }
# }

# TODO(reto): Habilitar versionado para el bucket de backups
# TODO(reto): implementa este bloque
# resource "aws_s3_bucket_versioning" "backups" {
#   bucket = aws_s3_bucket.backups.id
#
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# TODO(reto): Configurar cifrado para el bucket de backups
# TODO(reto): implementa este bloque
# resource "aws_s3_bucket_server_side_encryption_configuration" "backups" {
#   bucket = aws_s3_bucket.backups.id
#
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

output "static_files_bucket_name" {
  description = "Nombre del bucket para archivos estáticos"
  value = null # TODO(reto): aws_s3_bucket.static_files.bucket
}

output "logs_bucket_name" {
  description = "Nombre del bucket para logs"
  value = null # TODO(reto): aws_s3_bucket.logs.bucket
}

output "backups_bucket_name" {
  description = "Nombre del bucket para backups"
  value = null # TODO(reto): aws_s3_bucket.backups.bucket
}