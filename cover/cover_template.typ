#import "@preview/ccicons:1.0.1": *

#let mycover(
  title: "",
  author: "",
  graduation-year: 2024,
  graduation-month: "November",
  supervisor1: "",
  supervisor2: "",
  coreader   : "",
  graduation-group: "",
  serif-fonts: "",
  sans-fonts: "",
) = {
  set page(
    margin: auto,
    // margin: (left: 30mm, right: 30mm, top: 130mm, bottom: 30mm),
    numbering: none,
    number-align: center,
  )
  

  align(center + horizon)[
    #strong(text(1.2em)[MSc thesis in Geomatics for the Built Environment])
    #v(5em, weak: true)
    #text(font: sans-fonts, 2em, weight: 600, title)
    #v(3em, weak: true)
    #text(1.7em, author)
    #v(2em, weak: true)
    #text(1.4em, [#graduation-month #graduation-year])
    #v(15em, weak: true)
    #text(font: sans-fonts, 1.2em, weight: 400, [A thesis submitted to the Delft University of Technology in partial fulfillment of the requirements for the degree of Master of Science in Geomatics for the Built Environment])
  ]

  pagebreak()
  
  // --- Cover ---
  align(bottom)[
    #author: #emph(title) (#graduation-year)
    #linebreak()
    #text(0.9em, [#cc-by This work is licensed under a Creative Commons Attribution 4.0 International License. To view a copy of this license, visit #link("http://creativecommons.org/licenses/by/4.0/").])
    #v(7em, weak: true)
    The work in this thesis was carried out in the: 
    #let (group-logo, group-name) = if graduation-group == "3D geoinformation group" {
      (image("../figs/logo_tu3d.svg", width: 50%), [3D geoinformation group \ Delft University of Technology])
    } else if graduation-group == "Geo-Database Management Centre" {
      (image("../figs/logo_gdmc.png", width: 50%), [Geo-Database Management Centre \ Delft University of Technology])
    } else if graduation-group == "Knowledge Centre Open Data" {
      (image("../figs/logo_kcod.png", width: 70%), [Knowledge Centre Open Data \ Delft University of Technology])
    } else {
      (none, [nothing])
    }
    #grid(
      columns: (auto, auto),
      align: (bottom, horizon),
      gutter: 15pt,
      grid.cell(group-logo),
      grid.cell(group-name),
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
