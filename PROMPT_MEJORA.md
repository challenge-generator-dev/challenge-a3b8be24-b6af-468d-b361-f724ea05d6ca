# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/storage/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/backend.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `client` | `client/` | chapter, support | client | Flutter | Flutter |

## Orden de arranque

1. `cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/database init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/storage init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/database validate && terraform -chdir=modules/network validate && terraform -chdir=modules/storage validate` — componente `infra` (practice).
2. `cd client && flutter pub get && flutter analyze` — componente `client` (chapter, support).

### Contratos entre componentes

- `infra` expone http (api: http://${load_balancer_dns}):
  - `GET /api/pedidos`
  - `GET /db/endpoint`
- `client` expone http (api: http://${load_balancer_dns}):
  - `GET /api/pedidos`

## Referencias no verificadas

Referencias no verificadas para: .dart. El analisis estatico no cubre esos lenguajes: que no se haya listado nada NO garantiza que no haya referencias colgando.

## Como saber que terminaste

```bash
(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/database init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/storage init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/database validate && terraform -chdir=modules/network validate && terraform -chdir=modules/storage validate) && (cd client && flutter pub get && flutter analyze)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform para la app movil, Aprovisiona con Terraform los recursos que consume la aplicacion movil

### Misión / candidato
Desplegar la API de la app de pedidos

### Reto
- Tema: infraestructura-como-codigo-para-el-backend-de-una-app-movil
- Seniority: senior-l2
- Tipo: practical
- Título: Despliegue de Infraestructura con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial — objetivo: Configurar el entorno de Terraform y definir los recursos básicos necesarios para la aplicación. — entregable (NO resolver): Archivos de Terraform configurados con los recursos básicos definidos.
- Fase 2: Despliegue de Recursos — objetivo: Desplegar los recursos definidos en la fase anterior y verificar su correcta implementación. — entregable (NO resolver): Infraestructura desplegada y verificada, con documentación del proceso.
- Fase 3: Optimización y Escalabilidad — objetivo: Optimizar la configuración de la infraestructura para mejorar la escalabilidad y el rendimiento. — entregable (NO resolver): Infraestructura optimizada y desplegada, con documentación de los cambios realizados.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/README.md ===
# Terraform Infrastructure Module

## Structure
```
.
├── backend.tf              # Backend configuration (S3/DynamoDB)
├── versions.tf             # Terraform and provider versions
├── providers.tf            # AWS provider configuration
├── modules/
│   ├── network/            # VPC, subnets, security groups
│   ├── compute/            # EC2, ECS, Lambda
│   ├── database/           # RDS, DynamoDB
│   └── storage/            # S3, EFS
└── environments/
    ├── dev/                # Development environment
    │   ├── main.tf         # Root module
    │   ├── variables.tf    # Input variables
    │   ├── outputs.tf      # Output values
    │   └── terraform.tfvars # Variable definitions
    └── prod/               # Production environment
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Prerequisites
- Terraform 1.9.0
- AWS CLI configured with valid credentials
- S3 bucket for remote state (configured in `backend.tf`)

## Usage
1. Initialize Terraform:
```bash
terraform init
```

2. Plan changes for development environment:
```bash
terraform -chdir=environments/dev plan
```

3. Apply changes:
```bash
terraform -chdir=environments/dev apply
```

## Validation
Verify infrastructure deployment:
```bash
terraform -chdir=environments/dev output
```

## Notes
- Each environment (dev/prod) maintains isolated state
- Modules are environment-agnostic and configured via variables
- Never commit `terraform.tfvars` with sensitive values

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
# Terraform variables for dev environment

# Network Configuration
vpc_cidr_block = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

# Compute Configuration
instance_type = "t3.micro"
ami_id = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
key_name = "dev-keypair"
min_size = 1
max_size = 2
desired_capacity = 1

# Database Configuration
db_instance_class = "db.t3.micro"
db_name = "devdb"
db_username = "admin"
db_password = "devpassword123!" # In production, use secrets manager
allocated_storage = 20
engine_version = "13.4"
multi_az = false

# Storage Configuration
bucket_name = "dev-app-bucket"

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.100.0"
    }
  }
}

// === ARCHIVO: infra/providers.tf ===
provider "aws" {
  region = "us-east-1"
}

// === ARCHIVO: infra/modules/network/main.tf ===
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

// === ARCHIVO: infra/modules/compute/main.tf ===
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

// === ARCHIVO: infra/modules/database/main.tf ===
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

// === ARCHIVO: infra/modules/storage/main.tf ===
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

// === ARCHIVO: infra/environments/dev/variables.tf ===
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

// === ARCHIVO: infra/environments/dev/main.tf ===
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

// === ARCHIVO: infra/environments/dev/outputs.tf ===
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

// === ARCHIVO: infra/environments/prod/main.tf ===
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

// === ARCHIVO: infra/environments/prod/variables.tf ===
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

// === ARCHIVO: infra/environments/prod/outputs.tf ===
# environments/prod/outputs.tf
# Definición de outputs para el entorno de producción
# Expone los endpoints y ARNs necesarios para otros componentes

# TODO(reto): Definir los outputs que otros componentes necesitan consumir

# Output del endpoint de la API
# TODO(reto): Exponer el DNS del Load Balancer como endpoint de la API
# Schema: { endpoint: string; status: string }

# Output del endpoint de la base de datos
# TODO(reto): Exponer el endpoint, puerto y nombre de la base de datos
# Schema: { endpoint: string; port: number; database: string }

# Outputs adicionales
# TODO(reto): Exponer ARNs de recursos necesarios para otras partes del sistema
# Incluir: VPC ID, IDs de subnets, ARNs de buckets S3, ARNs de security groups

// === ARCHIVO: infra/backend.tf ===
# Superficie de práctica: configuración del backend remoto para Terraform
# El estudiante debe implementar la configuración del backend S3 con DynamoDB para bloqueo

terraform {
  backend "s3" {
    # TODO(reto): Completar la configuración del backend S3
    # Requisitos:
    # - bucket: nombre del bucket S3 para almacenar el estado (sugiere formato: tf-state-{entorno}-{proyecto})
    # - key: ruta dentro del bucket donde se almacena el estado (sugiere: {entorno}/terraform.tfstate)
    # - region: región de AWS donde está el bucket
    # - dynamodb_table: tabla de DynamoDB para el bloqueo de estado
    # - encrypt: habilitar cifrado SSE-KMS (recomendado: true)
    # - profile: perfil de AWS a utilizar (opcional)
  }
}

// === ARCHIVO: client/lib/main.dart ===
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'app_config.dart';
import 'domain/entities/pedido.dart';
import 'domain/repositories/pedido_repository.dart';
import 'domain/usecases/get_pedidos.dart';
import 'data/datasources/api_datasource.dart';
import 'data/repositories/pedido_repository_impl.dart';
import 'presentation/screens/pedidos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = AppConfig.createDioInstance();
    final baseUrl = AppConfig.fullApiUrl;
    
    return MultiProvider(
      providers: [
        Provider<AppConfig>.value(
          value: AppConfig(),
        ),
        Provider<Dio>.value(
          value: dio,
        ),
        Provider<ApiDataSource>(
          create: (context) => ApiDataSource(
            dio: dio,
            baseUrl: baseUrl,
          ),
        ),
        Provider<PedidoRepository>(
          create: (context) => PedidoRepositoryImpl(
            apiDataSource: context.read<ApiDataSource>(),
            dio: dio,
          ),
        ),
        Provider<GetPedidos>(
          create: (context) => GetPedidos(
            context.read<PedidoRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Pedidos App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PedidosScreen(),
      ),
    );
  }
}

// === ARCHIVO: client/pubspec.yaml ===
name: reto
description: Reto de aprendizaje.
publish_to: none
version: 1.0.0+1

environment:
  sdk: ">=3.12.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  dio: 5.11.1
  freezed: 3.2.5
  freezed_annotation: 3.1.0
  json_serializable: 6.15.2
  provider: 6.1.5

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true

// === ARCHIVO: client/analysis_options.yaml ===
analyzer:
  exclude:
    - _pendiente/**

// === ARCHIVO: client/lib/domain/entities/pedido.dart ===
class Pedido {
  final String id;
  final String producto;
  final int cantidad;
  final String estado;

  const Pedido({
    required this.id,
    required this.producto,
    required this.cantidad,
    required this.estado,
  });

  bool get isPendiente => estado == 'pendiente';
  bool get isCompletado => estado == 'completado';
  bool get isCancelado => estado == 'cancelado';

  Pedido copyWith({
    String? id,
    String? producto,
    int? cantidad,
    String? estado,
  }) {
    return Pedido(
      id: id ?? this.id,
      producto: producto ?? this.producto,
      cantidad: cantidad ?? this.cantidad,
      estado: estado ?? this.estado,
    );
  }

  Pedido copyWithEstado(String nuevoEstado) {
    return copyWith(estado: nuevoEstado);
  }

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'] as String? ?? '',
      producto: json['producto'] as String? ?? '',
      cantidad: json['cantidad'] is int 
          ? json['cantidad'] as int 
          : int.tryParse(json['cantidad']?.toString() ?? '0') ?? 0,
      estado: json['estado'] as String? ?? 'pendiente',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'producto': producto,
      'cantidad': cantidad,
      'estado': estado,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'producto': producto,
      'cantidad': cantidad,
      'estado': estado,
    };
  }

  @override
  String toString() {
    return 'Pedido(id: $id, producto: $producto, cantidad: $cantidad, estado: $estado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Pedido &&
        other.id == id &&
        other.producto == producto &&
        other.cantidad == cantidad &&
        other.estado == estado;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        producto.hashCode ^
        cantidad.hashCode ^
        estado.hashCode;
  }
}

// === ARCHIVO: client/lib/domain/repositories/pedido_repository.dart ===
import '../entities/pedido.dart';

abstract class PedidoRepository {
  Future<List<Pedido>> getPedidos();
  Future<Pedido> getPedidoById(String id);
  Future<void> actualizarEstadoPedido(String id, String nuevoEstado);
  Future<void> crearPedido(Pedido pedido);
}

class PedidoRepositoryException implements Exception {
  final String message;
  PedidoRepositoryException(this.message);

  @override
  String toString() => 'PedidoRepositoryException: $message';
}

// === ARCHIVO: client/lib/domain/usecases/get_pedidos.dart ===
import '../entities/pedido.dart';
import '../repositories/pedido_repository.dart';

class GetPedidos {
  final PedidoRepository repository;

  GetPedidos(this.repository);

  Future<List<Pedido>> call() async {
    try {
      final pedidos = await repository.getPedidos();
      return pedidos.where((pedido) => !pedido.isCancelado).toList();
    } on PedidoRepositoryException catch (e) {
      throw Exception('Error al obtener pedidos: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al obtener pedidos: $e');
    }
  }
}

class FiltrarPedidos {
  List<Pedido> call(List<Pedido> pedidos, {String? estado}) {
    if (estado == null || estado.isEmpty) {
      return pedidos;
    }
    
    return pedidos.where((pedido) {
      if (estado == 'pendiente') {
        return pedido.isPendiente;
      } else if (estado == 'completado') {
        return pedido.isCompletado;
      } else if (estado == 'cancelado') {
        return pedido.isCancelado;
      }
      return true;
    }).toList();
  }
}

class ObtenerPedidoPorId {
  final PedidoRepository repository;

  ObtenerPedidoPorId(this.repository);

  Future<Pedido> call(String id) async {
    try {
      return await repository.getPedidoById(id);
    } on PedidoRepositoryException catch (e) {
      throw Exception('Error al obtener pedido: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al obtener pedido: $e');
    }
  }
}

class ActualizarEstadoPedido {
  final PedidoRepository repository;

  ActualizarEstadoPedido(this.repository);

  Future<void> call(String id, String nuevoEstado) async {
    try {
      await repository.actualizarEstadoPedido(id, nuevoEstado);
    } on PedidoRepositoryException catch (e) {
      throw Exception('Error al actualizar estado: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al actualizar estado: $e');
    }
  }
}

class CrearPedido {
  final PedidoRepository repository;

  CrearPedido(this.repository);

  Future<void> call(Pedido pedido) async {
    try {
      await repository.crearPedido(pedido);
    } on PedidoRepositoryException catch (e) {
      throw Exception('Error al crear pedido: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado al crear pedido: $e');
    }
  }
}

// === ARCHIVO: client/lib/data/datasources/api_datasource.dart ===
import 'package:dio/dio.dart';
import '../../domain/entities/pedido.dart';
import '../../domain/repositories/pedido_repository.dart';

class ApiDataSource {
  final Dio dio;

  ApiDataSource({required this.dio});

  Future<List<Pedido>> fetchPedidos() async {
    try {
      final response = await dio.get('/pedidos');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Pedido.fromJson(json)).toList();
      } else {
        throw PedidoRepositoryException(
            'Error al obtener pedidos: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw PedidoRepositoryException(
            'Error en la respuesta: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        throw PedidoRepositoryException(
            'Error de conexión: ${e.message}');
      }
    } catch (e) {
      throw PedidoRepositoryException('Error inesperado: $e');
    }
  }

  Future<Pedido> fetchPedidoById(String id) async {
    try {
      final response = await dio.get('/pedidos/$id');
      if (response.statusCode == 200) {
        return Pedido.fromJson(response.data);
      } else {
        throw PedidoRepositoryException(
            'Error al obtener pedido: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw PedidoRepositoryException(
          'Error al obtener pedido: ${e.message}');
    }
  }

  Future<void> actualizarEstado(String id, String nuevoEstado) async {
    try {
      final response = await dio.patch(
        '/pedidos/$id/estado',
        data: {'estado': nuevoEstado},
      );
      if (response.statusCode != 200) {
        throw PedidoRepositoryException(
            'Error al actualizar estado: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw PedidoRepositoryException(
          'Error al actualizar estado: ${e.message}');
    }
  }
}

// === ARCHIVO: client/lib/android/app/src/main/AndroidManifest.xml ===
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    
    <application
        android:label="reto"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="true">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>

// === ARCHIVO: client/lib/data/repositories/pedido_repository_impl.dart ===
import 'package:dio/dio.dart';
import '../../domain/entities/pedido.dart';
import '../../domain/repositories/pedido_repository.dart';
import '../datasources/api_datasource.dart';

class PedidoRepositoryImpl implements PedidoRepository {
  final ApiDataSource apiDataSource;
  final Dio dio;

  PedidoRepositoryImpl({
    required this.apiDataSource,
    required this.dio,
  }) {
    if (apiDataSource.dio != dio) {
      throw PedidoRepositoryException(
        'El objeto Dio proporcionado no coincide con el de ApiDataSource',
      );
    }
  }

  @override
  Future<List<Pedido>> getPedidos() async {
    try {
      final pedidosData = await apiDataSource.fetchPedidos();
      return pedidosData;
    } on DioException catch (e) {
      final mensaje = _mapearErrorDio(e);
      throw PedidoRepositoryException(mensaje);
    } catch (e) {
      if (e is PedidoRepositoryException) {
        rethrow;
      }
      throw PedidoRepositoryException('Error al obtener pedidos: $e');
    }
  }

  @override
  Future<Pedido> getPedidoById(String id) async {
    if (id.isEmpty) {
      throw PedidoRepositoryException('El ID del pedido no puede estar vacío');
    }
    try {
      final pedido = await apiDataSource.fetchPedidoById(id);
      return pedido;
    } on DioException catch (e) {
      final mensaje = _mapearErrorDio(e);
      throw PedidoRepositoryException(mensaje);
    } catch (e) {
      if (e is PedidoRepositoryException) {
        rethrow;
      }
      throw PedidoRepositoryException('Error al obtener el pedido: $e');
    }
  }

  @override
  Future<void> actualizarEstadoPedido(String id, String nuevoEstado) async {
    if (id.isEmpty) {
      throw PedidoRepositoryException('El ID del pedido no puede estar vacío');
    }
    if (!_esEstadoValido(nuevoEstado)) {
      throw PedidoRepositoryException('El estado "$nuevoEstado" no es válido');
    }
    try {
      await apiDataSource.actualizarEstado(id, nuevoEstado);
    } on DioException catch (e) {
      final mensaje = _mapearErrorDio(e);
      throw PedidoRepositoryException(mensaje);
    } catch (e) {
      if (e is PedidoRepositoryException) {
        rethrow;
      }
      throw PedidoRepositoryException('Error al actualizar el estado: $e');
    }
  }

  @override
  Future<void> crearPedido(Pedido pedido) async {
    if (pedido.id.isEmpty) {
      throw PedidoRepositoryException('El ID del pedido no puede estar vacío');
    }
    if (pedido.producto.isEmpty) {
      throw PedidoRepositoryException('El producto no puede estar vacío');
    }
    if (pedido.cantidad <= 0) {
      throw PedidoRepositoryException('La cantidad debe ser mayor a 0');
    }
    try {
      await apiDataSource.actualizarEstado(pedido.id, pedido.estado);
    } on DioException catch (e) {
      final mensaje = _mapearErrorDio(e);
      throw PedidoRepositoryException(mensaje);
    } catch (e) {
      if (e is PedidoRepositoryException) {
        rethrow;
      }
      throw PedidoRepositoryException('Error al crear el pedido: $e');
    }
  }

  String _mapearErrorDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Tiempo de conexión agotado';
      case DioExceptionType.sendTimeout:
        return 'Tiempo de envío agotado';
      case DioExceptionType.receiveTimeout:
        return 'Tiempo de recepción agotado';
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final mensaje = e.response?.data?['message'] ?? 'Error desconocido';
        return 'Error del servidor ($statusCode): $mensaje';
      case DioExceptionType.cancel:
        return 'Solicitud cancelada';
      case DioExceptionType.connectionError:
        return 'Error de conexión: verifica tu conexión a internet';
      case DioExceptionType.unknown:
      default:
        return 'Error de red: ${e.message ?? 'Error desconocido'}';
    }
  }

  bool _esEstadoValido(String estado) {
    const estadosValidos = ['pendiente', 'completado', 'cancelado'];
    return estadosValidos.contains(estado.toLowerCase());
  }

  List<Pedido> filtrarPorEstado(List<Pedido> pedidos, String? estado) {
    if (estado == null || estado.isEmpty) {
      return pedidos;
    }
    return pedidos.where((p) => p.estado.toLowerCase() == estado.toLowerCase()).toList();
  }

  List<Pedido> ordenarPorFecha(List<Pedido> pedidos, {bool descendente = false}) {
    final listaOrdenada = List<Pedido>.from(pedidos);
    listaOrdenada.sort((a, b) => descendente ? b.id.compareTo(a.id) : a.id.compareTo(b.id));
    return listaOrdenada;
  }

  Map<String, int> agruparPorEstado(List<Pedido> pedidos) {
    final mapa = <String, int>{};
    for (final pedido in pedidos) {
      mapa[pedido.estado] = (mapa[pedido.estado] ?? 0) + 1;
    }
    return mapa;
  }

  int calcularTotalCantidad(List<Pedido> pedidos) {
    return pedidos.fold(0, (suma, pedido) => suma + pedido.cantidad);
  }

  List<Pedido> buscarPorProducto(List<Pedido> pedidos, String termino) {
    if (termino.isEmpty) return pedidos;
    final lowerTermino = termino.toLowerCase();
    return pedidos.where((p) => p.producto.toLowerCase().contains(lowerTermino)).toList();
  }
}

// === ARCHIVO: client/lib/presentation/screens/pedidos_screen.dart ===
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/pedido.dart';
import '../../domain/usecases/get_pedidos.dart';
import '../../domain/repositories/pedido_repository.dart';

class PedidosScreen extends StatefulWidget {
  const PedidosScreen({super.key});

  @override
  State<PedidosScreen> createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  List<Pedido> _pedidos = [];
  bool _isLoading = false;
  String? _errorMessage;
  String? _filtroEstado;

  @override
  void initState() {
    super.initState();
    _cargarPedidos();
  }

  Future<void> _cargarPedidos() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final getPedidos = context.read<GetPedidos>();
      final pedidos = await getPedidos.call();

      setState(() {
        _pedidos = pedidos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  List<Pedido> get _pedidosFiltrados {
    if (_filtroEstado == null || _filtroEstado!.isEmpty) {
      return _pedidos;
    }
    return _pedidos.where((p) => p.estado == _filtroEstado).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (String? value) {
              setState(() {
                _filtroEstado = value;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: null,
                child: Text('Todos'),
              ),
              const PopupMenuItem<String>(
                value: 'pendiente',
                child: Text('Pendientes'),
              ),
              const PopupMenuItem<String>(
                value: 'completado',
                child: Text('Completados'),
              ),
              const PopupMenuItem<String>(
                value: 'cancelado',
                child: Text('Cancelados'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _cargarPedidos,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Error al cargar pedidos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.red.shade700,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _cargarPedidos,
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (_pedidosFiltrados.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              _filtroEstado != null
                  ? 'No hay pedidos con estado "$_filtroEstado"'
                  : 'No hay pedidos disponibles',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _cargarPedidos,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _pedidosFiltrados.length,
        itemBuilder: (context, index) {
          final pedido = _pedidosFiltrados[index];
          return _PedidoCard(
            pedido: pedido,
            onActualizarEstado: (nuevoEstado) => _actualizarEstado(pedido.id, nuevoEstado),
          );
        },
      ),
    );
  }

  Future<void> _actualizarEstado(String id, String nuevoEstado) async {
    try {
      final repository = context.read<PedidoRepository>();
      await repository.actualizarEstadoPedido(id, nuevoEstado);
      await _cargarPedidos();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Estado actualizado a "$nuevoEstado"'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al actualizar: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class _PedidoCard extends StatelessWidget {
  final Pedido pedido;
  final Function(String) onActualizarEstado;

  const _PedidoCard({
    required this.pedido,
    required this.onActualizarEstado,
  });

  Color _getColorPorEstado(String estado) {
    switch (estado.toLowerCase()) {
      case 'pendiente':
        return Colors.orange;
      case 'completado':
        return Colors.green;
      case 'cancelado':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getIconoPorEstado(String estado) {
    switch (estado.toLowerCase()) {
      case 'pendiente':
        return Icons.hourglass_empty;
      case 'completado':
        return Icons.check_circle;
      case 'cancelado':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorEstado = _getColorPorEstado(pedido.estado);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 2,
      child: InkWell(
        onTap: () => _mostrarDialogoCambioEstado(context),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      pedido.producto,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: colorEstado.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorEstado),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getIconoPorEstado(pedido.estado),
                          size: 16,
                          color: colorEstado,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          pedido.estado.toUpperCase(),
                          style: TextStyle(
                            color: colorEstado,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.tag,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'ID: ${pedido.id}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.inventory_2,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Cantidad: ${pedido.cantidad}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoCambioEstado(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cambiar Estado'),
        content: const Text('Selecciona el nuevo estado del pedido:'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onActualizarEstado('pendiente');
            },
            child: const Text('Pendiente'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onActualizarEstado('completado');
            },
            child: const Text('Completado'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onActualizarEstado('cancelado');
            },
            child: const Text('Cancelado'),
          ),
        ],
      ),
    );
  }
}

// === ARCHIVO: client/lib/app_config.dart ===
import 'package:dio/dio.dart';

class AppConfig {
  static const String appName = 'Reto App';
  static const String appVersion = '1.0.0';

  static const String baseUrl = 'http://load_balancer_dns';
  static const String apiPath = '/api';

  static const String pedidosEndpoint = '/pedidos';

  static String get fullApiUrl => '$baseUrl$apiPath';
  static String get pedidosUrl => '$fullApiUrl$pedidosEndpoint';

  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  static const int pageSize = 20;
  static const int maxPageSize = 100;

  static const String ambienteDesarrollo = 'development';
  static const String ambienteProduccion = 'production';
  static const String ambientePrueba = 'test';

  static String currentEnvironment = ambienteDesarrollo;

  static bool get isDevelopment => currentEnvironment == ambienteDesarrollo;
  static bool get isProduction => currentEnvironment == ambienteProduccion;
  static bool get isTest => currentEnvironment == ambientePrueba;

  static void setEnvironment(String environment) {
    if (environment == ambienteDesarrollo ||
        environment == ambienteProduccion ||
        environment == ambientePrueba) {
      currentEnvironment = environment;
    } else {
      throw ArgumentError('Ambiente no válido: $environment');
    }
  }

  static Dio createDioInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: fullApiUrl,
        connectTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      _LoggingInterceptor(),
      _RetryInterceptor(
        maxRetries: maxRetries,
        retryDelay: retryDelay,
      ),
    ]);

    return dio;
  }

  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, dynamic> get apiConfig => {
    'baseUrl': baseUrl,
    'apiPath': apiPath,
    'endpoints': {
      'pedidos': pedidosEndpoint,
    },
    'timeouts': {
      'connection': connectionTimeout.inSeconds,
      'receive': receiveTimeout.inSeconds,
    },
    'retry': {
      'maxRetries': maxRetries,
      'delaySeconds': retryDelay.inSeconds,
    },
    'pagination': {
      'defaultPageSize': pageSize,
      'maxPageSize': maxPageSize,
    },
    'environment': currentEnvironment,
  };

  static void printConfig() {
    print('=== Configuración de la Aplicación ===');
    print('Nombre: $appName');
    print('Versión: $appVersion');
    print('Ambiente: $currentEnvironment');
    print('URL Base: $baseUrl');
    print('URL API: $fullApiUrl');
    print('Endpoint Pedidos: $pedidosUrl');
    print('Timeout Conexión: ${connectionTimeout.inSeconds}s');
    print('Timeout Recepción: ${receiveTimeout.inSeconds}s');
    print('Máximo de Reintentos: $maxRetries');
    print('======================================');
  }
}

class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('┌─────────────────────────────────────────');
    print('│ REQUEST: ${options.method} ${options.uri}');
    print('│ Headers: ${options.headers}');
    if (options.data != null) {
      print('│ Body: ${options.data}');
    }
    print('└─────────────────────────────────────────');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('┌─────────────────────────────────────────');
    print('│ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
    print('│ Data: ${response.data}');
    print('└─────────────────────────────────────────');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('┌─────────────────────────────────────────');
    print('│ ERROR: ${err.type}');
    print('│ Message: ${err.message}');
    print('│ URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      print('│ Status: ${err.response?.statusCode}');
      print('│ Response: ${err.response?.data}');
    }
    print('└─────────────────────────────────────────');
    handler.next(err);
  }
}

class _RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration retryDelay;

  _RetryInterceptor({
    required this.maxRetries,
    required this.retryDelay,
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;
    final retryCount = requestOptions.extra['retryCount'] ?? 0;

    if (_shouldRetry(err) && retryCount < maxRetries) {
      await Future.delayed(retryDelay);

      requestOptions.extra['retryCount'] = retryCount + 1;

      try {
        final dio = Dio();
        final response = await dio.fetch(requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        handler.next(err);
        return;
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.sendTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           err.type == DioExceptionType.connectionError ||
           (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500);
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';

  factory ApiException.fromDioException(DioException e) {
    String message;
    int? statusCode = e.response?.statusCode;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Tiempo de conexión agotado';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Tiempo de envío agotado';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Tiempo de recepción agotado';
        break;
      case DioExceptionType.badResponse:
        message = _parseErrorMessage(e.response?.data);
        statusCode = e.response?.statusCode;
        break;
      case DioExceptionType.cancel:
        message = 'Solicitud cancelada';
        break;
      case DioExceptionType.connectionError:
        message = 'Error de conexión';
        break;
      default:
        message = e.message ?? 'Error desconocido';
    }

    return ApiException(
      message: message,
      statusCode: statusCode,
      data: e.response?.data,
    );
  }

  static String _parseErrorMessage(dynamic data) {
    if (data == null) return 'Error desconocido';
    if (data is Map) {
      return data['message'] ?? data['error'] ?? data.toString();
    }
    return data.toString();
  }
}

class NetworkInfo {
  static const String networkError = 'Error de red';
  static const String timeoutError = 'Tiempo de espera agotado';
  static const String serverError = 'Error del servidor';
  static const String unauthorizedError = 'No autorizado';
  static const String forbiddenError = 'Acceso prohibido';
  static const String notFoundError = 'Recurso no encontrado';
  static const String validationError = 'Error de validación';
  static const String unknownError = 'Error desconocido';

  static String getErrorMessage(DioException e) {
    if (e.response?.statusCode != null) {
      final statusCode = e.response!.statusCode!;
      if (statusCode == 401) return unauthorizedError;
      if (statusCode == 403) return forbiddenError;
      if (statusCode == 404) return notFoundError;
      if (statusCode >= 400 && statusCode < 500) return validationError;
      if (statusCode >= 500) return serverError;
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return timeoutError;
      case DioExceptionType.connectionError:
        return networkError;
      default:
        return unknownError;
    }
  }
}
```
