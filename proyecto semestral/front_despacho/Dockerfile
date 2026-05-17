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

# --- ETAPA 2: Ejecución (Runtime) ---
FROM nginx:1.25-alpine

# Copiar los archivos estáticos generados por Vite al directorio de Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Exponer el puerto estándar de Nginx
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]  