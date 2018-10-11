DOC=slides
ADOCSRC=$(addsuffix .adoc, $(DOC))
ADOCCONFIG=$(addsufix .conf, $(DOC))
HTMLOBJ=$(ADOCSRC:.adoc=.html)

all: html browser-support

html: $(HTMLOBJ)

%.html: %.adoc %.conf
	asciidoc $(VERBOSE) $<

clean:
	rm -f $(HTMLOBJ)
	rm -f *~
	rm -f #*#
	rm -f *.sw*

browser-support:
	cp /usr/local/etc/asciidoc/javascripts/*.js $(PWD)
	cp /usr/local/etc/asciidoc/stylesheets/*.css $(PWD)
ifdef THEME
	cp /usr/local/etc/asciidoc/themes/$(THEME)/*.css $(PWD)
endif
