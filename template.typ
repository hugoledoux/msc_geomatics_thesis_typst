
//-- my local cover
#import "cover/cover_template.typ": cover

//-- subfigure
#import "@preview/subpar:0.1.1"

//-- admonitions
#import "@preview/gentle-clues:1.0.0": *

//-- pseudo-code
#import "@preview/lovelace:0.3.0": *

#let msc-geomatics-tudelft(
  title: "",
  author: "",
  advisors: (),
  graduation-year: "",
  graduation-month: "",
  supervisor1: "",
  supervisor2: "",
  coreader   : "",
  graduation-group: "",
  body-font  : "",
  title-font : "",
  math-font  : "",
  mono-font  : "",
  body,
) = {

  set page(
    margin: auto,
    // margin: (left: 25mm, right: 25mm, top: 40mm, bottom: 30mm),
  )
  set par(justify: true)

  let body-font = body-font
  let title-font = title-font
  let math-font = math-font
  let mono-font = mono-font
  set text(
    font: body-font, 
    size: 11pt, 
  )
  show heading: set text(font: title-font)
  // show heading: set text(font: title-font, fill: primary-color)
  show heading.where(level:1): it => text(font: title-font, 1.3em, it) + v(1.5em)

  //-- math
  show math.equation: set text(font: math-font)
  /// author: laurmaedje
  // set heading(numbering: "1.")
  // reset counter at each chapter
  show heading.where(level:1): it => {
    counter(math.equation).update(0)
    it
  }
  set math.equation(numbering: n => {
    let h1 = counter(heading).get().first()
    numbering("(1.1)", h1, n)
  })
  
  //-- raw font
  show raw: set text(font: mono-font)

    // Set link style
  show link: it => text(fill: rgb("#3087b3") , it)

  // set page(footer: locate(
  //   loc => if calc.even(loc.page()) {
  //     align(right, counter(page).display("1"));
  //   } else {
  //     align(left, counter(page).display("1"));
  //   }
  // ))
  
  // show figure.caption: emph
  show figure.caption: it => [
    #text(font: title-font)[
      #it.supplement
      #context it.counter.display(it.numbering): 
      #it.body
    ]
    // #context it.counter.display(it.numbering)
  ]

  
  //-- cover pages
  cover(
    title: title,
    author: author,
    graduation-year: graduation-year,
    graduation-month: graduation-month,
    supervisor1: supervisor1,
    supervisor2: supervisor2,
    coreader   : coreader,
    graduation-group: graduation-group,
    body-font: body-font,
    title-font: title-font,
  )


// #show math.equation: set text(weight: 400)

  show heading.where(level: 1): it => pagebreak(weak: true, to: "odd") + it

  body

  pagebreak() 

  align(bottom)[
    This document was typeset using #link("https://typst.app")[Typst]. The main font is Palatino. 
    The figures and diagrams were mostly drawn using IPE, PGF/Ti\emph{k}z and Omnigraffle. 
  ]

}

//-- natbib
#let citet= cite.with(form: "prose") 
#let citep = cite 

//-- for outline of figures
#let in-outline = state("in-outline", false)
#show outline: it => {
  in-outline.update(true)
  it
  in-outline.update(false)
}
#let flex-caption(long, short) = locate(loc => 
  if in-outline.at(loc) { short } else { long }
)


//-- default for pseudo-code/lovelace
#let my-lovelace-defaults = (
  booktabs: true,
  booktabs-stroke: 1pt + black,
)
#let pseudocode-list = pseudocode-list.with(..my-lovelace-defaults)