#let cover(
  title: "",
  author: "",
  graduation-year: 2024,
  graduation-month: 11,
  body-font: "",
  title-font: "",
) = {
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: none,
    number-align: center,
  )

  // let body-font = "New Computer Modern"
  // let sans-font = "New Computer Modern Sans"

  // set text(
  //   font: body-font, 
  //   size: 12pt, 
  //   lang: "en"
  // )
  
  // set par(leading: 1em)

  
  // --- Cover ---
  v(1cm)
  align(center, image("../figs/tudlogo.svg", width: 44%))

  v(5mm)
  align(center, text("Delft University of Techmology"))

  v(5mm)
  align(center, text("MSc thesis in Geomatics"))
  
  v(15mm)

  
  align(center, title)
  align(center, author)


  // align(center, text(font: title-font, 1.3em, weight: 100,  "’s Thesis in "))
  v(15mm)
  

  // align(center, text(font: sans-font, 2em, weight: 700, title))
  
  v(10mm)
  align(center, text(font: title-font, 1.2em, weight: 500, [A thesis submitted to the Delft University of Technology in partial fulfillment of the requirements for the degree of Master of Science in Geomatics]))
}