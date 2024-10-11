#import "@preview/ccicons:1.0.0": *

#let cover(
  title: "",
  author: "",
  graduation-year: 2024,
  graduation-month: "November",
  supervisor1: "",
  supervisor2: "",
  coreader   : "",
  graduation-group: "",
  body-font: "",
  title-font: "",
) = {
  set page(
    margin: auto,
    // margin: (left: 30mm, right: 30mm, top: 130mm, bottom: 30mm),
    numbering: none,
    number-align: center,
  )
  

  align(center + horizon)[
    #strong(text(1.2em)[MSc thesis in Geomatics])
    #v(5em, weak: true)
    #text(font: title-font, 2em, weight: 600, title)
    #v(3em, weak: true)
    #text(1.7em, author)
    #v(2em, weak: true)
    #text(1.4em, [#graduation-month #graduation-year])
    #v(15em, weak: true)
    #text(font: title-font, 1.2em, weight: 400, [A thesis submitted to the Delft University of Technology in partial fulfillment of the requirements for the degree of Master of Science in Geomatics])
  ]

  pagebreak()
  
  // --- Cover ---
  align(bottom)[
    #author: #emph(title) (#graduation-year)
    #linebreak()
    #text(0.9em, [#cc-by This work is licensed under a Creative Commons Attribution 4.0 International License. To view a copy of this license, visit #link("http://creativecommons.org/licenses/by/4.0/").])
    #v(7em, weak: true)
    The work in this thesis was carried out in the: 
    #grid(
      columns: (auto, auto),
      align: (bottom, horizon),
      gutter: 5pt,
      if graduation-group == "3D geoinformation group" [
        #grid.cell(
          image("../figs/logo_tu3d.svg", width: 50%),
        )      
      ] else [
        #grid.cell(
          image("../figs/GDMC-LOGO12.jpg", width: 50%),
        )
      ],
      grid.cell([#graduation-group #linebreak() Delft University of Technology])
    )
    #v(5em, weak: true)
    #grid(
      columns: (auto, auto),
      align: (top, top),
      gutter: 15pt,
      [Supervisors:], 
      [#supervisor1 #linebreak() #supervisor2],
      [Co-reader:],
      [#coreader],
    )
  ]
}