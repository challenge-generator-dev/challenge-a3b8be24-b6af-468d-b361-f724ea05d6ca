# environments/prod/main.tf
# Configuración del entorno de producción
# Consume módulos de red, compute, base de datos y almacenamiento

# TODO(reto): Implementar la instanciación de módulos para producción
# El estudiante debe instanciar los módulos network, compute, database y storage
# con las variables apropiadas para el entorno de producción

terraform {
  # Workspace para separación de entornos
  # El workspace "prod" se usa para este entorno
}

# Instanciación del módulo de red
# TODO(reto): Completar con las variables del entorno de producción
# Referencia: modules/network/main.tf provee vpc_id, public_subnet_ids, private_subnet_ids

# Instanciación del módulo de compute
# TODO(reto): Completar con las variables del entorno de producción
# Referencia: modules/compute/main.tf provee alb_dns_name, target_group_arn

# Instanciación del módulo de base de datos
# TODO(reto): Completar con las variables del entorno de producción
# Referencia: modules/database/main.tf provee db_endpoint, db_port, db_name

# Instanciación del módulo de almacenamiento
# TODO(reto): Completar con las variables del entorno de producción
# Referencia: modules/storage/main.tf provee static_files_bucket_name, logs_bucket_name, backups_bucket_name