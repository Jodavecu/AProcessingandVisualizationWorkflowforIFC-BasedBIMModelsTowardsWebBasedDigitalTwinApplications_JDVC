# ==========================================
# Etapa 1: Construcción (Builder)
# ==========================================
# Utilizamos una imagen alpine específica (más segura y controlada)
FROM node:18.19.0-alpine AS builder

# Establece el directorio de trabajo
WORKDIR /app

# Buena práctica: Copiar SOLO los archivos de dependencias primero.
# Esto aprovecha la caché de Docker de forma agresiva. Si no cambian
# tus dependencias, Docker se salta este paso de instalación, ahorrando tiempo.
COPY package.json package-lock.json ./

# Buena práctica: Usar 'npm ci' en lugar de 'npm install'.
# Instala exactamente lo que dice package-lock.json, es más rápido y predecible.
RUN npm ci

# Ahora sí, copiamos el resto del código
COPY . .

# Construye la aplicación
RUN npm run build

# ==========================================
# Etapa 2: Producción (Servidor Web)
# ==========================================
# Utilizamos Nginx en su versión Alpine para mantener la imagen ligera
FROM nginx:1.25-alpine

# Buena práctica: Metadatos para saber quién y qué es la imagen
LABEL maintainer="tu@email.com"
LABEL description="IFC Viewer Frontend"

# Elimina la configuración por defecto de Nginx y los archivos html base
RUN rm -rf /usr/share/nginx/html/* && \
    rm /etc/nginx/conf.d/default.conf

# Copiamos la carpeta 'dist' generada en la etapa 'builder'
COPY --from=builder /app/dist /usr/share/nginx/html

# Buena práctica: Ajustar permisos para que el usuario 'nginx' sea el dueño
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html && \
    # También necesitamos dar permisos a nginx para escribir en sus logs/pids temporales
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

# Exponemos el puerto
EXPOSE 80

# Buena práctica: Seguridad. NO ejecutar el contenedor como Root.
# Cambiamos al usuario sin privilegios 'nginx' que viene por defecto en la imagen.
USER nginx

# Comando para iniciar
CMD ["nginx", "-g", "daemon off;"]
