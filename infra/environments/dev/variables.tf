# Variables específicas para el entorno de desarrollo
# Superficie de práctica - TODO(reto): implementar la definición de variables

variable "environment" {
  description = "Nombre del entorno de despliegue"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Tipo de instancia para los servidores de aplicación"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "Clase de instancia de base de datos"
  type        = string
  default     = "db.t3.micro"
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "apppedidosdb"
}

variable "db_username" {
  description = "Usuario de la base de datos"
  type        = string
  default     = "admin"
}

variable "allocated_storage" {
  description = "Almacenamiento asignado para la base de datos en GB"
  type        = number
  default     = 20
}

variable "min_size" {
  description = "Tamaño mínimo del grupo de auto-scaling"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Tamaño máximo del grupo de auto-scaling"
  type        = number
  default     = 4
}

variable "desired_capacity" {
  description = "Capacidad deseada del grupo de auto-scaling"
  type        = number
  default     = 2
}

variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks para subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks para subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}