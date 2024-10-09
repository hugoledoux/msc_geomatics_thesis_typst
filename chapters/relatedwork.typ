#import "../template.typ": *

= Related Work


Lemongrass frosted gingerbread bites banana bread orange crumbled lentils sweet potato black bean burrito green pepper springtime strawberry ginger lemongrass agave green tea smoky maple tempeh glaze enchiladas couscous. Cranberry spritzer Malaysian cinnamon pineapple salsa apples spring cherry bomb bananas blueberry pops scotch bonnet pepper spiced pumpkin chili lime eating together kale blood orange smash arugula salad. Bento box roasted peanuts pasta Sicilian pistachio pesto lavender lemonade elderberry Southern Italian citrusy mint lime taco salsa lentils walnut pesto tart quinoa flatbread sweet potato grenadillo.

== Figures


#figure(
  image("../figs/tricat-3.svg"),
  caption: [A cat.],
)<onecat>

As we can see in @cat, we get what we wanted.
We have in @cat:b a triangle.
#subpar.grid(
  figure(
    image("../figs/tricat-1.svg"), 
    caption: [],
  ), <cat:a>,
  figure(
    image("../figs/tricat-2.svg"), 
    caption: [],
  ), <cat:b>,
  figure(
    image("../figs/tricat-3.svg"), 
    caption: [],
  ), <cat:c>,
  columns: (1fr, 1fr, 1fr),
  caption: [(a) A cat on the left, and its triangulated.],
  label: <cat>,
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
