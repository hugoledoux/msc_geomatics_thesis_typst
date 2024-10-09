#import "template.typ": *


#let mymetadata = toml("metadata.toml")

#show: doc => msc-geomatics-tudelft(
  title: mymetadata.title,
  author: mymetadata.author,
  graduation-year: mymetadata.graduation-year,
  graduation-month: mymetadata.graduation-month,
  supervisor1: mymetadata.supervisor1,
  supervisor2: mymetadata.supervisor2,
  coreader   : mymetadata.coreader,
  doc,
)


//-- front-matter
#set page(numbering: "i")
#counter(page).update(1)

#include "front/abstract.typ"
#include "front/acknowledgement.typ"

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
#outline(depth: 2, indent: auto)

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
// #set page(numbering: "I")
// must take page breaks into account, may need to be offset by +1 or -1
#context counter(page).update(counter(page).at(<front-matter>).first())
#bibliography("/refs.bib", style: "chicago-author-date")


