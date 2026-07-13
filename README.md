# Proyecto Innovatech - Arquitectura Cloud & Flujo CI/CD

**Evaluación Final Transversal - Introducción a Herramientas DevOps**
* **Integrantes:** Bruno Stockle | Sarai Pérez  
* **Sección:** 003D  
* **Docente:** Patrik David Osorio Yanez  

---

## 📌 Descripción del Proyecto
Este repositorio contiene la modernización de la plataforma **Innovatech (Gestión de Ventas y Despachos)**. El objetivo principal de este proyecto fue la transición de un entorno local y fuertemente acoplado hacia una infraestructura **Cloud nativa en AWS**. 

Hemos aplicado la cultura DevOps para rediseñar el sistema bajo una arquitectura de **microservicios**, implementando un flujo 100% automatizado de Integración y Despliegue Continuo (CI/CD) que garantiza escalabilidad, alta disponibilidad y tolerancia a fallos mediante tecnología Serverless.

## 🛠️ Stack Tecnológico y Arquitectura
* **Frontend:** React (Vite) servido mediante Nginx (Imágenes ligeras con Alpine).
* **Backend:** Microservicios independientes en Java (Spring Boot) para *Ventas* y *Despachos*.
* **Base de Datos:** Motor relacional (MySQL) aislado en red privada.
* **Orquestación de Contenedores:** Docker, Docker Compose, Amazon ECS y AWS Fargate.
* **Automatización CI/CD:** GitHub Actions.
* **Infraestructura AWS:** VPC dedicada (`Innovatech-vpc`), Subredes Públicas/Privadas (Multi-AZ), NAT Gateway, y Security Groups aplicando el principio de mínimo privilegio.

---

## ⚙️ Pipeline CI/CD (GitHub Actions)
Nuestro flujo de trabajo (`ci-cd.yml`) elimina los despliegues manuales y se activa automáticamente con cada `push` a la rama `deploy`. Está protegido mediante **GitHub Secrets** (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_SESSION_TOKEN`) para autenticación en AWS Learner Labs.

El proceso consta de 4 etapas técnicas:
1. **Validación (CI):** Aprovisionamiento de Node.js (v20) y JDK (v17) para compilar el Frontend y ejecutar `mvn clean package` en los microservicios de Spring Boot.
2. **Smoke Test:** Verificación de la integridad de la infraestructura local mediante `docker compose config`.
3. **Construcción y Publicación (Amazon ECR):** Uso de Docker Buildx para compilar las tres imágenes (Front, Back-Ventas, Back-Despachos) y subirlas a nuestros repositorios privados en ECR.
4. **Despliegue Automatizado (Amazon ECS):** Invocación de la AWS CLI (`aws ecs update-service`) para aplicar un `--force-new-deployment`, obligando al clúster de Fargate a descargar la nueva versión y reemplazar las Tareas activas sin tiempo de inactividad (Zero Downtime).

---

## 📸 Bitácora de Implementación Cloud

A continuación, se detalla la evidencia técnica de la infraestructura desplegada:

### 1. Diseño de Red Segura (AWS VPC)
Implementación de la `Innovatech-vpc` aislando los microservicios. El Frontend reside en una subred pública, mientras que los Backends operan en subredes privadas con salida a internet a través de un **NAT Gateway**.
> `![VPC y Subredes]([ENLACE_A_TU_IMAGEN_VPC])`

### 2. Seguridad y Reglas Perimetrales (Security Groups)
Aplicación del principio de mínimo privilegio. El puerto 80 solo está abierto para el Frontend, mientras que los puertos internos (8081, 8082, 3306) solo aceptan tráfico proveniente de los grupos de seguridad permitidos.
> `![Security Groups]([ENLACE_A_TU_IMAGEN_SG])`

### 3. Contenedorización Optimizada (Docker)
Uso de `Dockerfile` con *multi-stage builds* para reducir drásticamente el peso de las imágenes, aislando las APIs de Spring Boot y el cliente de React.
> `![Docker config]([ENLACE_A_TU_IMAGEN_DOCKERFILE])`

### 4. Almacenamiento Privado de Imágenes (Amazon ECR)
Creación de registros inmutables y encriptados (`innovatech-front`, `innovatech-back-ventas`, `innovatech-back-despachos`) que actúan como puente entre el Pipeline y Producción.
> `![Repositorios ECR]([ENLACE_A_TU_IMAGEN_ECR])`

### 5. Pipeline Automatizado (Actions Workflow)
Evidencia de la ejecución exitosa de los "Jobs" en GitHub Actions, pasando desde la compilación de código hasta la inyección de las imágenes en AWS.
> `![Pipeline Success]([ENLACE_A_TU_IMAGEN_PIPELINE])`

### 6. Orquestación Serverless en Producción (Amazon ECS)
El clúster `Innovatech-Cluster` operando las Tareas (Tasks) en **AWS Fargate**, garantizando *Self-healing* (auto-recuperación) y evitando la administración de instancias EC2.
> `![Clúster ECS]([ENLACE_A_TU_IMAGEN_CLUSTER_ECS])`

### 7. Resultado Final: Plataforma Operativa (E2E)
Dashboard de Despachos consumiendo los microservicios internos en tiempo real a través de la IP pública del balanceador/frontend, validando la comunicación exitosa en la nube.
> `![Dashboard Operativo]([ENLACE_A_TU_IMAGEN_FRONTEND_FINAL])`
