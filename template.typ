
//-- my local cover
#import "cover/cover_template.typ": cover

//-- subfigure
#import "@preview/subpar:0.1.1"
//-- admonitions
#import "@preview/gentle-clues:1.0.0": *
//-- pseudo-code
#import "@preview/lovelace:0.3.0": *
//-- for the fancy headers
#import "@preview/hydra:0.5.1": hydra
//-- TODO
#import "@preview/dashy-todo:0.0.1": todo


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
  body,
) = {

  set page(
    margin: auto,
    // margin: (left: 25mm, right: 25mm, top: 40mm, bottom: 30mm),
  )
  set par(justify: true)

  
  let serif-fonts = ("TeX Gyre Pagella", "Palatino", "New CM") //-- https://www.1001fonts.com/tex-gyre-pagella-font.html
  let sans-fonts = ("TeX Gyre Heros", "Source Sans Pro", "Calibri")  //-- https://www.1001fonts.com/texgyreheros-font.html + https://github.com/adobe-fonts/source-sans-pro
  let math-font = ("Stix Two Math", "New CM Math")     //-- free: https://github.com/stipub/stixfonts
  let mono-font = ("Consolas")


  set text(
    font: serif-fonts, 
    size: 11pt, 
  )
  show heading: set text(font: sans-fonts)
  // show heading: set text(font: title-font, fill: primary-color)
  show heading.where(level:1): it => text(font: sans-fonts, 1.3em, it) + v(1.5em)

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

  set list(indent: 1em)
  set enum(indent: 1em)

  // set page(footer: locate(
  //   loc => if calc.even(loc.page()) {
  //     align(right, counter(page).display("1"));
  //   } else {
  //     align(left, counter(page).display("1"));
  //   }
  // ))
  
  // show figure.caption: emph
  show figure.caption: it => [
    #text(font: sans-fonts)[
      #it.supplement
      #context it.counter.display(it.numbering). #h(0.3em) 
      #it.body
    ]
  ]

  // show figure: set figure.caption(separator: [.#h(0.5em)])

  
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
    serif-fonts: serif-fonts,
    sans-fonts: sans-fonts,
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
// -- TODO: DOESN'T WORK FOR SHORT FIGURE TITLES
#let in-outline = state("in-outline", false)
#show outline: it => {
  in-outline.update(true)
  it
  in-outline.update(false)
}
#let flex-caption(long, short) = context {   
  if in-outline.at(here()) { long } else { short }
}


//-- default for pseudo-code/lovelace
#let my-lovelace-defaults = (
  booktabs: true,
  booktabs-stroke: 1pt + black,
)
#let pseudocode-list = pseudocode-list.with(..my-lovelace-defaults)