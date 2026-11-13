# Módulo de compute para la infraestructura del backend de la app móvil
# TODO(reto): Implementar la definición de instancias EC2, auto-scaling y load balancer.
# Requisitos:
# - Instancias EC2 con AMI Amazon Linux 2023
# - Auto Scaling Group con mínimo 2 instancias
# - Application Load Balancer con listeners para HTTP
# - Target group para las instancias EC2
# - Health checks para el ALB

variable "vpc_id" {
  description = "ID de la VPC donde se desplegarán los recursos"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ID del security group para el ALB"
  type        = string
}

variable "ec2_security_group_id" {
  description = "ID del security group para EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Número mínimo de instancias en el ASG"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Número máximo de instancias en el ASG"
  type        = number
  default     = 4
}

variable "desired_capacity" {
  description = "Capacidad deseada del ASG"
  type        = number
  default     = 2
}

# TODO(reto): Definir AMI para las instancias EC2
# TODO(reto): implementa este bloque
# data "aws_ami" "amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]
#
#   filter {
#     name   = "name"
#     values = ["al2023-ami-2023.*-x86_64"]
#   }
# }

# TODO(reto): Definir launch template para EC2
# TODO(reto): implementa este bloque
# resource "aws_launch_template" "app" {
#   name_prefix   = "app-pedidos-lt"
#   image_id      = data.aws_ami.amazon_linux.id
#   instance_type = var.instance_type
#   key_name      = "app-pedidos-key"
#
#   network_interfaces {
#     associate_public_ip_address = false
#     security_groups             = [var.ec2_security_group_id]
#   }
#
#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name = "app-pedidos-instance"
#     }
#   }
# }

# TODO(reto): Definir Application Load Balancer
# TODO(reto): implementa este bloque
# resource "aws_lb" "app" {
#   name               = "app-pedidos-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [var.alb_security_group_id]
#   subnets            = var.public_subnet_ids
#
#   enable_deletion_protection = false
#
#   tags = {
#     Name = "app-pedidos-alb"
#   }
# }

# TODO(reto): Definir target group para el ALB
# TODO(reto): implementa este bloque
# resource "aws_lb_target_group" "app" {
#   name     = "app-pedidos-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = var.vpc_id
#
#   health_check {
#     path                = "/health"
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     matcher             = "200"
#   }
# }

# TODO(reto): Definir listener para el ALB
# TODO(reto): implementa este bloque
# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.app.arn
#   port              = 80
#   protocol          = "HTTP"
#
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.app.arn
#   }
# }

# TODO(reto): Definir Auto Scaling Group
# TODO(reto): implementa este bloque
# resource "aws_autoscaling_group" "app" {
#   name                = "app-pedidos-asg"
#   min_size            = var.min_size
#   max_size            = var.max_size
#   desired_capacity    = var.desired_capacity
#   vpc_zone_identifier = var.private_subnet_ids
#
#   launch_template {
#     id      = aws_launch_template.app.id
#     version = "$Latest"
#   }
#
#   target_group_arns = [aws_lb_target_group.app.arn]
#
#   tag {
#     key                 = "Name"
#     value               = "app-pedidos-instance"
#     propagate_at_launch = true
#   }
# }

output "alb_dns_name" {
  description = "DNS name del Application Load Balancer"
  value = null # TODO(reto): aws_lb.app.dns_name
}

output "target_group_arn" {
  description = "ARN del target group para el ALB"
  value = null # TODO(reto): aws_lb_target_group.app.arn
}