# Módulo de red para la infraestructura del backend de la app móvil
# TODO(reto): Implementar la definición de la VPC, subredes públicas/privadas, security groups y NAT gateway.
# Requisitos:
# - VPC con CIDR 10.0.0.0/16
# - Subredes públicas y privadas en al menos 2 AZs
# - Security groups para el ALB, EC2 y RDS
# - NAT gateway para permitir salida a internet desde las subredes privadas

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

# TODO(reto): Definir VPC
# TODO(reto): implementa este bloque
# resource "aws_vpc" "main" {
#   cidr_block = var.vpc_cidr
#   # Habilitar DNS hostnames para RDS y otros servicios
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#
#   tags = {
#     Name = "vpc-app-pedidos"
#   }
# }

# TODO(reto): Definir subredes públicas
# TODO(reto): implementa este bloque
# resource "aws_subnet" "public" {
#   count                   = length(var.public_subnet_cidrs)
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = var.public_subnet_cidrs[count.index]
#   availability_zone       = data.aws_availability_zones.available.names[count.index]
#   map_public_ip_on_launch = true
#
#   tags = {
#     Name = "public-subnet-${count.index}"
#   }
# }

# TODO(reto): Definir subredes privadas
# TODO(reto): implementa este bloque
# resource "aws_subnet" "private" {
#   count             = length(var.private_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.private_subnet_cidrs[count.index]
#   availability_zone = data.aws_availability_zones.available.names[count.index]
#
#   tags = {
#     Name = "private-subnet-${count.index}"
#   }
# }

# TODO(reto): Definir Internet Gateway
# TODO(reto): implementa este bloque
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id
#
#   tags = {
#     Name = "igw-app-pedidos"
#   }
# }

# TODO(reto): Definir NAT Gateway
# TODO(reto): implementa este bloque
# resource "aws_eip" "nat" {
#   domain = "vpc"
# }

# TODO(reto): implementa este bloque
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.public[0].id
#
#   tags = {
#     Name = "nat-gateway-app-pedidos"
#   }
# }

# TODO(reto): Definir route tables
# TODO(reto): implementa este bloque
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id
#
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
#
#   tags = {
#     Name = "public-route-table"
#   }
# }

# TODO(reto): implementa este bloque
# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.main.id
#
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat.id
#   }
#
#   tags = {
#     Name = "private-route-table"
#   }
# }

# TODO(reto): Asociar route tables a subredes
# TODO(reto): implementa este bloque
# resource "aws_route_table_association" "public" {
#   count          = length(var.public_subnet_cidrs)
#   subnet_id      = aws_subnet.public[count.index].id
#   route_table_id = aws_route_table.public.id
# }

# TODO(reto): implementa este bloque
# resource "aws_route_table_association" "private" {
#   count          = length(var.private_subnet_cidrs)
#   subnet_id      = aws_subnet.private[count.index].id
#   route_table_id = aws_route_table.private.id
# }

# TODO(reto): Definir security groups
# TODO(reto): implementa este bloque
# resource "aws_security_group" "alb" {
#   name        = "alb-security-group"
#   description = "Security group para el Application Load Balancer"
#   vpc_id      = aws_vpc.main.id
#
#   tags = {
#     Name = "alb-sg"
#   }
# }

# TODO(reto): implementa este bloque
# resource "aws_security_group" "ec2" {
#   name        = "ec2-security-group"
#   description = "Security group para las instancias EC2"
#   vpc_id      = aws_vpc.main.id
#
#   tags = {
#     Name = "ec2-sg"
#   }
# }

# TODO(reto): implementa este bloque
# resource "aws_security_group" "rds" {
#   name        = "rds-security-group"
#   description = "Security group para la base de datos RDS"
#   vpc_id      = aws_vpc.main.id
#
#   tags = {
#     Name = "rds-sg"
#   }
# }

# TODO(reto): implementa este bloque
# data "aws_availability_zones" "available" {
#   state = "available"
# }

output "vpc_id" {
  description = "ID de la VPC creada"
  value = null # TODO(reto): aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value = null # TODO(reto): aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value = null # TODO(reto): aws_subnet.private[*].id
}

output "alb_security_group_id" {
  description = "ID del security group para el ALB"
  value = null # TODO(reto): aws_security_group.alb.id
}

output "ec2_security_group_id" {
  description = "ID del security group para EC2"
  value = null # TODO(reto): aws_security_group.ec2.id
}

output "rds_security_group_id" {
  description = "ID del security group para RDS"
  value = null # TODO(reto): aws_security_group.rds.id
}