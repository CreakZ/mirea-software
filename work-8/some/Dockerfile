# Базовый образ с Go
FROM golang:1.20

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем исходный код в контейнер
COPY main.go .

# Сборка Go-приложения
RUN go build -o server main.go

EXPOSE 8080

CMD ["./server"]
