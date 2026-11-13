# Configuración del entorno de desarrollo
# Superficie de práctica - TODO(reto): implementar la instanciación de módulos

terraform {
  backend "s3" {
    bucket = "terraform-state-apppedidos"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

# Módulo de red - crea VPC, subredes, gateways y grupos de seguridad
module "network" {
  source = "../../modules/network"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# Módulo de compute - crea ASG, ALB y launch template
module "compute" {
  source = "../../modules/compute"

  vpc_id              = module.network.vpc_id
  public_subnet_ids   = module.network.public_subnet_ids
  private_subnet_ids  = module.network.private_subnet_ids
  alb_security_group_id = module.network.alb_security_group_id
  ec2_security_group_id = module.network.ec2_security_group_id
  instance_type       = var.instance_type
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
}

# Módulo de base de datos - crea instancia RDS PostgreSQL
module "database" {
  source = "../../modules/database"

  vpc_id               = module.network.vpc_id
  private_subnet_ids   = module.network.private_subnet_ids
  rds_security_group_id = module.network.rds_security_group_id
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_instance_class    = var.db_instance_class
  allocated_storage    = var.allocated_storage
}

# Módulo de almacenamiento - crea buckets S3
module "storage" {
  source = "../../modules/storage"

  environment = var.environment
}