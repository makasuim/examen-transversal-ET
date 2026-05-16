# --- ETAPA 1: Construcción (Build) ---
FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app

# Copiar el archivo de configuración de dependencias
COPY pom.xml .

# Descargar dependencias en caché para limpiar capas y optimizar rendimiento
RUN mvn dependency:go-offline -B

# Copiar el código fuente y compilar el archivo ejecutable (.jar) sin correr los tests
COPY src ./src
RUN mvn package -DskipTests

# --- ETAPA 2: Ejecución (Runtime) ---
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Crear un usuario y grupo no-root por seguridad (Mínimo privilegio)
RUN addgroup -S devopsgroup && adduser -S devopsuser -G devopsgroup

# Copiar solo el archivo .jar compilado desde la etapa anterior
COPY --from=build /app/target/*.jar app.jar

# Cambiar la propiedad de la carpeta de trabajo al usuario no-root
RUN chown -R devopsuser:devopsgroup /app
USER devopsuser

# Puerto interno expuesto por Spring Boot
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]