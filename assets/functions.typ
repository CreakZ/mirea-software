#import "constants.typ": *

#let quote_wrap(text) = {
  [$quote.l.angle.double$#text$quote.r.angle.double$]
}

#let GOST_par(text) = {
  [#h(indent)#text]
}

#let task_text(text) = {
  [*Задание: *#text]
}
