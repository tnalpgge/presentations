DOC=slides
THEME=naked
XMLSRC=$(addsuffix .xml, $(DOC))
XSLSRC=$(addsuffix .xsl, themes/$(THEME)/$(DOC)) themes/$(THEME)/param.xsl themes/$(THEME)/freebsd.xsl themes/$(THEME)/macosx.xsl themes/$(THEME)/sourceforge.xsl 
XMLTO_HELPER=$(addsuffix -xhtml, $(DOC))
GVSRC=nooelec.gv hamlib-rigctl.gv hamlib-rigctld.gv
PICSRC=
SVGOBJ=$(GVSRC:.gv=.svg) $(PICSRC:.pic=.svg)
LINTSRC=$(addsuffix .lint, $(XMLSRC)) $(addsuffix .lint, $(XSLSRC))
HTMLOBJ=$(XMLSRC:.xml=.html)
SLIDELIB=slidy
BROWSER_SUPPORT=files/$(SLIDELIB)


all: html

show-props:
	@echo XML sources: $(XMLSRC)
	@echo XSL sources: $(XSLSRC)

html: $(HTMLOBJ) $(SVGOBJ) browser-support

$(HTMLOBJ): $(LINTSRC)
	env THEME=$(THEME) SRCROOT=$$PWD xmlto --skip-validation -v $$PWD/$(XMLTO_HELPER) $(XMLSRC)

%.svg: %.gv
	dot -Tsvg $< > $@

%.svg: %.pic
	pic2plot -T svg %< > $@

%.xml.lint: %.xml
	xmllint --noout $<
	touch $@

%.xsl.lint: %.xsl
	xmllint --noout $<
	touch $@

browser-support: $(BROWSER_SUPPORT)

$(BROWSER_SUPPORT):
	env THEME=$(THEME) SRCROOT=$$PWD sh $(XMLTO_HELPER) browser-support $(SLIDELIB)

clean:
	rm -f $(HTMLOBJ)
	rm -f $(SVGOBJ)
	rm -f $(LINTSRC)
	rm -f *~
	rm -f #*#
	rm -rf $(BROWSER_SUPPORT)
