# Despliegue de Infraestructura con Terraform

La aplicación móvil requiere una infraestructura robusta y escalable para su backend. Debes aprovisionar la infraestructura necesaria utilizando Terraform para soportar la API de la app de pedidos. Los recursos deben ser desplegados en un entorno de prueba que simule el entorno de producción.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | infraestructura-como-codigo-para-el-backend-de-una-app-movil |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial

**Objetivo:** Configurar el entorno de Terraform y definir los recursos básicos necesarios para la aplicación.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los recursos de infraestructura necesarios para la API de la app de pedidos.
- Configurar el entorno de Terraform para el despliegue de la infraestructura.
- Definir los recursos básicos (servidores, bases de datos, redes) en los archivos de Terraform.

**Entregable:** Archivos de Terraform configurados con los recursos básicos definidos.

<details>
<summary>Pistas de conocimiento</summary>

- Terraform permite la gestión de infraestructura como código.
- Es importante definir los recursos de manera idónea para asegurar la escalabilidad y la disponibilidad.

</details>

### Fase 2: Despliegue de Recursos

**Objetivo:** Desplegar los recursos definidos en la fase anterior y verificar su correcta implementación.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecutar los comandos de Terraform para desplegar los recursos definidos.
- Verificar que los recursos se han desplegado correctamente y están disponibles para su uso.
- Documentar el proceso de despliegue y las configuraciones realizadas.

**Entregable:** Infraestructura desplegada y verificada, con documentación del proceso.

<details>
<summary>Pistas de conocimiento</summary>

- Los comandos de Terraform `terraform init`, `terraform plan` y `terraform apply` son esenciales para el despliegue.
- La documentación del proceso ayuda a mantener y escalar la infraestructura en el futuro.

</details>

### Fase 3: Optimización y Escalabilidad

**Objetivo:** Optimizar la configuración de la infraestructura para mejorar la escalabilidad y el rendimiento.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Analizar la configuración actual de la infraestructura y identificar áreas de mejora.
- Aplicar cambios en los archivos de Terraform para optimizar la configuración.
- Volver a desplegar la infraestructura con las nuevas configuraciones y verificar los resultados.

**Entregable:** Infraestructura optimizada y desplegada, con documentación de los cambios realizados.

<details>
<summary>Pistas de conocimiento</summary>

- La optimización de la configuración puede incluir ajustes en las especificaciones de los recursos, la configuración de redes y la implementación de políticas de escalado automático.
- Es importante verificar que los cambios realizados no afectan negativamente el funcionamiento de la aplicación.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se utiliza para gestionar la infraestructura como código?
- **paraQueSirve**: ¿Para qué sirve desplegar la infraestructura con Terraform en el contexto de una aplicación móvil?
- **comoSeUsa**: ¿Cómo se utilizan los comandos de Terraform para desplegar y gestionar la infraestructura?
- **queDecisionesImplica**: ¿Qué decisiones debes tomar al optimizar la configuración de la infraestructura para mejorar la escalabilidad y el rendimiento?

## Criterios de Evaluacion

- Configuración inicial de Terraform y definición de recursos.
- Despliegue exitoso de la infraestructura y verificación de su correcta implementación.
- Optimización de la configuración de la infraestructura para mejorar la escalabilidad y el rendimiento.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform init -backend=false && terraform -chdir=environments/dev init -backend=false && terraform -chdir=environments/prod init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/database init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/storage init -backend=false && terraform validate && terraform -chdir=environments/dev validate && terraform -chdir=environments/prod validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/database validate && terraform -chdir=modules/network validate && terraform -chdir=modules/storage validate) && (cd client && flutter pub get && flutter analyze)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
