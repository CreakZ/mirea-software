#let main(title_page, body) = {
  set page(margin: 2cm)
  set text(size: 14pt, font: "New Computer Modern")
  set heading(numbering: "1.1.1.1.")
  set par(first-line-indent: 1.25cm, justify: true)

  show heading: it => align(center, it)

  title_page

  body
}
