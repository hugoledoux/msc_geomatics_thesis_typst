#import "/layout/cover.typ": *
#import "/layout/titlepage.typ": *


#let thesis(
  title: "",
  author: "",
  advisors: (),
  date: datetime,
  abstract: "",
  acknowledgement: "",
  body,
) = {
  // cover(
  //   title: title,
  //   author: author,
  //   date: date,
  // )

  // pagebreak()

  titlepage(
    title: title,
    advisors: advisors,
    author: author,
    date: date,
  )
  
  abstract

  pagebreak()
  acknowledgement

  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: "1",
    number-align: center,
  )

  let body-font = "New Computer Modern"
  let sans-font = "Input Sans"

  set text(
    font: body-font, 
    size: 12pt, 
    lang: "en"
  )
  
  show math.equation: set text(weight: 400)

  // --- Headings ---
  show heading: set block(below: 0.85em, above: 1.75em)
  show heading: set text(font: body-font)
  set heading(numbering: "1.1")
  // Reference first-level headings as "chapters"
  show ref: it => {
    let el = it.element
    if el != none and el.func() == heading and el.level == 1 {
      [Chapter ]
      numbering(
        el.numbering,
        ..counter(heading).at(el.location())
      )
    } else {
      it
    }
  }

  // --- Paragraphs ---
  set par(leading: 1em)

  // --- Citations ---
  set cite(style: "alphanumeric")

  // --- Figures ---
  show figure: set text(size: 0.85em)
  
  // --- Table of Contents ---
  pagebreak()
  outline()
  
   // List of figures.
  pagebreak()
  heading(numbering: none)[List of figures]
  outline(
    title:"",
    target: figure.where(kind: image),
  )

  // List of tables.
  pagebreak()
  heading(numbering: none)[List of tables]
  outline(
    title: "",
    target: figure.where(kind: table)
  )
  
  v(2.4fr)
  pagebreak()


  // Main body.
  set par(justify: true, first-line-indent: 2em)

  body

 

  // Appendix.
  pagebreak()
  heading(numbering: none)[Appendix A: Supplementary Material]
  include("/layout/appendix.typ")

  pagebreak()
  bibliography("/refs.bib")
}
