1. Instancias EC2 running (EC2-Frontend y EC2-Backend).
 <img width="393" height="410" alt="x1" src="https://github.com/user-attachments/assets/2fd03c0c-4b8f-4bb5-804f-2b1bb906091f" />


Configuración, inicio de las dos máquinas virtuales principales en AWS EC2 para segmentar el ecosistema de software.



2. Tablas de enrutamiento públicas y privadas de la VPC.
<img width="377" height="411" alt="x2" src="https://github.com/user-attachments/assets/cc3e71a9-8363-496e-aff5-3e0efef1d59b" />


Asociación técnica de las subredes públicas y privadas de Innovatech para aislar correctamente los entornos según las tablas de enrutamiento.


3. Gateway NAT (Innovatech-NAT-V2) con IP elástica asociada.
 <img width="1201" height="399" alt="x3" src="https://github.com/user-attachments/assets/b96bbfed-f826-4ae6-b3df-d638678510c5" />
 

Aprovisionamiento de un NAT Gateway acoplado a una IP elástica fija para dotar de salida a internet segura a los recursos aislados del Backend.


4. Consola AWS: Panel con la VPC principal (Innovatech-vpc) activa.
 <img width="862" height="589" alt="x4" src="https://github.com/user-attachments/assets/84b33e69-f073-4d21-aac8-c2121ff1fee3" />
 

Inicialización y estado operativo disponible de la Nube Virtual Privada corporativa con direccionamiento lógico CIDR 10.0.0.0/16.


5. Grupos de seguridad (Security Groups) de Frontend y Backend.
 <img width="911" height="434" alt="x5" src="https://github.com/user-attachments/assets/c3196548-047a-4a7c-9779-cf07bc8c5141" />

Configuración de firewalls perimetrales (Security Groups) para restringir el acceso a puertos expuestos solo a IPs legítimas internas.


6. Conexión SSH multi-hop y ping exitoso desde la subred privada.
 <img width="378" height="360" alt="x6" src="https://github.com/user-attachments/assets/4c05b60c-d470-4e53-9aab-f5876346c347" />

Éxito en la validación práctica de red realizando un salto SSH hacia el nodo privado interno y comprobando salida web mediante protocolo ICMP ping.


7. Instalación de paquetes de Docker Engine mediante dnf.
 <img width="348" height="376" alt="x7" src="https://github.com/user-attachments/assets/bc3d9418-89fb-40f6-a322-efd88bd60ae6" />

Ejecución del comando dnf en Amazon Linux 2023 para descargar el core del motor de contenedores de Docker y sus dependencias.


8. Finalización exitosa de la instalación de dependencias Docker.
 <img width="589" height="143" alt="x8" src="https://github.com/user-attachments/assets/9a7a7a11-2985-4579-abe7-6ccd2dcee46c" />

Finalización conforme de la transacción del gestor de paquetes arrojando la instalación exitosa de containerd, iptables y docker-ce.
9. Activación de Docker via systemctl y descarga de Compose.
 
Encendido del daemon de docker vía systemctl habilitando el autoarranque en reinicios, adición al grupo y descarga del binario compose.
10. Verificación de versiones de Docker y Docker Compose en la EC2.
 
Control de versiones ejecutando flags de verificación para asegurar que la máquina cuenta con Docker v25 y Docker Compose v5 activos.
11. Estructura base del repositorio del proyecto en GitHub.
 
Estado saludable del repositorio remoto en GitHub con la carpeta principal del proyecto semestral lista para su clonación y despliegue.
12. Árbol de directorios de los microservicios en Visual Studio Code.
 
Organización modular y desacoplada de los microservicios Java de Ventas y Despachos listos para compilar de forma aislada.
13. Configuración Multi-stage Build en el Dockerfile del Frontend.
 
Definición del Dockerfile del Frontend aplicando empaquetado multi-etapa optimizado con node y servidor ligero nginx.
14. Instalación de la herramienta Git en el servidor de AWS.
 
Instalación automatizada del cliente de control de versiones Git en la instancia interna para permitir la descarga de código fuente.
15. Clonación del repositorio Git y ejecución de docker compose up.
 
Descarga directa del código fuente mediante clonación HTTP y llamada al orquestador Docker Compose para iniciar la construcción masiva.
16. Logs de compilación de las APIs de Spring Boot con Maven.
 
Logs en tiempo real descargando artefactos .pom de dependencias Maven core y compilando los archivos ejecutables distribuidos .jar.
17. Contenedores activos en producción listados con docker ps.
 
Inspección y control con docker ps listando el estado saludable (Up) de los microservicios Spring Boot y el volumen de persistencia PostgreSQL.
18. Saneamiento y actualización de dependencias de red en EC2.
 
Comando de saneamiento de red y verificación del ciclo de vida del entorno Linux previo a la liberación de puertos frontales públicos.
19. Logs de construcción de la SPA Frontend con servidor Nginx.
 
Proceso de empaquetado de assets de React inyectando las dependencias estáticas directamente sobre el directorio raíz web de Nginx.
20. Despliegue exitoso del Frontend expuesto en el puerto 80.
 
Control de colisiones de puertos y liberación del proxy inverso front-despacho de cara al internet público a través del puerto HTTP 80.
21. Interfaz web cargada en producción (Dashboard de Despachos).
 
Acceso exitoso al Dashboard web del sistema utilizando la dirección IP pública perimetral de AWS asignada a la instancia de Frontend.
22. Validación de la conexión al Backend al consultar compras.
 
Test de integración extremo a extremo gatillando el botón Consultar para verificar la comunicación exitosa.
