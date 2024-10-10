#import "template.typ": *

#let mysettings = toml("settings.toml")
#show: doc => msc-geomatics-tudelft(
  title: mysettings.title,
  author: mysettings.author,
  graduation-year: mysettings.graduation-year,
  graduation-month: mysettings.graduation-month,
  supervisor1: mysettings.supervisor1,
  supervisor2: mysettings.supervisor2,
  coreader   : mysettings.coreader,
  body-font  : mysettings.fonts.body-font,
  title-font : mysettings.fonts.title-font, 
  math-font  : mysettings.fonts.math-font,
  mono-font  : mysettings.fonts.mono-font,
  doc,
)

//-- front-matter
#set page(numbering: "i")
#counter(page).update(1)

#include "front/abstract.typ"
#include "front/acknowledgement.typ"

#[
  #show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }
  #outline(depth: 2, indent: auto)
]

#outline(
  title: [List of figures],
  target: figure.where(kind: image),
)

#outline(
  title: [List of tables],
  target: figure.where(kind: table),
)

#outline(
  title: [List of algorithms],
  target: figure.where(kind: "algorithm"),
)

// page counter anchor
#metadata(()) <front-matter>
#pagebreak()

//-- main-matter
#set page(numbering: "1")
#counter(page).update(1)
#set heading(numbering: "1.")

#include "chapters/introduction.typ"
#include "chapters/relatedwork.typ"

//-- back-matter
// must take page breaks into account, may need to be offset by +1 or -1
// #context counter(page).update(counter(page).at(<front-matter>).first())
#set heading(numbering: "A.1")
#counter(heading).update(0)

#include "appendices/reproducibility.typ"
#include "appendices/someumldia.typ"

//-- references
#bibliography("/refs.bib", style: "apa")


