#import "../assets/title_page.typ": title_page_me

#set text(font: "New Computer Modern", size: 14pt)
#set page(margin: 2cm)
#set heading(numbering: "1.")

#show heading: it => align(center, it)

#import "@preview/codelst:2.0.2": sourcecode

#title_page_me(
  7,
  [Создание контейнера с веб сервером Nginx в Docker]
)

#outline(
  title: [Оглавление]
)

#pagebreak()

#set par(justify: true)
#set page(numbering: "1")

= Введение

*Цель работы:* получить навыки сборки Docker-контейнера с использованием Docker-compose.

*Задание:*
#enum(
  [Повторить пример, который был рассмотрен в разделе «Общие
сведения».
Проект
назвать
`docker_py`.
Обязательно
продемонстрировать сервис при обсуждении с преподавателем
отчёта практической работы.],
[Создать аналогичный сервис как в примере, рассмотренном в
разделе
«Общие
сведения»,
но
вместо
языка
Python
использовать язык JavaScript. Проект назвать `docker_js`.
Обязательно продемонстрировать сервис при обсуждении с
преподавателем отчёта практической работы.],
[Создать сервис как в примере, рассмотренном в разделе
«Общие сведения», но вместо сервера на Python использовать
веб сервер Apache. Проект назвать `docker_apache`. Обязательно
продемонстрировать сервис при обсуждении с преподавателем
отчёта практической работы.], [Создать сервис как в примере, рассмотренном в разделе
«Общие сведения», но вместо сервера на Python использовать
веб сервер Nginx. Проект назвать `docker_nginx`. Обязательно
продемонстрировать сервис при обсуждении с преподавателем
отчёта практической работы.],
[Создать сервис в состав которого входят следующие
компоненты apache, mysql, phpMyAdmin. Проект назвать
`docker_phpmyadmin`. Обязательно продемонстрировать сервис
при обсуждении с преподавателем отчёта практической
работы.]
)

#pagebreak()

= Выполнение работы

== `docker_py`

Опустим повторение самой работы, приведем только структуру полученного проекта.

#figure(
  image("img/struct_1.png")
)

#pagebreak()

== `docker_js`

Приведем структуру созданного проекта

#figure(
  image("img/struct_2.png")
)

#let server_js = raw(read("docker_js/server/server.js"), lang: "js")
#let dockerfile_js_1 = raw(read("docker_js/server/Dockerfile"), lang: "Dockerfile")
#let index_js_1 = raw(read("docker_js/server/index.html"), lang: "html")

#let client_js = raw(read("docker_js/client/client.js"), lang: "js")
#let dockerfile_js_2 = raw(read("docker_js/client/Dockerfile"), lang: "Dockerfile")
#let index_js_2 = raw(read("docker_js/client/index.html"), lang: "html")

#let compose_js = raw(read("docker_js/docker-compose.yaml"), lang: "yaml")

`docker_js/server/server.js`:
#sourcecode(server_js)

`docker_js/server/Dockerfile`:
#sourcecode(dockerfile_js_1)

`docker_js/server/index.html`:
#sourcecode(index_js_1)

`docker_js/client/client.js`:
#sourcecode(client_js)

`docker_js/client/Dockerfile`:
#sourcecode(dockerfile_js_2)

`docker_js/client/index.html`:
#sourcecode(index_js_2)

`docker_js/docker-compose.yaml`:
#sourcecode(compose_js)

#pagebreak()

== `docker_apache`

Приведем структуру созданного проекта

#figure(
  image("img/struct_3.png")
)

#let dockerfile_apache_1 = raw(read("docker_apache/server/Dockerfile"), lang: "Dockerfile")
#let index_apache = raw(read("docker_apache/server/index.html"), lang: "html")

#let client_apache = raw(read("docker_apache/client/client.sh"), lang: "sh")
#let dockerfile_apache_2 = raw(read("docker_apache/client/Dockerfile"), lang: "Dockerfile")

#let compose_apache = raw(read("docker_apache/docker-compose.yaml"), lang: "yaml")

`docker_apache/server/index.html`:
#sourcecode(index_apache)

`docker_apache/server/Dockerfile`:
#sourcecode(dockerfile_apache_1)

`docker_apache/client/client.sh`:
#sourcecode(client_apache)

`docker_apache/client/Dockerfile`:
#sourcecode(dockerfile_apache_2)

`docker_apache/docker-compose.yaml`:
#sourcecode(compose_apache)

#pagebreak()

== `docker_nginx`

Приведем структуру созданного проекта

#figure(
  image("img/struct_4.png")
)

#let client_nginx = raw(read("docker_nginx/client/client.sh"), lang: "sh")
#let dockerfile_nginx_1 = raw(read("docker_nginx/client/Dockerfile"), lang: "Dockerfile")

#let index_nginx = raw(read("docker_nginx/server/index.html"), lang: "html")
#let conf_nginx = raw(read("docker_nginx/server/nginx.conf"))
#let dockerfile_nginx_2 = raw(read("docker_nginx/server/Dockerfile"), lang: "Dockerfile")

#let compose_nginx = raw(read("docker_nginx/docker-compose.yaml"), lang: "yaml")

`docker_nginx/client/client.sh`:
#sourcecode(client_nginx)

`docker_nginx/client/Dockerfile`:
#sourcecode(dockerfile_nginx_1)

`docker_nginx/server/index.html`:
#sourcecode(index_nginx)

`docker_nginx/server/nginx.conf`:
#sourcecode(conf_nginx)

`docker_nginx/server/Dockerfile`:
#sourcecode(dockerfile_nginx_2)

`docker_nginx/docker-compose.yaml`:
#sourcecode(compose_nginx)

#pagebreak()

== `docker_phpmyadmin`

Приведем структуру созданного проекта

#figure(
  image("img/struct_5.png")
)

#let compose_php = raw(read("docker_phpmyadmin/docker-compose.yaml"), lang: "yaml")
#let dockerfile_php = raw(read("docker_phpmyadmin/apache/Dockerfile"), lang: "Dockerfile")
#let index_php = raw(read("docker_phpmyadmin/apache/index.html"), lang: "html")
#let conf_php = raw(read("docker_phpmyadmin/mysql/my.cnf"))

`docker_phpmyadmin/docker-compose.yaml`:
#sourcecode(compose_php)

`docker_phpmyadmin/apache/Dockerfile`:
#sourcecode(dockerfile_php)

`docker_phpmyadmin/apache/index.html`:
#sourcecode(index_php)

`docker_phpmyadmin/mysql/my.cnf`:
#sourcecode(conf_php)
