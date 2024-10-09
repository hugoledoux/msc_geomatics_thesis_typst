#import "../template.typ": *

= Introduction <chap:intro>

This is a complete template for the MSc Geomatics thesis.
It contains all the parts that are required and is structured in such a way that most/all supervisors expect.
Observe that the MSc Geomatics at TU Delft has no formal requirements, how the document looks like (fonts, margins, headers, etc) is entirely up to you. 

We basically took the template LaTeX at #link("https://github.com/tudelft3d/msc_geomatics_thesis_template") and tried to convert it to Typst.

#info[It is not an official template and it is not mandatory to use it.]

But we hope it will encourage everyone to use Typst for writing their thesis, and we also hope that it will _discourage_ some from using Word.

If you run into mistakes/problems/issues, please report them on the GitHub page, and if you fix an error, then please submit a pull request. 


== Cross-references <sec:cross-ref>

@chap:intro[Chapter] is to refer to the Chapter, but all other sections you can just use @sec:figures or @sec:cross-ref.
// The next chapter (\nameref{chap:rw}), is on page~\pageref{chap:rw}.

For a figure, you can also just use @fig:cat, but I guess you can qualify it with whatever you fancy, eg @fig:cat[Hugo].


== Figures <sec:figures>

@fig:sometriangles is a simple figure in PNG format, notice the use of `placement: auto` to put the figure at the best place possible (top or bottom, Typst decides for you).

#figure(
  image("../figs/sometriangles.png", width:60%),
  placement: auto, //-- otherwise figures gets placed where it's called
  caption: [One nice figure.],
)<fig:sometriangles>

#info[All figures in your thesis should be referenced to in the main text. The same applies to tables and algorithms.]

As shown in @fig:cat, it is possible to have two figures (or more) side by side.
You can also refer to a subfigure: see @fig:cat:b.
#subpar.grid(
  figure(
    image("../figs/tricat-1.svg"), 
    caption: [],
  ), <fig:cat:a>,
  figure(
    image("../figs/tricat-2.svg"), 
    caption: [],
  ), <fig:cat:b>,
  figure(
    image("../figs/tricat-3.svg"), 
    caption: [],
  ), <fig:cat:c>,
  columns: (1fr, 1fr, 1fr),
  caption: [Three figures side-by-side. *(a)* A cat formed of 2 polygons. *(b)* its triangulation. *(c)* with some colours.],
  placement: auto,
  label: <fig:cat>,
)

== References

We know from #citet(<Descartes37>) that this can be done, and others have done that too @Descartes37.

And #citet(<Delaunay34>) did VoroCrust.

// We know from #cite(<Hawker22>, form: "prose") that this can done, and others have done that too #cite(<Esch22>, form: "year").

// All the same
@Voronoi08 \
#cite(<Voronoi08>) \
#citep(<Voronoi08>) \
#cite(label("Voronoi08"))
