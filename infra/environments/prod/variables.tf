# environments/prod/variables.tf
# Definición de variables específicas para el entorno de producción

# TODO(reto): Definir las variables necesarias para el entorno de producción
# Estas variables permiten personalizar la infraestructura sin modificar el código

# Variables de red
# TODO(reto): Agregar variables para CIDRs de VPC y subnets

# Variables de compute
# TODO(reto): Agregar variables para tipo de instancia, tamaño del ASG

# Variables de base de datos
# TODO(reto): Agregar variables para nombre de DB, credenciales, clase de instancia

# Variables de almacenamiento
# TODO(reto): Agregar variables para nombres de buckets y políticas de lifecycle

# Variable de entorno
variable "environment" {
  description = "Nombre del entorno"
  type        = string
  default     = "prod"
}