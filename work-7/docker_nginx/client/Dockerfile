FROM alpine:latest

# Устанавливаем curl
RUN apk add --no-cache curl

# Копируем клиентский скрипт
COPY client.sh /client/

# Делаем скрипт исполняемым
RUN chmod +x /client/client.sh

# Выполняем скрипт
CMD ["/client/client.sh"]
