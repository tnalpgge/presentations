DOC=slides
ADOCSRC=$(addsuffix .adoc, $(DOC))
ADOCCONFIG=$(addsufix .conf, $(DOC))
HTMLOBJ=$(ADOCSRC:.adoc=.html)
CLEANCSS=asciidoc docbook-xsl flask pygments slidy toc2 volnitsky xhtml11-quirks
CLEANJS=ASCIIMathML LaTeXMathML asciidoc slidy toc

all: html browser-support

html: $(HTMLOBJ)

%.html: %.adoc %.conf
	asciidoc $(VERBOSE) $<

clean:
	rm -f $(HTMLOBJ)
	rm -f *~
	rm -f #*#
	rm -f *.sw*
	rm -f $(addsuffix .css, $(CLEANCSS))
	rm -f $(addsuffix .js, $(CLEANJS))


browser-support:
	cp /usr/local/etc/asciidoc/javascripts/*.js $(PWD)
	cp /usr/local/etc/asciidoc/stylesheets/*.css $(PWD)
ifdef THEME
	cp /usr/local/etc/asciidoc/themes/$(THEME)/*.css $(PWD)
endif
