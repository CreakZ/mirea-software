FROM nginx:latest

# Копируем конфигурационный файл Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Копируем HTML-файл в стандартную директорию Nginx
COPY index.html /usr/share/nginx/html/
