# --- ETAPA 1: Construcción (Build) ---
FROM node:20-alpine AS build
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalación limpia de dependencias (limpieza de capas)
RUN npm ci

# Copiar el resto del código y compilar el proyecto
COPY . .
RUN npm run build

# --- ETAPA 2: Ejecución (Runtime - Nginx Seguro) ---
FROM nginx:1.25-alpine

# 1. Configurar Nginx para operar como usuario NO-ROOT (Seguridad avanzada)
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /var/cache/nginx /var/log/nginx /etc/nginx

# 2. Modificar el archivo de configuración interno para escuchar en el puerto 8080
RUN sed -i 's/listen\(.*\)80;/listen 8080;/' /etc/nginx/conf.d/default.conf

# 3. Copiar los archivos estáticos generados por Vite al directorio de Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# 4. Asegurar que los archivos copiados pertenezcan al usuario nginx
RUN chown -R nginx:nginx /usr/share/nginx/html

# 5. Cambiar el contexto de ejecución al usuario sin privilegios
USER nginx

# Exponer el nuevo puerto no privilegiado
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
