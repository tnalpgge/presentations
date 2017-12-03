To generate the presentation in this directory, first install the
appropriate packages for your operating system.

Red Hat Enterprise Linux, release 6:

```sh
yum -y install ??? xmlto make plotutils
```

Ubuntu Linux:

```sh
aptitude install ??? xmlto make plotutils
```
 
FreeBSD with pkgng:

```sh
pkg install docbook-xsl-ns xmlto graphviz gmake plotutils
```

Mac OS X with brew:

```sh
brew install xmlto graphviz plotutils docbook-xsl
```

Debian with apt:

```sh
apt-get install libxml2-utils xmlto graphviz docbook-xsl-ns plotutils
```

Then you should be able to `make` (or `gmake`) in this directory to
generate HTML documentation.  Start reading at `slides.html`.

Should you wish to customize the output you are encouraged to look
at the following files in this directory:

Files | Purpose
----- | -----
`slides.xml` | the main content
`user.css` | additional styling above and beyond what the theme provides
`GNUmakefile` | specifically the THEME setting, which references directories under `themes/`
`themes/*/slides.xsl` |  additional XSL customizations on top of **docbook-xsl-ns**
`themes/*/param.xsl` | easily-changed parameters used by `slides.xsl` and imported XSL stylesheets
`themes/*/theme.css` | main CSS stylesheet for the theme

`*.pic` (PIC) and `*.gv` (GraphViz) files will be converted to SVG
if they are mentioned as dependencies in `GNUmakefile`.

If you want to craft your own theme, start by making a copy of
`themes/naked`.
