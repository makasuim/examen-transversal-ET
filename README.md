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
 <img width="589" height="267" alt="frontend" src="https://github.com/user-attachments/assets/b03f0681-3aa2-474c-b2dc-7214ed33bcf5" />
<img width="589" height="234" alt="backend" src="https://github.com/user-attachments/assets/918bf2a3-7a8c-4ca7-936f-b31466665c0a" />

 

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
 <img width="589" height="138" alt="x9" src="https://github.com/user-attachments/assets/ce4ab13c-08d0-4729-994a-79f660b7fdd4" />

Encendido del daemon de docker vía systemctl habilitando el autoarranque en reinicios, adición al grupo y descarga del binario compose.


10. Verificación de versiones de Docker y Docker Compose en la EC2.
 <img width="386" height="202" alt="x10" src="https://github.com/user-attachments/assets/d68dd60a-8764-47a4-aba4-6ec8e7730370" />

Control de versiones ejecutando flags de verificación para asegurar que la máquina cuenta con Docker v25 y Docker Compose v5 activos.


11. Estructura base del repositorio del proyecto en GitHub.
 <img width="410" height="225" alt="x11" src="https://github.com/user-attachments/assets/a4c73dc3-cd1e-4eae-bce7-46edfd1a9aaf" />

Estado saludable del repositorio remoto en GitHub con la carpeta principal del proyecto semestral lista para su clonación y despliegue.


12. Árbol de directorios de los microservicios en Visual Studio Code.
 <img width="249" height="364" alt="x12" src="https://github.com/user-attachments/assets/773871c3-c7ec-4392-8c21-e0b8a975815a" />

Organización modular y desacoplada de los microservicios Java de Ventas y Despachos listos para compilar de forma aislada.


13. Configuración Multi-stage Build en el Dockerfile del Frontend.
 <img width="440" height="372" alt="x13" src="https://github.com/user-attachments/assets/0e341e74-bcc2-43db-b8ab-f24cfaf253c0" />

Definición del Dockerfile del Frontend aplicando empaquetado multi-etapa optimizado con node y servidor ligero nginx.


14. Instalación de la herramienta Git en el servidor de AWS.
 <img width="761" height="716" alt="x14" src="https://github.com/user-attachments/assets/f7f5ee47-1075-44f6-97fd-39d288874587" />

Instalación automatizada del cliente de control de versiones Git en la instancia interna para permitir la descarga de código fuente.


15. Clonación del repositorio Git y ejecución de docker compose up.
 <img width="457" height="255" alt="x15" src="https://github.com/user-attachments/assets/00fd342b-8c7a-4a9b-9551-d762b875e300" />

Descarga directa del código fuente mediante clonación HTTP y llamada al orquestador Docker Compose para iniciar la construcción masiva.


16. Logs de compilación de las APIs de Spring Boot con Maven.
 <img width="474" height="495" alt="x16" src="https://github.com/user-attachments/assets/db370a82-0f83-48aa-bf3e-09d074265cb1" />

Logs en tiempo real descargando artefactos .pom de dependencias Maven core y compilando los archivos ejecutables distribuidos .jar.


17. Contenedores activos en producción listados con docker ps.
 <img width="589" height="182" alt="x17" src="https://github.com/user-attachments/assets/1a4b6729-b61a-4815-8c13-0c232aae2bdd" />

Inspección y control con docker ps listando el estado saludable (Up) de los microservicios Spring Boot y el volumen de persistencia PostgreSQL.


18. Saneamiento y actualización de dependencias de red en EC2.
 <img width="890" height="613" alt="x18" src="https://github.com/user-attachments/assets/2a819ee8-2853-439c-92ee-6a2746f10ab0" />

Comando de saneamiento de red y verificación del ciclo de vida del entorno Linux previo a la liberación de puertos frontales públicos.


19. Logs de construcción de la SPA Frontend con servidor Nginx.
 <img width="324" height="320" alt="x19" src="https://github.com/user-attachments/assets/58e29d4d-4ed9-4a69-8b34-706ac5009c4f" />

Proceso de empaquetado de assets de React inyectando las dependencias estáticas directamente sobre el directorio raíz web de Nginx.


20. Despliegue exitoso del Frontend expuesto en el puerto 80.
 <img width="659" height="357" alt="x20" src="https://github.com/user-attachments/assets/f22e9fe0-1507-4f84-a7ed-078a1d8ac3ee" />
 <img width="589" height="273" alt="started" src="https://github.com/user-attachments/assets/fdb1e4e2-1d98-426e-b860-15362e1d707f" />


Control de colisiones de puertos y liberación del proxy inverso front-despacho de cara al internet público a través del puerto HTTP 80.


21. Interfaz web cargada en producción (Dashboard de Despachos).
 <img width="891" height="434" alt="x21" src="https://github.com/user-attachments/assets/2f04895c-fc61-4290-ae71-28b94364ef95" />

Acceso exitoso al Dashboard web del sistema utilizando la dirección IP pública perimetral de AWS asignada a la instancia de Frontend.


22. Validación de la conexión al Backend al consultar compras.
 <img width="869" height="438" alt="x22" src="https://github.com/user-attachments/assets/d457368a-f3a0-43a9-9761-f7d8087a96f8" />

Test de integración extremo a extremo gatillando el botón Consultar para verificar la comunicación exitosa.
