//-- my local cover
#import "cover/cover_template.typ": mycover
//-- subfigure
#import "@preview/subpar:0.2.2"
//-- admonitions
#import "@preview/gentle-clues:1.2.0": *
//-- pseudo-code
#import "@preview/lovelace:0.3.0": *
//-- for the fancy headers
#import "@preview/hydra:0.6.2": hydra
//-- for the to-be-done things
#import "@preview/dashy-todo:0.1.3": todo
//-- siunitx
#import "@preview/unify:0.8.1": num, numrange, qty, qtyrange, unit




//-- natbib
#let citet = cite.with(form: "prose")
#let citep = cite

//-- for outline of figures
#let in-outline = state("in-outline", false)
#show outline: it => {
  in-outline.update(true)
  it
  in-outline.update(false)
}
#let flex-caption(long, short) = context {
  if in-outline.at(here()) { long } else { short }
}

//-- https://github.com/tingerrr/subpar/issues/16
#let sub-figure-numbering = (super, sub) => numbering("1.1a", counter(heading).get().first(), super, sub)
#let figure-numbering = super => numbering("1.1", counter(heading).get().first(), super)
//-- 9pt captions with a bold "Figure 1.1:"-style label
#let styled-caption(cap) = context text(size: 9pt)[
  #strong(cap.supplement + sym.space + cap.counter.display(cap.numbering) + [:])
  #h(0.3em)
  #cap.body
]
#let subfigure = subpar.grid.with(
  numbering: figure-numbering,
  numbering-sub-ref: sub-figure-numbering,
  //-- simple "(a)", "(b)", ... labels below the sub-figures
  show-sub-caption: (num, caption) => text(size: 8pt, weight: "regular")[#num #h(0.3em) #caption.body],
)
// //-- https://github.com/tingerrr/subpar/issues/16
// #let sub-figure-numbering = (super, sub) => numbering("1.1a", counter(heading).get().first(), super, sub)
// #let figure-numbering = super => numbering("1.1", counter(heading).get().first(), super)
// #let subpar-grid = subpar.grid.with(
//   numbering: figure-numbering,
//   numbering-sub-ref: sub-figure-numbering,
// )

//-- default for pseudo-code/lovelace
#let my-lovelace-defaults = (
  booktabs: true,
  booktabs-stroke: 1pt + black,
)
#let pseudocode-list = pseudocode-list.with(..my-lovelace-defaults)

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
  cover: false,
  body,
) = {

  if cover == true {
    page(
      width: 210mm,
      height: 297mm,
      margin: 0pt,
    )[
      #image(
        "./cover/cover_front.pdf",
        page: 1,
        width: 100%,
        height: 100%,
        fit: "contain",
      )
    ]
    pagebreak()
    pagebreak()
  }
  
  set page(
    margin: auto,
    // margin: (left: 25mm, right: 25mm, top: 40mm, bottom: 30mm),
  )
  set par(justify: true)


  let serif-fonts = ("TeX Gyre Pagella", "Palatino", "New Computer Modern") 
  //-- free download: https://www.1001fonts.com/tex-gyre-pagella-font.html
  let sans-fonts = ("TeX Gyre Heros", "Source Sans Pro", "Calibri")  
  //-- free download: https://www.1001fonts.com/texgyreheros-font.html + https://github.com/adobe-fonts/source-sans-pro
  let math-font = ("Stix Two Math", "New Computer Modern Math")     
  //-- free download: https://github.com/stipub/stixfonts
  let mono-font = ("Consolas")


  set text(
    font: serif-fonts,
    size: 11pt,
  )
  show heading: set text(font: sans-fonts)
  show heading.where(level: 1): it => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: "algorithm")).update(0)
    it
  }
  show heading.where(level: 1): set heading(supplement: [Chapter])
  show heading.where(level:1): it => text(font: sans-fonts, 1.5em, it) + v(2em)
  show heading.where(level: 1): it => pagebreak(weak: true, to: "odd") + it
  show figure.where(kind: image): set figure(numbering: figure-numbering)
  show figure.where(kind: table): set figure(numbering: figure-numbering)
  show figure.where(kind: "algorithm"): set figure(numbering: figure-numbering)
  //-- captions of figures, tables and algorithms: 9pt with a bold label
  //-- (kept global so that subpar's sub-captions keep their own styling)
  show figure.caption: cap => {
    if cap.kind in (image, table, "algorithm") { styled-caption(cap) } else { cap }
  }

  //-- math
  show math.equation: set text(font: math-font)
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
  show link: it => text(fill: rgb("#3087b3"), font: mono-font , it)

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
  // show figure.caption: it => [
  //   #text(font: sans-fonts)[
  //     #it.supplement
  //     #context it.counter.display(it.numbering). #h(0.3em)
  //     #it.body
  //   ]
  // ]


  //-- cover pages
  mycover(
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

  body

  pagebreak()

  pagebreak(to: "odd")
  align(bottom)[
    This document was typeset using #link("https://typst.app")[Typst], and uses the template freely available at https://github.com/tudelft3d/msc_geomatics_thesis_typst.
    // The main font is Palatino.
    // The figures and diagrams were mostly drawn using IPE, PGF/Ti\emph{k}z and Omnigraffle.
  ]
  
  if cover == true {
    //-- make sure the back cover ends up on a left (even) page
    set page(numbering: none)
    pagebreak(to: "even")
    page(
      width: 210mm,
      height: 297mm,
      margin: 0pt,
    )[
      #image(
        "./cover/cover_back.pdf",
        page: 1,
        width: 100%,
        height: 100%,
        fit: "contain",
      )
    ]
  }


}
