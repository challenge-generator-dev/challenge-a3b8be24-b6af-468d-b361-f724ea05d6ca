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