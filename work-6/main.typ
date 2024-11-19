#import "../assets/title_page.typ": title_page_me

#set page(margin: 2cm)
#set text(size: 14pt, font: "New Computer Modern")
#set heading(numbering: "1.1.1.")
#set par(justify: true)
#set figure(supplement: [Рисунок])
#set figure.caption(separator: [ -- ])

#import "@preview/codelst:2.0.1": sourcecode
#import "@preview/badgery:0.1.1": *

#show heading: it => align(center)[#it]

#show link: it => text(fill: blue, underline(it))

#title_page_me(
  6,
  [Создание контейнеров в Docker]
)

#outline(
  title: [Оглавление]
)

#pagebreak()

#set page(numbering: "1")

= Введение

*Цель работы:* получить навыки сборки Docker-контейнера с использованием Docker-composer.

*Задание:*

#enum(
  [Веб-сервера apache, так чтобы можно было запускать
самостоятельно созданный сайт. Продумайте компоновку
контейнера на свое усмотрение.],
[СУБД mysql, при обращении к которой из самостоятельно
созданного приложения можно было помещать и читать
данные в базу данных. Продумайте компоновку контейнера на
свое усмотрение.],
[Поместить в контейнер собственное приложение. Продумайте
компоновку контейнера на свое усмотрение.],
[Самостоятельно придумать содержимое контейнера, которое
принесет практическую пользу.],
[Придумать задание на последующую практическую работу,
описать сформулированное задание в отчете и сообщить
преподавателю.]
)

== Теоретическое введение

Docker-compose
позволяет
запускать
несколько
контейнеров,
связывать их и определять различные свойства контейнера в одном файле.
Этот файл называется `docker-compose.yml`.
Docker Compose управляет контейнерами, запускает их вместе, в
нужной последовательности.
Docker-compose написан в формате `YAML` который по своей сути
похож на `JSON` или `XML`. В формате `YAML` имеют значения пробелы и
табуляции, именно пробелами отделяются названия параметров от их
значений.
Чтобы просмотреть команды и их действия, необходимо выполнить в
терминале:

#sourcecode(```sh
docker compose --help
```)

`docker compose up`
используется, для запуска или служб в файле `docker-compose.yml`.
Файл
`docker-compose.yml`
определяет
сервисы,
их
свойства,
переменные и зависимости.

#sourcecode(```sh
docker compose up
```)

Для просмотра запущенных контейнеров:

#sourcecode(```sh
docker compose ps
```)

Также можно указать docker-compose запустить только один сервис,
например

#sourcecode(```sh
docker compose up my_container1
```)

#pagebreak()

= Выполнение работы

== Веб-сервер `Apache` с бэкендом на `PHP` и базой данных `MySQL`

Объединим пункты задания 1 и 2 вместе. Создадим проект со следующей структурой:

#figure(
  image("img/1-2-structure.png"),
  caption: [Структура проекта]
)

Выведем содержимое всех файлов по порядку:

`./apache/Dockerfile`:

#let dockerfile = raw(read("web-server/apache/Dockerfile"), lang: "dockerfile")
#sourcecode(dockerfile)

`./apache/spa/create.php`:

#let create = raw(read("web-server/apache/spa/create.php"), lang: "php")
#sourcecode(create)

`./apache/spa/get.php`:

#let get = raw(read("web-server/apache/spa/get.php"), lang: "php")
#sourcecode(get)

`./apache/spa/index.html`:

#let index = raw(read("web-server/apache/spa/index.html"), lang: "html")
#sourcecode(index)

`./apache/spa/users.php`:

#let users = raw(read("web-server/apache/spa/users.php"), lang: "php")
#sourcecode(users)

`./db/init.sql`:

#let init = raw(read("web-server/db/init.sql"), lang: "sql")
#sourcecode(init)

`./docker-compose.yaml`:

#let compose = raw(read("web-server/docker-compose.yaml"), lang: "yaml")
#sourcecode(compose)

Выполним из корневой директории команду для сборки и запуска контейнеров

#figure(
  image("img/1-2-compose-build-up.png")
)

Откроем стартовую страницу по адресу `http://localhost:8081/`. Введем данные тестового пользователя и наждем на кнопку #ui-action[Добавить пользователя]

#figure(
  image("img/1-2-home-page.png")
)

Нажмем на ссылку #text(fill: blue, underline[Существующие пользователи]). На открывшейся странице в сгенерированной HTML-таблице выведется созданный нами пользователь

#figure(
  image("img/1-2-users-list.png")
)

#pagebreak()

== Упаковка в контейнер собственного приложения <api>

#box(image("img/github-logo.png"), height: 9pt) #link("https://github.com/RealityBelka/BACKEND/tree/master/api")[Ссылка на репозиторий Github]

Ниже приведен пример Dockerfile для приложения, написанного на языке програмирования Go. 

#sourcecode(
  ```dockerfile
  FROM golang:latest

  WORKDIR /app

  COPY go.mod go.sum ./

  RUN go mod download

  COPY . .

  WORKDIR /app/cmd/

  RUN go build -o main main.go

  WORKDIR /app

  ENTRYPOINT [ "./cmd/main" ]
  ```
)

#pagebreak()

== Пример практически полезного контейнера

#let useful = raw(read("useful.Dockerfile"), lang: "dockerfile")
#sourcecode(useful)

#pagebreak()

== Задание на последующую практическую работу

Возьмем за основу уже существующий проект (#box(image("img/github-logo.png"), height: 9pt) #link("https://github.com/RealityBelka/BACKEND/tree/master")[ссылка на Github]). Приведем `docker-compose.yaml` файл данного проекта.

#sourcecode(
  ```yaml
  services:
    api:
      container_name: biometry_api
      build:
        context: ./api
        dockerfile: ./build/app.Dockerfile
      depends_on:
        db:
          condition: service_healthy
      ports:
        - "8080:8080"

    db:
      container_name: biometry_db
      build: 
        context: ./api
        dockerfile: ./build/db.Dockerfile
      environment:
        - POSTGRES_PORT=${DB_PORT}
        - POSTGRES_USER=${DB_USER}
        - POSTGRES_PASSWORD=${DB_PASSWORD}
        - POSTGRES_DB=${DB_NAME}
      healthcheck:
        test: ["CMD-SHELL", "pg_isready -U ${DB_USER} -d ${DB_NAME}"]
        interval: 10s
        timeout: 5s
        retries: 5
      ports:
        - "${DB_PORT}:5432"
      volumes:
        - pgdata:/var/lib/postgresql/data

    processing:
      container_name: biometry_ml
      build:
        context: ./processing
        dockerfile: ./Dockerfile
      depends_on:
        db:
          condition: service_healthy

    nats:
      container_name: biometry_broker
      command: -m 8222
      image: nats
      environment:
        - NATS_PORT=${NATS_PORT}
      ports:
        - "${NATS_PORT}:4222"
        - "6222:6222"
        - "8222:8222"
      depends_on:
        db:
          condition: service_healthy


  volumes:
    pgdata:
  ```
)

В данном приложении развертываются 4 контейнера, а именно:

#list(
  [*api:* #link(<api>)[вышеописанный] HTTP API на языке программирования Go],
  [*nats:* брокер сообщений NATS;],
  [*processing:* модели для анализа фото и аудио на языке программирования Python;],
  [*db:* база данных PostgreSQL.]
)
