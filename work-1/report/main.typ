#import "../../assets/title_page.typ": *
#import "../../assets/functions.typ": *

#import "@preview/codelst:2.0.1": sourcecode

#set page(margin: 2cm)
#set text(size: 14pt, font: "New Computer Modern")
#set heading(numbering: "1.")

#show heading: it => {align(center, it)}
#show link: underline

#title_page(
  1,
  [Установка приложения по работе с контейнерами Docker],
  [ИКБО-13-23], 
  [Русаков М.Ю.], 
  [Благирев М.М.]
)

#align(center, text(16pt, [*Оглавление*]))

#outline(
  title: none
)

#set par(first-line-indent: 1.25cm, justify: true)

#pagebreak()

#set page(numbering: "1")

= Введение

#h(1.25cm) *Цель работы:* получить навыки по развертыванию приложения при помощи Docker.

#task_text([
  установить Docker. Запустить Docker Dashboard. Разобраться с функционалом Docker Dashboard, ознакомившись с #link("https://docs.docker.com/desktop/dashboard/"). Для установки и запуска контейнеров Docker в OC Windows запустить `cmd` и выполнить команду `docker run <имя_контейнера>`. Например, `docker run redis`. Таким образом, в данном случае будет установлена СУБД redis. Далее перейти в Docker Dashboard, найти установленный и запущенный контейнер (в нашем случае `redis`) выбрать его и найти кнопку CLI. Ознакомиться с операциями, производимыми в консоли Docker и выполнить следующие действия: 
  #enum(
    [Обратиться по адресу https://hub.docker.com/ и ознакомиться с приложениями доступными для работы с Docker.],
    [Установить контейнер СУБД redis. Используя CLI контейнера, запустить клиент redis-cli.], 
    [Ознакомиться с документацией по командам redis. Документация на СУБД #link("https://redis.io/commands")],
    [В redis выполнить команды SET https://redis.io/commands/set и GET #link("https://redis.io/commands/get"). Создать 5 ключей со значениями с помощью SET и прочитать ключи со значениями с помощью GET.],
    [Получение значения по ключу и его замена на новое.],
    [Добавление строки к уже существующему значению.],
    [Добавление числа и изменение его значения.],
    [Создание ключа со значением типа хеш-таблица.],
    [Работа с множествами. Задействовать команды SADD, SDIFF, SMOVE, SPOP, SUNION, SREM],
    [Работа с упорядоченными наборами. Задействовать команды ZADD, ZCOUNT, ZDIFF, ZPOPMAX, ZPOPMIN, ZUNION, ZMSCORE, ZLEXCOUNT],
    [Из документации выбрать любые не использовавшиеся ранее 5 команд и задействовать их в работе.]
  )
])

#pagebreak()

= Теоретическое введение

#h(indent) Docker -- это платформа для разработки, доставки и запуска приложений в контейнерах, которая получила широкое распространение благодаря своей гибкости и эффективности. Контейнеры позволяют изолировать приложения вместе со всеми необходимыми зависимостями, что делает их портативными и независимыми от инфраструктуры, на которой они работают. Основной идеей Docker является упаковка приложения и его окружения в единый образ, который может быть развернут на любом сервере или компьютере с установленной Docker-платформой.

Историческая справка и архитектура Docker
Концепция контейнеров не нова и возникла ещё в начале 2000-х годов, когда различные операционные системы, включая Unix и Linux, начали поддерживать технологии изоляции процессов и управления ресурсами (например, `chroot`, `LXC`). Однако Docker значительно упростил работу с контейнерами, сделав процесс упаковки, распространения и запуска приложений в контейнерах доступным широкому кругу разработчиков.

Docker состоит из следующих ключевых компонентов:

#list(
  [Docker Engine — это основное программное обеспечение, обеспечивающее создание и выполнение контейнеров. Оно взаимодействует с ядром операционной системы для управления контейнерами;],
  [Docker Hub — это облачный репозиторий, в котором хранятся образы контейнеров. Пользователи могут загружать свои образы или использовать готовые публичные образы для развертывания приложений;],
  [Docker Compose — утилита для определения и запуска многоконтейнерных приложений. С помощью файла `docker-compose.yml` можно описать, как несколько контейнеров должны взаимодействовать друг с другом.]
)

#pagebreak()

= Выполнение работы

#let text = raw("../src/main.sh")

#h(indent) Работа выполнена на операционной системе #link("https://fedoraproject.org/workstation/")[Fedora Linux 40].

1-2. Ознакомившись с приложениями, доступными для работы с Docker, выполним команду для запуска контейнера на основании открытого изображения СУБД Redis:

#sourcecode(
  ```sh
  docker run redis
  ```
)

#h(indent) Выполним команду 

#sourcecode(
  ```sh
  docker ps -a
  ```
)

#h(indent) для вывода информации о всех существующих на компьютере контейнерах. Скопируем поле `CONTAINER ID` нужного контейнера и выполним следующую команду: 

#sourcecode(
  ```sh
  docker exec -it <CONTAINER ID> sh
  ```
)

#h(indent) Данная команда создаст интерактивный терминал `shell` для выполнения команд внутри контейнера с указанным `CONTAINER ID`. Запустим внутри контейнера клиент Redis при помощи команды 

#sourcecode(
  ```sh
  redis-cli
  ```
)

#h(indent) 3-4. Ознакомившись с документацией по командам Redis, создадим 5 ключей со значениями при помощи команды `SET`:

#sourcecode(
  ```sh
  SET key_1 val_1
  OK
  SET key_2 val_2
  OK
  SET key_3 val_3
  OK
  SET key_4 val_4
  OK
  SET key_5 val_5
  OK
  ```
)

#h(indent) а затем получим значения по созданным ключам при помощи команды `GET`:

#sourcecode(
  ```sh
  GET key_1
  "val_1"
  GET key_2
  "val_2"
  GET key_3
  "val_3"
  GET key_4
  "val_4"
  GET key_5
  "val_5"
  ```
)

#h(indent) 5. Изменим значение по ключу `key_5`:

#sourcecode(
  ```sh
  SET key_5 new_val_5
  OK
  ```
)

#h(indent) Проверим, что значение по ключу `key_5` действительно поменялось:

#sourcecode(
  ```sh
  GET key_5
  "new_key_5"
  ```
)

#h(indent) 6. Создадим ключ `key_6` со значением `con` и добавим к значению `con` строку `catenate`:

#sourcecode(
  ```sh
  SET key_6 con
  OK
  APPEND key_6 
  (integer) 11
  ```
)

#h(indent) Проверим, что значение по ключу `key_6` действительно поменялось:

#sourcecode(
  ```sh
  GET key_6
  "concatenate"
  ```
)

#h(indent) 7. Создадим ключ `int_1` со значением `0` (число 0):

#sourcecode(
  ```sh
  SET int_1 0
  OK
  ```
)

#h(indent) Изменим значение числа, добавив к нему 34:

#sourcecode(
  ```sh
  INCRBY int_1 34
  (integer) 34
  ```
)

#h(indent) 8. Создадим ключ `map` со значением типа #quote_wrap([хеш-таблица]). В хеш-таблицу добавим единственную пару `ключ:значение` -- `butca:vkontakte`:

#sourcecode(
  ```sh
  HSET map butca vkontakte
  (integer) 1
  ```
)

#h(indent) 9. Создадим множество `nums_1` со значениями `3 4 6 9` и множество `nums_2` со значениями `4 2 0`:

#sourcecode(
  ```sh
  SADD nums_1 3 4 6 9
  (integer) 4
  SADD nums_2 4 2 0
  (integer) 3
  ```
)

#h(indent) Далее выполним следующие команды: 
#enum(
  numbering: "a.",
  [
    `SDIFF` (вывод $quote.angle.l.double$разницы$quote.angle.r.double$ множеств)

    #sourcecode(
      ```sh
      SDIFF nums_1 nums_2
      1) "3"
      2) "6"
      3) "9"
      ```
    )
  ],

  [
    `SMOVE` (перемещение элемента из одного множества в другое)

    #sourcecode(
      ```sh
      SMOVE nums_1 nums_2 3
      (integer) 1
      ```
    )
  ],

  [
    `SPOP` (удаление `count` случайных чисел из указанного множества)

    #sourcecode(
      ```sh
      SPOP nums_2 3
      1) "2"
      2) "3"
      3) "0"
      ```
    )
  ],

  [
    `SUNION` (объединение указанных множеств)

    #sourcecode(
      ```sh
      SUNION nums_1 nums_2
      1) "4"
      2) "6"
      3) "9"
      ```
    )
  ],

  [
    `SREM` (удаление элемента(-ов) из множества)

    #sourcecode(
      ```sh
      SREM nums_1 4
      (integer) 1
      ```
    )
  ]
)

#h(indent) 10. Создадим 2 упорядоченных набора `zset_1` и `zset_2`:

#sourcecode(
  ```sh
  ZADD zset_1 0 "" 1 "a" 2 "ab" 5 "abcde"
  (integer) 4
  ZADD zset_2 2 "ab" 3 "abc" 6 "abcdef"
  (integer) 3
  ```
)

#h(indent) Далее выполним следующие команды:
#enum(
  numbering: "a.",
  [
    `ZCOUNT` (подсчет числа таких элементов $x_i$, что $"score"_i$ $in [min;max]$)

    #sourcecode( 
      ```sh
      ZCOUNT zset_1 2 1 2
      (integer) 2
      ```
    )
  ],
  [
    `ZDIFF` (вывод неповторяющихся элементов)

    #sourcecode(
      ```sh
      ZDIFF 2 zset_1 zset_2
      1) ""
      2) "a"
      3) "abcde"
      ```
    )
  ],
  [
    `ZPOPMAX` (удаление элемента с наибольшим `score`)

    #sourcecode(
      ```sh
      ZPOPMAX zset_1
      1) "abcde"
      2) "5"
      ```
    )
  ],
  [
    `ZPOPMIN` (удаление элемента с наименьшим `score`)

    #sourcecode(
      ```sh
      ZPOPMIN zset_2
      1) "ab"
      2) "2"
      ```
    )
  ],
  [
    `ZUNION` (вывод результата объединения двух наборов)

    #sourcecode(
      ```sh
      ZUNION 2 zset_1 zset_2
      1) ""
      2) "a"
      3) "ab"
      4) "abc"
      5) "abcdef"
      ```
    )
  ],
  [
    `ZMSCORE` (вывод значения `score` конкретного элемента)
    
    #sourcecode(
      ```sh
      ZMSCORE zset_1 "a"
      1) "1"
      ```
    )
  ],
  [
    `ZLEXCOUNT` (подсчет числа лексиграфически отсортированных элементов)

    #sourcecode(
      ```sh
      # в данном случае считаются числа, начинающиеся на буквы из полуинтервала [a;c)
      ZLEXCOUNT zset_2 [a (c 
      (integer) 2
      ```
    )
  ]
)

#h(indent) 11. Задействуем 5 следующих команд:
#enum(
  numbering: "a.",
  [
    `DBSIZE` (подсчёт числа ключей в текущей базе данных)

    #sourcecode(
      ```sh
      DBSIZE
      (integer) 12
      ```
    )
  ],[
    `FLUSHDB` (очистка текущей базы данных от всех ключей)

    #sourcecode(
      ```sh
      FLUSHDB
      OK
      ```
    )
  ],
  [
    `GEOADD` (добавление геопространственных данных о некотором объекте)

    #sourcecode(
      ```sh
      GEOADD cities 37.616 55.75 Moscow
      (integer) 1
      GEOADD cities 30.314 59.94 Saint-Petersburg
      (integer) 1
      ```
    )
  ],
  [
    `GEODIST` (вывод расстояния между двумя объектами)

    #sourcecode(
      ```sh
      GEODIST cities Moscow Saint-Petersburg
      "634928.2597"
      ```
    )
  ],
  [
    `MULTI` и `EXEC` (начало и завершение транзакции)

    #sourcecode(
      ```sh
      MULTI
      OK
      SET some key
      QUEUED
      ZADD zset_3 1 "b" 3 "abc"
      QUEUED
      get some
      QUEUED
      EXEC
      1) OK
      2) (integer) 2
      3) "key"
      ```
    )
  ],
)

#pagebreak()

= Выводы

#h(indent) В результате выполнения работы были получены базовые навыки по работе с контейнерами Docker.   