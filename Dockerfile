# Usa una imagen oficial de Dart como base
FROM dart:stable AS build

# Crea el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . .

# Compila el código Dart a JavaScript
RUN dart compile js calculadora.dart -o main.dart.js

# Usa una imagen ligera de Nginx para servir los archivos estáticos
FROM nginx:alpine

# Copia los archivos de la compilación al directorio de Nginx
COPY --from=build /app/ /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Inicia Nginx
CMD ["nginx", "-g", "daemon off;"]
