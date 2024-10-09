#let titlepage(
  title: "",
  advisors: (),
  author: "",
  date: datetime,
) = {
  // Quality checks

  
  set page(
    margin: (left: 20mm, right: 20mm, top: 30mm, bottom: 30mm),
    numbering: none,
    number-align: center,
  )

  let body-font = "New Computer Modern"
  let sans-font = "Source Sans Pro"

  set text(
    // font: body-font, 
    size: 12pt, 
    lang: "en"
  )

  set par(leading: 0.5em)

  
  // --- Title Page ---
  v(1cm)
  align(center, image("/figs/tudlogo.svg", width: 26%))

  v(5mm)
  align(center, text(font: sans-font, 1em, weight: 400, "MSc thesis in Geomatics"))

  v(5mm)

  align(center, text(font: sans-font, 2em, weight: 700, title))
  
  v(1cm)
  align(center, text(font: sans-font, 1em, author))


  v(5cm)
  align(center, text(font: sans-font, 1em, [A thesis submitted to the Delft University of Technology in partial fulfillment of the requirements for the degree of Master of Science in Geomatics]))
}
