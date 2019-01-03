DOC=slides
SRC=$(addsuffix .md, $(DOC))
HTMLOBJ=$(SRC:.md=.html)
FORMAT=markdown
BACKEND=revealjs
PANDOC=pandoc
BACKEND_VERSION=3.7.0
BACKEND_DL_FMT=tar.gz
BACKEND_DL_URL=https://github.com/hakimel/reveal.js/archive/$(BACKEND_VERSION).$(BACKEND_DL_FMT)
BACKEND_LOCAL_COPY=$(BACKEND)-$(BACKEND_VERSION).$(BACKEND_DL_FMT)
BACKEND_DIR=reveal.js
BACKEND_SUBDIRS=css js lib plugin
BACKEND_EXTRACT=$(BACKEND_SUBDIRS:%=$(BACKEND_DIR)-$(BACKEND_VERSION)/%)
THEME=custom
PANDOC_DATA_DIR=$(PANDOC)

all: html browser-support

template: $(PANDOC_DATA_DIR)/templates/default.$(BACKEND)

html: $(HTMLOBJ) template

%.html: %.md
	$(PANDOC) --data-dir $(PANDOC_DATA_DIR) --from $(FORMAT) --to $(BACKEND) --standalone --output $@ $<

browser-support: backend-dir custom-theme

backend-dir: $(BACKEND_DIR)

$(BACKEND_DIR): $(BACKEND_LOCAL_COPY)
	pax -r -z -f $(BACKEND_LOCAL_COPY) -s /-$(BACKEND_VERSION)// $(BACKEND_EXTRACT)

backend-download: $(BACKEND_LOCAL_COPY)

$(BACKEND_LOCAL_COPY):
	curl -L -o $@ $(BACKEND_DL_URL)

custom-theme: backend-dir $(BACKEND_DIR)/css/theme/$(THEME).css

$(BACKEND_DIR)/css/theme/$(THEME).css: $(THEME).css
	cp $(THEME).css $(BACKEND_DIR)/css/theme/$(THEME).css

clean:
	rm -f $(HTMLOBJ)
	rm -f *~
	rm -f #*#
	rm -f *.sw*


distclean: clean
	rm -f $(BACKEND_LOCAL_COPY)
	rm -rf $(BACKEND_DIR)
