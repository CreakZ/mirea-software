#import "../assets/title_page.typ": title_page_me

#set text(font: "New Computer Modern", size: 14pt)
#set page(margin: 2cm)
#set heading(numbering: "1.")
#set figure(supplement: [Рис.])
#set figure.caption(separator: [ -- ])


#show heading: it => align(center, it)
#show link: it => underline(it)

#import "@preview/codelst:2.0.2": sourcecode

#title_page_me(
  8,
  [Развертывание docker-контейнеров на cloud-сервере]
)

#outline(
  title: [Оглавление]
)

#pagebreak()

#set par(justify: true)
#set page(numbering: "1")

= Введение

*Цель работы:* получить навыки создания сетевого соединения и
передачи данных между docker-контейнерами посредством localhost.


*Задание:*
Создать два Docker-контейнера, которые будут одновременно
"слушать" `localhost` на разных портах. Пользователь делает запрос к
контейнеру №1. Далее контейнер №1 делает запрос к контейнеру №2.
Контейнер №2 обработает запрос, передаст результат контейнеру №1.
Контейнер №1 передаст результат пользователю. API может быть
реализовано на любой технологии. В итоге необходимо настроить систему
из нескольких контейнеров, связанных друг с другом.

Описанная логика взаимодействия представлена в виде схемы:

#figure(
  image("img/example.png"),
  caption: [Схема взаимодействия пользователя и контейнеров]
)

#pagebreak()

= Выполнение работы

Создадим проект со следующей структурой:

#figure(
  image("img/struct.png", width: 50%)
)

Для организации межконтейнерного взаимодействия используем API на Golang (`cont-1`, фреймворк `Gin`) и Rust (`cont-2`, фреймворк `actix-web`).

Приведем код наиболее важных файлов (опустим файлы `go.*` и `Cargo.*`).

`cont-1/main.go`

#let main_go = raw(read("cont-1/main.go"), lang: "go")
#sourcecode(main_go)

`cont-1/Dockerfile`

#let dockerfile_go = raw(read("cont-1/Dockerfile"), lang: "Dockerfile")
#sourcecode(dockerfile_go)

`cont-1/handlers/handlers.go`

#let handlers = raw(read("cont-1/handlers/handlers.go"), lang: "go")
#sourcecode(handlers)

`cont-2/src/main.rs`

#let main_rs = raw(read("cont-2/src/main.rs"), lang: "rs")
#sourcecode(main_rs)

`cont-2/Dockerfile`

#let dockerfile_rs = raw(read("cont-2/Dockerfile"), lang: "Dockerfile")
#sourcecode(dockerfile_rs)

Произведем запуск контейнеров из корня проекта при помощи команды

#sourcecode(```sh
docker compose up --build
```)

Дождемся сборки и запуска контейнеров, после чего перейдем по адресу #link("http://localhost:8080/greet")

#figure(
  image("img/8080.png", width: 80%)
)

Как видно на рисунке, сервер внутри контейнера №1 принимает входящий GET-запрос, успешно обрабатывает ответ от сервера внутри контейнера №2 и отправляет ответ пользователю.

Для большей уверенности перейдем по ссылке #link("http://localhost:8081/greet")

#figure(
  image("img/8081.png", width: 80%)
)

Видно, что сервер внутри контейнера №2 так же успешно принимает и обрабатывает запросы пользователя.
