#import "../template.typ": *

= Introduction <chap:intro>

#info[It is not an official template and it is not mandatory to use it.]

This is a complete template for the MSc Geomatics thesis.
It contains all the parts that are required and is structured in such a way that most/all supervisors expect.
Observe that the MSc Geomatics at TU Delft has no formal requirements, how the document looks like (fonts, margins, headers, etc) is entirely up to you. 

We basically took the template LaTeX at #link("https://github.com/tudelft3d/msc_geomatics_thesis_template") and tried to convert it to Typst.


But we hope it will encourage everyone to use Typst for writing their thesis, and we also hope that it will _discourage_ some from using Word.

If you run into mistakes/problems/issues, please report them on the GitHub page, and if you fix an error, then please submit a pull request. 


== Cross-references <sec:cross-ref>

To refer to chapters and sections, use the label, eg @chap:intro, @sec:figures or @sec:cross-ref.
For an appendix, use @app:reproducibility[Appendix].

For a figure, you can also just use @fig:cat, but I guess you can qualify it with whatever you fancy, eg @fig:cat[Potato].


== Figures <sec:figures>

#info[
  Typst supports natively figures in PDF, PNG, SVG, JPG, and GIF (with `#image()`).
]

@fig:sometriangles is a simple figure in PNG format, notice the use of `placement: auto` to put the figure at the best place possible (top or bottom, Typst decides for you).

#figure(
  image("../figs/sometriangles.png", width:50%),
  placement: auto, //-- otherwise figures gets placed where it's called
  caption: "One nice figure.",
) <fig:sometriangles>

#info[All figures in your thesis should be referenced to in the main text. The same applies to tables and algorithms.]

As shown in @fig:cat, it is possible to have two figures (or more) side by side.
You can also refer to a _subfigure_: see @fig:cat:b.
#subfigure(
  figure(
    image("../figs/tricat.pdf", page: 1),
    caption: [You can put sub-captions this way],
  ), <fig:cat:a>,
  figure(
    image("../figs/tricat.pdf", page: 2), 
    caption: [], //-- an empty caption puts the (a), (b), (c)...
  ), <fig:cat:b>,
  figure(
    image("../figs/tricat.pdf", page: 3), 
    caption: [],
  ), <fig:cat:c>,
  columns: (1fr, 1fr, 1fr),
  caption: [Three figures side-by-side. *(a)* A cat formed of 2 polygons. *(b)* its triangulation. *(c)* with some colours. Notice that the figure is one PDF file with 3 pages, the page to display can be chosen.],
  placement: auto,
  label: <fig:cat>,
)


== References

We know from #citet(<Descartes37>) that this can be done, and others have done that too @Descartes37.

And #citet(<vanKreveld96>) did write nice papers, and others too @Campen12.

// All the same
+ @Voronoi08 \
+ #cite(<Voronoi08>) \
+ #citep(<Voronoi08>) \
+ #cite(label("Voronoi08"))

To cite several papers for one sentence, just chain commands together #citep(<Delaunay34>)#citep(<Aurenhammer12>).
And #citet(<Delaunay34>, supplement: "p. 77") to specify a specific page, and #cite(<Aurenhammer12>, form: "year") just to add the year.

When adding references to your BibTeX file, it is good pratice to add the DOI of the paper.
For example, for a paper:
```bibtex
@book{Aurenhammer12,
  author = {Aurenhammer, Franz and Klein, Rolf and Lee, Der-Tsai},
  doi = {10.1142/8685},
  publisher = {World Scientific},
  title = {Voronoi diagrams and {D}elaunay triangulations},
  year = {2012}
}
```

Notice that if you use the field `doi` you shouldn't append `http://doi.org/` (the full DOI being http://doi.org/10.1142/8685).
If you do this then you'll have clickable DOIs in your list of references. 

#warning[Having clickable DOIs in the list of references is mandatory!]

== Footnotes 

Footnotes are a good way to write text that is not essential for the understanding of the text #footnote[but please do not overuse them].

== Equations

Equations and variables can be put inline in the text, but also numbered.

Let $S$ be a set of points in $RR^d$. 
The Voronoi cell of a point $p in S$, defined $cal(V)_p$, is the set of points $x in RR^d$ that are closer to $p$ than to any other point in $S$; that is:

$ cal(V)_p = \{x in RR^d | \|x-p\|  lt.eq  \|x-q\|,  forall  q in S \}. $

The union of the Voronoi cells of all generating points $p in S$ form the Voronoi diagram of $S$, defined VD($S$).


== Tables <sec:table>

Tables builtin in Typst are pretty powerful, see #link("https://typst.app/docs/guides/table-guide/").
If you need some of the features of LaTeX `booktabs`, it seems that tablex is your friend: #link("https://typst.app/universe/package/tablex").

An example of a simple table is in @tab:example1.

#figure(
  placement: auto,
  caption: [Details concerning the datasets used for the experiments.],
  table(
    stroke: none,
    columns: 5,
    align: (left, right, right, right, right),
    // columns: (auto, auto, auto, auto, auto),
    table.hline(),
    table.header[][solids][faces][vertices][constraints],
    table.hline(),
    [*campus*],  [370],   [4~298],  [5~970],  [3~976],
    [*kvz*],     [637],   [6~549], [8~951],  [13~571],
    [*engelen*], [1~629], [15~870], [23~732], [15~868], 
    table.hline(),
  ) 
) <tab:example1>

❤️ You can even read directly from a CSV file this way:

#let data = csv("../data/smth.csv")
#figure(
  table(
    columns: 3,
    ..data.flatten(),
  ),
  placement: auto,
  caption: [Some CSV random data.],
) <tab:example2>

== Plots

The best way is to use #link("http://matplotlib.org")[matplotlib], or its more beautiful version #link("http://stanford.edu/~mwaskom/software/seaborn/index.html")[seaborn].
With these, you can use Python to generate nice plots, such as that in @fig:myplot.

#figure(
  image("../plots/myplot.svg", width:70%),
  placement: auto, 
  caption: [A super plot.],
) <fig:myplot>

In the folder `./plots/`, there is an example of a CSV file of the temperature of Delft, taken somewhere.
From this CSV, the plot is generated with the script `createplot.py`.




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

You can use exactly the same principle as in Markdown, and you can wrap the raw code in a `#figure` to have a caption and place it where you want (see @fig:gml).

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
) <fig:gml>

== And finally what matters the most: emojis!

#emoji.face.smile #emoji.rocket #emoji.spaghetti

== TODOs

At the Green-light assessment or for earlier drafts, it might be good to let the readers know that some part need more work.
Or that a figure will be added.

The package #link("https://typst.app/universe/package/dashy-todo/") is perfect for this.
#todo[make sure that the URL is correct :J]

#todo(stroke: green)[TODOs can be any colours]

A summary of all TODOs in the thesis can even be generated with an `#outline` command, see #ref(<all-todos>, form: "page") and the file `main.typ`.
