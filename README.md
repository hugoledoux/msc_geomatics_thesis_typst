
# MSc Geomatics final thesis template (Typst)

A complete [Typst template](https://typst.app/) for the [MSc Geomatics](http://geomatics.tudelft.nl) thesis.

It contains all the parts that are required and is structured in such a way that most/all supervisors expect.
Observe that the MSc Geomatics at TU Delft has no formal requirements, how the document looks like (fonts, margins, headers, etc) is entirely up to you. 

It is basically a port to Typst of the [LaTeX template](https://github.com/tudelft3d/msc_geomatics_thesis_template), but it looks slightly different.

> It is not an official template and it is not mandatory to use it.

But we hope it will encourage everyone to use Typst or LaTeX for writing their thesis, and we also hope that it will *discourage* some from using Word.

## What is Typst?

It's the "new LaTeX": simpler to learn, simpler to modify the layout, 94232334X faster.
But also, at the moment, has less features, can be a bit buggy, the basecode is changing often, etc. 

So great to use, but be warned.

## How to use this template?

The file `chapters/introduction.typ` contains several tips that are useful when using LaTeX, read its source code!

To modify this template:

1. put your details in `settings.toml`
2. `typst compile main.typ`


## Which software to use?

### Editors

* [VSCode](https://code.visualstudio.com/) + [Tinymist extension](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) (offers OTF preview/rendering)
* [Typst.app](https://typst.app/) but not all fonts are present

![](./figs/vscode.png)

### Managing references

* [JabRef](http://jabref.sourceforge.net) (cross-platform)

### Drawing figures

* Adobe Illustrator (nice, but €€€)
* [Inkscape](https://inkscape.org/en/) (cross-platform)
* [IPE](http://ipe.otfried.org/) (cross-platform; integrates LaTeX text; great for triangulation and geometric stuff)

### Drawing flowcharts

* [draw.io](https://www.draw.io/)  