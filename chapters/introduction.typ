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
  // rect(),
  placement: auto, //-- otherwise figures gets placed where it's called
  caption: flex-caption( [1 nice figure.], [2 nice figure.]),
  // caption: [1 nice figure.],
) <fig:sometriangles>

#figure(
  rect(),
  // placement: auto,
  caption: flex-caption(
    [This is my long caption text in the document.],
    [This is short],
  ), 
) <un>

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
  // caption: 
  // flex-caption(
  //   [Triangulation of a cat.],
  //   [Three figures side-by-side. *(a)* A cat formed of 2 polygons. *(b)* its triangulation. *(c)* with some colours.], 
  // ),
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

== Footnotes 

Footnotes are a good way to write text that is not essential for the understanding of the text #footnote[but please do not overuse them].

== Equations

Equations and variables can be put inline in the text, but also numbered.

Let $S$ be a set of points in $RR^d$. 
The Voronoi cell of a point $p in S$, defined $cal(V)_p$, is the set of points $x in RR^d$ that are closer to $p$ than to any other point in $S$; that is:

$ cal(V)_p = \{x in RR^d | \|x-p\|  lt.eq  \|x-q\|,  forall  q in S \}. $

The union of the Voronoi cells of all generating points $p in S$ form the Voronoi diagram of $S$, defined VD($S$).


== Pseudo-code <sec:pseudo-code>

Please avoid putting code (Python, C++, Fortran) in your thesis.
Small excerpt are probably fine (for some cases), but do not put all the code in an appendix.
Instead, put your code somewhere online (eg GitHub) and put _pseudo-code_ in your thesis.
The package `lovelace` is pretty handy, see for instance @algo:walk.
All your algorithms will be automatically added to the list of algorithms at the begining of the thesis.


#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  caption: [W#smallcaps([alk]) ($cal(T)$, $tau$, $p$)],
  pseudocode-list[
    + *Input:* A Delaunay tetrahedralization $cal(T)$, a starting tetrahedron $tau$, and a query point $p$
    + *Output:* $tau_r$: the tetrahedron in $cal(T)$ containing $p$
    + *while* $tau_r$ not found
      + *for* $i #sym.arrow.l$ 0 *to* 3 *do*
        + $sigma_i #sym.arrow.l$ get opposite vertex $i$ in $tau$
        + *if* O#smallcaps([rient]) ($sigma_i, p$) $<0$ *then*
          + $tau #sym.arrow.l$ get neighbouring tetrahedron of $tau$ incident to $sigma_i$
          + break
      + *if* $i==3$ *then*
        - \//-- all the faces of $tau$ have been tested
        + *return* $tau_r = tau$
  ]
) <algo:walk>

== Source/raw code 

#figure(
```xml
<gml:Solid>
  <gml:exterior>
    <gml:CompositeSurface>
      <gml:surfaceMember>
        <gml:Polygon>
          <gml:exterior>
            <gml:LinearRing>
              <gml:pos>0.000000 0.000000 1.000000</gml:pos>
              <gml:pos>1.000000 0.000000 1.000000</gml:pos>
              <gml:pos>1.000000 1.000000 1.000000</gml:pos>
              <gml:pos>0.000000 1.000000 1.000000</gml:pos>
              <gml:pos>0.000000 0.000000 1.000000</gml:pos>
            </gml:LinearRing>
          </gml:exterior>
          <gml:interior>
          ...
      </gml:surfaceMember>
    </gml:CompositeSurface>
  </gml:interior>
</gml:Solid>
```,
placement: auto,

caption: [Some GML for a `gml:Solid`.],
), <fig:gml>