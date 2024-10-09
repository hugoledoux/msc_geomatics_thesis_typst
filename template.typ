#import "cover/cover_template.typ": cover
#import "@preview/subpar:0.1.1"
#import "@preview/gentle-clues:1.0.0": *

#let msc-geomatics-tudelft(
  title: "",
  author: "",
  advisors: (),
  graduation-year: 2024,
  graduation-month: 11,
  supervisor1: "",
  supervisor2: "",
  coreader   : "",
  body,
) = {

  set page(
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 25mm),
  )
  set par(justify: true)

  let body-font = "Linux Libertine"
  // let body-font = "Palatino"
  let title-font = "Source Sans Pro"
  
  set text(
    font: body-font, 
    size: 11pt, 
  )
  show heading: set text(font: title-font)
  // show heading: set text(font: title-font, fill: primary-color)
  show heading.where(level:1): it => text(font: title-font, 1.3em, it) + v(1.5em)

  // show figure.caption: emph

  // show figure.caption: it => [
    // #it.supplement
    // #context it.counter.display(it.numbering) #text(it.body) 
    // #context it.counter.display(it.numbering)
  // ]

  
  //-- cover pages
  // align(center)[#text(title)]
  cover(
    title: title,
    author: author,
    graduation-year: graduation-year,
    graduation-month: graduation-month,
    body-font: body-font,
    title-font: title-font,
  )


// #show math.equation: set text(weight: 400)

  show heading.where(level: 1): it => pagebreak(weak: true, to: "odd") + it

  body

}

//-- natbib
#let citet= cite.with(form: "prose") 
#let citep = cite 