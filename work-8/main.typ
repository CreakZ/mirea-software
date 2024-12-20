#import "../assets/title_page.typ": title_page_me

#set text(font: "New Computer Modern", size: 14pt)
#set page(margin: 2cm)
#set heading(numbering: "1.")

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

*Цель работы:* получить навыки сборки
Docker-контейнера
с использованием Docker-compose.


*Задание:*
#enum(
  [Развернуть docker-контейнер с Jenkins на cloud-хостинге.
Объяснить,
для
чего
предназначен
Jenkins.
Продемонстрировать пример применения Jenkins-контейнера
на cloud-хостинге. Проект назвать docker_jenkins. _Обязательно
продемонстрировать на компьютере выполненную работу при
обсуждении с преподавателем отчёта практической работы._],
[Развернуть docker-контейнер с Maven на cloud-хостинге.
Объяснить,
для
чего
предназначен
Maven.
Продемонстрировать пример применения Maven-контейнера
на cloud-хостинге. Проект назвать docker_maven. _Обязательно
продемонстрировать на компьютере выполненную работу при
обсуждении с преподавателем отчёта практической работы._],
[Развернуть docker-контейнер с CMS Drupal на cloud-хостинге.
Объяснить,
для
чего
предназначен
Drupal.
Продемонстрировать пример применения Drupal-контейнера
на cloud-хостинге. Проект назвать docker_drupal. _Обязательно
продемонстрировать на компьютере выполненную работу при
обсуждении с преподавателем отчёта практической работы._], [Развернуть docker-контейнер с СУБД Couchbase на cloud-
хостинге. Объяснить, для чего предназначен Couchbase.
Продемонстрировать пример применения Couchbase-контейнера на cloud-хостинге. 
Проект
назвать docker_couchbase. _Обязательно 
продемонстрировать на компьютере выполненную
работу
при
обсуждении
с
преподавателем отчёта практической работы._],
[Развернуть docker-контейнер с Node.js на cloud-хостинге.
Объяснить,
для
чего
предназначен
Node.js.
Продемонстрировать пример применения Node.js-контейнера
на cloud-хостинге. Проект назвать docker_nodejs. _Обязательно
продемонстрировать на компьютере выполненную работу при
обсуждении с преподавателем отчёта практической работы._]
)

#pagebreak()

= Выполнение работы

Для развертывания контейнеров воспользуемся провайдеров облачных услуг Selectel. Перейдем на сайт Selectel и перейдем в панель управления

#figure(
  image("img/selectel_pannel.png", width: 60%)
)

Приобретем и запустим сервер с конфигурацией 1 ядро CPU, 1 ГБ оперативной памяти и 10 ГБ SSD. Для успешного подключения к облачному серверу перейдем в меню "Порты", чтобы узнать публичный IP-адрес сервера.

#figure(
  image("img/selectel_cfg.png")
)

#pagebreak()

Осуществим подключение к серверу по SSH. Для успешного подключения нам так же потребуется пароль, выдаваемый провайдером облачных услуг.

#figure(
  image("img/conn_remtoe.png")
)

#pagebreak()

== `docker_jenkins`

Приведем структуру Jenkins-проекта.

#figure(
  image("img/struct_1.png")
)

Результат выполнения пайплайна Jenkins будет выводиться в качестве JSON-ответа сервера, написанного на Python.

Произведем запуск контейнера на облачном сервере и перейдем по ссылке #link("http://45.89.26.113:5000/")

#figure(
  image("img/jenkins.png")
)

Как видно из полученного ответа, контейнер успешно запущен и работает.

#pagebreak()

== `docker_maven`

Приведем структуру Maven-проекта.

#figure(
  image("img/struct_2.png")
)

Сервер, написанный на Spring Boot, будет выдавать обычное текстовое приветствие.

Произведем запуск контейнера с приложением на облачном сервере и перейдем по ссылке #link("http://45.89.26.113:8080/")

#figure(
  image("img/maven.png")
)

Как видно из полученного ответа, контейнер успешно запущен и работает.

#pagebreak()

== `docker_drupal`

Приведем структуру CMS Drupal проекта.

#figure(
  image("img/struct_3.png")
)

Запускаемый проект — это сайт на CMS (_Content Management System_, Система управления контентом) Drupal, работающий на веб-сервере с подключением к базе данных MariaDB.

Произведем запуск контейнера с приложением на облачном сервере и перейдем по ссылке #link("http://45.89.26.113:8080/")

#figure(
  image("img/drupal.png")
)

Как видно из полученного ответа, контейнер успешно запущен и работает.

#pagebreak()

== `docker_couchbase`

Приведем структуру Couchbase-проекта.

#figure(
  image("img/struct_4.png")
)

Проект представляет собой NoSQL базу данных Couchbase, а так же простой скрипт на Python для взаимодействия с базой данных. 

Произведем запуск контейнера с приложением на облачном сервере и перейдем по ссылке #link("http://45.89.26.113:8091/")

#figure(
  image("img/couchbase.png")
)

Как видно из полученного ответа, контейнер успешно запущен и работает.

#pagebreak()

== `docker_nodejs`

Приведем структуру Node.js-проекта.

#figure(
  image("img/struct_5.png")
)

Запускаемый проект -- веб-сервер на Node.js, выводящий приветственное сообщение и текущую дату при GET-запросе на хендлер `/`.


Произведем запуск контейнера с приложением на облачном сервере и перейдем по ссылке #link("http://45.89.26.113:8091/")

#figure(
  image("img/nodejs.png")
)

Как видно из полученного ответа, контейнер успешно запущен и работает.
