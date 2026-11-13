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