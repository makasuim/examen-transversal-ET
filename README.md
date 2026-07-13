# Proyecto Innovatech - Arquitectura Cloud y Flujo CI/CD

**Integrantes:** Bruno Stockle | Sarai Pérez  
**Asignatura:** Introducción a Herramientas DevOps (Sección 003D)

## 📌 Descripción del Proyecto
Modernización de la plataforma Innovatech (Gestión de Ventas y Despachos) mediante la transición de un entorno local y monolítico hacia una infraestructura Cloud nativa en AWS. El sistema está rediseñado bajo una arquitectura de microservicios, implementando un flujo 100% automatizado (CI/CD) para garantizar escalabilidad, alta disponibilidad y tolerancia a fallos.

## 🛠️ Tecnologías y Arquitectura
* **Frontend:** React (Vite) + Nginx
* **Backend:** Java Spring Boot (Microservicios de Ventas y Despachos)
* **Base de Datos:** PostgreSQL / MySQL
* **Orquestación y Contenedores:** Docker, Docker Compose, Amazon ECS (Fargate) y Amazon ECR.
* **Automatización CI/CD:** GitHub Actions
* **Infraestructura AWS:** VPC, Subredes (Públicas/Privadas), NAT Gateway, Internet Gateway, Security Groups, EC2 (Entorno Staging).

---

## ⚙️ Pipeline CI/CD (GitHub Actions)
Nuestro flujo de integración y despliegue continuo se activa automáticamente con cada `push` a la rama `deploy` y consta de 4 etapas:
1. **Validación (CI):** Compilación automatizada de código Frontend (Node.js) y Backend (JDK 17).
2. **Smoke Test:** Validación de la estructura y configuración de los contenedores mediante `docker-compose`.
3. **Publicación (Amazon ECR):** Autenticación segura y carga de las imágenes Docker a nuestros repositorios privados en AWS.
4. **Despliegue (Amazon ECS):** Actualización forzada de las tareas en producción utilizando AWS Fargate (Serverless).

---

## 📸 Bitácora de Implementación y Evidencias Técnicas

**1. Aprovisionamiento de Instancias EC2 (Staging)**
Configuración e inicio de las máquinas virtuales principales en AWS EC2 para segmentar el ecosistema de software y realizar pruebas de humo.
<img width="393" height="410" alt="x1" src="https://github.com/user-attachments/assets/2fd03c0c-4b8f-4bb5-804f-2b1bb906091f" />
<img width="589" height="108" alt="instancias" src="https://github.com/user-attachments/assets/73e256dc-b59c-4775-be7d-089649e79833" />

**2. Tablas de enrutamiento públicas y privadas de la VPC**
Asociación técnica de las subredes públicas y privadas de Innovatech para aislar correctamente los entornos según las tablas de enrutamiento.
<img width="377" height="411" alt="x2" src="https://github.com/user-attachments/assets/cc3e71a9-8363-496e-aff5-3e0efef1d59b" />

**3. Gateway NAT (Innovatech-NAT-V2) con IP elástica asociada**
Aprovisionamiento de un NAT Gateway acoplado a una IP elástica fija para dotar de salida a internet segura a los recursos aislados del Backend.
<img width="1201" height="399" alt="x3" src="https://github.com/user-attachments/assets/b96bbfed-f826-4ae6-b3df-d638678510c5" />

**4. Consola AWS: Panel con la VPC principal (Innovatech-vpc) activa**
Inicialización y estado operativo de la Nube Virtual Privada corporativa con direccionamiento lógico CIDR 10.0.0.0/16.
<img width="862" height="589" alt="x4" src="https://github.com/user-attachments/assets/84b33e69-f073-4d21-aac8-c2121ff1fee3" />

**5. Grupos de Seguridad (Security Groups) de Frontend y Backend**
Configuración de firewalls perimetrales para restringir el acceso a puertos expuestos solo a IPs legítimas internas (Principio de mínimo privilegio).
<img width="911" height="434" alt="x5" src="https://github.com/user-attachments/assets/c3196548-047a-4a7c-9779-cf07bc8c5141" />
<img width="589" height="205" alt="fr" src="https://github.com/user-attachments/assets/c7b614bb-e5bc-4674-ab87-403081dbc909" />
<img width="589" height="234" alt="backend" src="https://github.com/user-attachments/assets/918bf2a3-7a8c-4ca7-936f-b31466665c0a" />

**6. Conexión SSH multi-hop y ping exitoso desde la subred privada**
Éxito en la validación práctica de red realizando un salto SSH hacia el nodo privado interno y comprobando salida web mediante protocolo ICMP ping.
<img width="378" height="360" alt="x6" src="https://github.com/user-attachments/assets/4c05b60c-d470-4e53-9aab-f5876346c347" />

**7. Instalación de paquetes de Docker Engine mediante dnf**
Ejecución del comando dnf en Amazon Linux 2023 para descargar el core del motor de contenedores de Docker y sus dependencias.
<img width="348" height="376" alt="x7" src="https://github.com/user-attachments/assets/bc3d9418-89fb-40f6-a322-efd88bd60ae6" />

**8. Finalización exitosa de la instalación de dependencias Docker**
Finalización conforme de la transacción del gestor de paquetes arrojando la instalación exitosa de containerd, iptables y docker-ce.
<img width="589" height="143" alt="x8" src="https://github.com/user-attachments/assets/9a7a7a11-2985-4579-abe7-6ccd2dcee46c" />

**9. Activación de Docker via systemctl y descarga de Compose**
Encendido del daemon de docker vía systemctl habilitando el autoarranque en reinicios, adición al grupo y descarga del binario compose.
<img width="589" height="138" alt="x9" src="https://github.com/user-attachments/assets/ce4ab13c-08d0-4729-994a-79f660b7fdd4" />

**10. Verificación de versiones de Docker y Docker Compose en la EC2**
Control de versiones ejecutando flags de verificación para asegurar que la máquina cuenta con Docker v25 y Docker Compose v5 activos.
<img width="386" height="202" alt="x10" src="https://github.com/user-attachments/assets/d68dd60a-8764-47a4-aba4-6ec8e7730370" />

**11. Estructura base del repositorio del proyecto en GitHub**
Estado saludable del repositorio remoto en GitHub con la carpeta principal del proyecto semestral lista para su clonación y despliegue.
<img width="410" height="225" alt="x11" src="https://github.com/user-attachments/assets/a4c73dc3-cd1e-4eae-bce7-46edfd1a9aaf" />

**12. Árbol de directorios de los microservicios en VS Code**
Organización modular y desacoplada de los microservicios Java de Ventas y Despachos listos para compilar de forma aislada.
<img width="249" height="364" alt="x12" src="https://github.com/user-attachments/assets/773871c3-c7ec-4392-8c21-e0b8a975815a" />

**13. Configuración Multi-stage Build en el Dockerfile del Frontend**
Definición del Dockerfile del Frontend aplicando empaquetado multi-etapa optimizado con Node.js y un servidor web ligero Nginx.
<img width="440" height="372" alt="x13" src="https://github.com/user-attachments/assets/0e341e74-bcc2-43db-b8ab-f24cfaf253c0" />

**14. Instalación de la herramienta Git en el servidor de AWS**
Instalación automatizada del cliente de control de versiones Git en la instancia interna para permitir la descarga de código fuente.
<img width="761" height="716" alt="x14" src="https://github.com/user-attachments/assets/f7f5ee47-1075-44f6-97fd-39d288874587" />

**15. Clonación del repositorio Git y ejecución de docker compose up**
Descarga directa del código fuente mediante clonación HTTP y llamada al orquestador Docker Compose para iniciar la construcción de contenedores.
<img width="457" height="255" alt="x15" src="https://github.com/user-attachments/assets/00fd342b-8c7a-4a9b-9551-d762b875e300" />

**16. Logs de compilación de las APIs de Spring Boot con Maven**
Logs en tiempo real descargando artefactos `.pom` de dependencias Maven core y compilando los archivos ejecutables distribuidos `.jar`.
<img width="474" height="495" alt="x16" src="https://github.com/user-attachments/assets/db370a82-0f83-48aa-bf3e-09d074265cb1" />

**17. Contenedores activos listados con docker ps**
Inspección y control con `docker ps` listando el estado saludable (Up) de los microservicios Spring Boot y el volumen de persistencia.
<img width="589" height="182" alt="x17" src="https://github.com/user-attachments/assets/1a4b6729-b61a-4815-8c13-0c232aae2bdd" />

**18. Saneamiento y actualización de dependencias de red en EC2**
Comando de saneamiento de red y verificación del ciclo de vida del entorno Linux previo a la liberación de puertos frontales públicos.
<img width="890" height="613" alt="x18" src="https://github.com/user-attachments/assets/2a819ee8-2853-439c-92ee-6a2746f10ab0" />

**19. Logs de construcción de la SPA Frontend con servidor Nginx**
Proceso de empaquetado de assets de React inyectando las dependencias estáticas directamente sobre el directorio raíz web de Nginx.
<img width="324" height="320" alt="x19" src="https://github.com/user-attachments/assets/58e29d4d-4ed9-4a69-8b34-706ac5009c4f" />

**20. Despliegue exitoso del Frontend expuesto en el puerto 80**
Control de colisiones de puertos y liberación del proxy inverso front-despacho de cara al internet público a través del puerto HTTP 80.
<img width="659" height="357" alt="x20" src="https://github.com/user-attachments/assets/f22e9fe0-1507-4f84-a7ed-078a1d8ac3ee" />
<img width="589" height="273" alt="started" src="https://github.com/user-attachments/assets/fdb1e4e2-1d98-426e-b860-15362e1d707f" />

**21. Interfaz web cargada (Dashboard de Despachos)**
Acceso exitoso al Dashboard web del sistema utilizando la dirección IP perimetral de AWS asignada a la instancia de Frontend.
<img width="891" height="434" alt="x21" src="https://github.com/user-attachments/assets/2f04895c-fc61-4290-ae71-28b94364ef95" />

**22. Validación de la conexión al Backend (Test E2E)**
Test de integración extremo a extremo gatillando el botón Consultar para verificar la comunicación segura y exitosa entre Frontend y Backend.
<img width="869" height="438" alt="x22" src="https://github.com/user-attachments/assets/d457368a-f3a0-43a9-9761-f7d8087a96f8" />

**23. Configuración de Seguridad y GitHub Secrets**
Inyección segura de las credenciales de autenticación del laboratorio (AWS Learner Labs) a través de GitHub Secrets para habilitar el despliegue continuo.
<img width="443" height="464" alt="x23" src="https://github.com/user-attachments/assets/d51381d7-517e-4bfc-afc3-747fe674d53b" />

**24. Implementación del Pipeline (Workflow YAML)**
Creación del archivo `ci-cd.yml` en el repositorio para declarar las rutinas de construcción, pruebas e inyección automática (Deploy) hacia Amazon ECS.
<img width="662" height="265" alt="x24" src="https://github.com/user-attachments/assets/488ce85b-4996-4511-9abd-fa73a506c530" />
