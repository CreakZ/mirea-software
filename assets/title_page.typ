#let title_page(
  num, 
  title, 
  group, 
  student_name, 
  professor_name
) = {
  import "functions.typ": *

  set align(center)
  set text(size: 12pt)
  set par(leading: 0.65em, justify: false)

  stack(
    dir: ttb,
    image("logo.png"),
    v(0.65em),
    text([МИНОБРНАУКИ РОССИИ]),
    v(0.65em),
    text([Федеральное государственное бюджетное образовательное учреждение высшего образования]),
    v(2 * 0.65em),
    text([*#quote_wrap([МИРЭА -- Российский технологический университет])*]),
    v(2 * 0.65em),
    text(16pt, [*РТУ МИРЭА*])
  )

  line(length: 100%)

  stack(
    dir: ttb,

    text([Институт информационных технологий]),

    v(2 * 0.65em),

    text([Кафедра инструментального и прикладного программного обеспечения])
  )

  v(1fr)

  text(size: 14pt, [*ОТЧЕТ ПО ПРАКТИЧЕСКОЙ РАБОТЕ №#num \ по дисциплине \ #quote_wrap([Настройка и администрирование сервисного программного обеспечения])* \ Тема #quote_wrap(title)])

  v(1fr)

  stack(
    dir: ttb,
    text([Выполнил студент группы #group #h(1fr) #student_name]),
    v(3 * 0.65em),
    text([Принял преподаватель #h(1fr) #professor_name])
  )

  v(1fr)

  let year = datetime.today().year()

  text([Москва #year г.])

  pagebreak()
}

#let title_page_me(num, title) = {
  title_page(
    num,
    title,
    [ИКБО-13-23],
    [Русаков М.Ю.],
    [Благирев М.М.],
  )
}
