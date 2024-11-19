#let body = {
  import "../assets/intro.typ": intro
  
  import "@preview/codelst:2.0.1": *

  outline(
    title: [Оглавление]
  )

  set page(numbering: "1")
  set figure.caption(separator: [ -- ])
  set figure(supplement: [Рисунок])

  pagebreak()

  intro(
    [получить навыки по запуску Linux-приложений в
Windows 10, а также запуску Windows-приложений из ОС Linux.],
    [
      Ознакомиться и выполнить команды в командной строке Windows 10. Для выполнения работы понадобится командный интерпретатор `cmd`.
  После запуска cmd с помощью команды cd переместиться в удобный каталог для работы (там, где удобнее хранить временные файлы, например,
  `c:\temp`, например, `cd c:\temp`). Все выполняемые команды проверить на
  работоспособность и привести в отчете. В `cmd` работает поиск по
  комбинации `CTRL-F`.

  Команда `curl`:

  #enum(
    [
      Проверить версию команды curl: `curl --version`
    ],
    [
      Открыть 10 URL различных ресурсов и ознакомиться с полученными данными. Например, `curl mail.ru`, `curl rambler.ru`, `curl google.com`.
    ],
    [
      Осуществить загрузку файла с помощью команды curl с оригинальным именем, опция `-O`. 
      Скачать одной командой 3 файла с опцией `-О`.
    ],
    [
      Осуществить загрузку с 3 ftp-серверов (например, производителей
      компьютерного оборудования HP, Asus, MSI, Lenovo, Dell) файлы
      (например, драйверы)
      Например,
      `curl -O ftp://ftp.hp.com:21/pub/softpaq/sp40001/sp40001.cva`. Возможно, для ftp потребуется указывать логин, пароль
      Например,
      `curl -u anonymous:anonymous -O ftp://yourftpserver/yourfile.tar.gz`. `anonymous` – стандартный логин и пароль для анонимного входа на ftp-сервер
      ],
      [
        Осуществить загрузку файла с помощью команды curl и сохраните файл
под другим именем, опция -o. Скачайте три файла с опцией -o для
сохранения файлов с определенным именем
      ],[Сохранить какое-либо изображение используя опцию -OL
Сохраните 3 изображения используя опцию -OL (можно сохранить каждое
изображение по отдельности)
      ],[Посмотреть для 5 URL какие файлы cookie загружаются на компьютер
Например,
`curl --cookie-jar cnncookies.txt https://www.cnn.com/index.html -O`
Просмотреть сформированные cookie файлы можно с помощью команды
`type`
Например,
`type cnncookies.txt`
      ],[Выполнить команду `curl` с опцией `-L`. Сравнить вывод без этой опции.
Объяснить полученный результат вывода
Например,
`curl -L google.com`
      ],[Получить заголовки сайтов 10 URL командой `curl`, опция `-I`],[Составить (а при наличии тестового сервера и отправить) POST-запросы
используя команду curl, в виде списка имя=значение, и в виде JSON, для 3
URL, опция -d
Например,
`curl -d "param1=test1&param2=test2" http://test.com` (ключ=значение)
`curl -d '{"param1":"test1","param2":"test2"}' \http://www.test.com` (JSON)
      ],[Использовать авторизацию для 3 URL, опция `-u`
Например,
`curl -u <user:password> https://testurl.com/entry`
      ]
    ) 
    ]
  )

  [= Теоретическое введение]

  [#h(1.25cm) `curl` (Client URL) — это командная утилита для передачи данных с или на сервер, поддерживающая множество различных протоколов, включая HTTP, HTTPS, FTP, SCP, SFTP и другие. Программа широко используется для автоматизации и тестирования сетевых запросов, так как позволяет легко взаимодействовать с веб-ресурсами. Она может выполнять различные действия, такие как загрузка файлов, отправка данных, управление заголовками HTTP и работа с куками.

Синтаксис `curl` позволяет задавать URL-адрес и ряд параметров для настройки запроса. Например, флаг `-X` используется для указания типа запроса (GET, POST, DELETE и др.), флаг `-d` позволяет отправлять данные в запросе, а флаг `-o` задает имя файла, в который будет сохранен результат. С `curl` можно также управлять аутентификацией, сессиями через cookie, передачей заголовков и загружать/отправлять файлы, что делает его мощным инструментом для взаимодействия с API и тестирования сетевых приложений.#pagebreak()]

  [= Выполнение работы]

  [
    #enum(
      [
        #figure(
          image("img/curl_ver.png"),
          caption: [`curl -V`]
        )
      ],
      [
        #set par(justify: false)

        #figure(
          [
            #image("img/req_1.png")
            #image("img/req_2.png")
            #image("img/req_3.png")
          ],
          caption: [`curl` запросы]
        )

        Для дальнейших запросов результат аналогичный
      ],
      [
        #figure(
          [
            #image("img/download_1.png")
            #image("img/download_2.png")
          ],
          caption: [`curl -O`]
        )
      ],
      [
        ```
        curl -O ftp://download.lenovo.com/consumer/mobiles/BIOS_EXE_Ideapad_Z400_Z500_Y400_Y500_74CN47WW_64.exe
        ```
        ```
        curl -O ftp://ftp.dell.com/FOLDER00123456M/1/driverfile.exe
        ```
        ```
        curl -O ftp://ftp.acer-euro.com/notebook/aspire_5315/driver/Broadcom_vista_PCI_eLAN_v8.48.0.0.zip
        ```

        #figure(
          image("img/download_1.png"),
          caption: [`curl -o`]
        )
      ],
      [
        #figure(
          image("img/download_custom.png"),
          caption: [`curl -o`]
        )
      ],
      [
        #figure(
          image("img/download_images.png"),
          caption: [`curl -OL`]
        )
      ],
      [
        #figure(
          [
            #image("img/cookies_1.png")
            #image("img/cookies_2.png")
          ],
          caption: [`curl --cookie-jar`]
        )

        #figure(
          [
            #image("img/cookies_1_output.png")
            #image("img/cookies_2_output.png")
          ],
          caption: [Файлы с данными `cookies`]
        )
      ],
      [
        #figure(
          image("img/l_flag.png"),
          caption: [`curl -L`]
        )
      ],
      [
        #figure(
          image("img/header.png"),
          caption: [`curl -I`]
        )

        Для остальных запросов результат аналогичный
      ],
      [
        #figure(
          image("img/post.png"),
          caption: [`curl -d`]
        )
      ],
      [
        #figure(
          image("img/auth.png"),
          caption: [`curl -u`]
        )
      ],
      [
        #figure(
          image("img/redirect.png"),
          caption: [`curl --resolve`]
        )
      ],
      [
        #figure(
          image("img/time_total.png"),
          caption: [`curl -w`]
        )
      ],
      [
        #figure(
          image("img/browser.png"),
          caption: [`curl -A`]
        )
      ],
      [
        #figure(
          image("img/cookies_send.png"),
          caption: [`curl -b`]
        )
      ],
      [
        #figure(
          image("img/diff.png"),
          caption: [`curl -o + diff`]
        )
      ],
      [
        #set par(first-line-indent: 0cm)
        *Опция `--limit-rate`*. Эта опция позволяет ограничить скорость загрузки.

        `curl --limit-rate 100K -O https://www.example.com/largefile.zip`

        *Опция `--retry`*.
        Эта опция позволяет задать количество попыток повторной загрузки в случае ошибки.

        `curl --retry 3 -O https://www.example.com/somefile.zip`

        *Опция `--max-time`*. Эта опция задает максимальное время выполнения команды в секундах.

        `curl --max-time 10 -O https://www.example.com/largefile.zip`

        *Опция `-e` (или `--referer`)*. Эта опция позволяет передать заголовок `Referer`, что может быть необходимо для некоторых серверов.
        
        `curl -e https://www.google.com -O https://www.example.com/somefile.zip`

        *Опция `-C` (или `--continue-at`)*. Эта опция позволяет продолжить прерванную загрузку файла.

        `curl -C -O https://www.example.com/largefile.zip`
      ]
    )
  ]
}
