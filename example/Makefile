## A typical Makefile for compiling latex sources using a blang/latex docker container

ifndef PDFVIEWER
	PDFVIEWER=qpdfview
endif

CONTAINER=../latexdockercmd.sh /bin/sh -c
PDFLATEX_BIN=pdflatex
PDFLATEX_OPTS=-shell-escape -halt-on-error
BIBTEX_BIN=bibtex
DOCUMENT=example

.PHONY: all debug debugcmd clean clean-src clean-pdf show

default: $(DOCUMENT).pdf clean-src

all: $(DOCUMENT).pdf clean-src

# Override Variable DOCUMENT from command line with: make -e DOCUMENT=abc 

$(DOCUMENT).pdf: $(DOCUMENT).tex references.bib
	$(CONTAINER) "$(PDFLATEX_BIN) $(PDFLATEX_OPTS) $(DOCUMENT).tex && $(BIBTEX_BIN) $(DOCUMENT) && \
		$(PDFLATEX_BIN) $(PDFLATEX_OPTS) $(DOCUMENT).tex && $(PDFLATEX_BIN) $(PDFLATEX_OPTS) $(DOCUMENT).tex"

debug: debugcmd clean-src

debugcmd: $(DOCUMENT).tex directory.bib
	$(CONTAINER) "$(PDFLATEX_BIN) $(PDFLATEX_OPTS) $(DOCUMENT).tex && $(BIBTEX_BIN) $(DOCUMENT)"

clean: clean-src clean-pdf

clean-src:
	rm -f $(DOCUMENT).aux $(DOCUMENT).log $(DOCUMENT).out $(DOCUMENT).toc $(DOCUMENT).lot $(DOCUMENT).glg $(DOCUMENT).glo $(DOCUMENT).gls $(DOCUMENT).ist $(DOCUMENT).lof \
		$(DOCUMENT).nav $(DOCUMENT).out $(DOCUMENT).snm $(DOCUMENT).toc $(DOCUMENT).vrb $(DOCUMENT).acn $(DOCUMENT).acr $(DOCUMENT).alg $(DOCUMENT).bbl $(DOCUMENT).blg $(DOCUMENT)-blx.bib $(DOCUMENT).dvi $(DOCUMENT).lol $(DOCUMENT).pyg $(DOCUMENT).run.xml $(DOCUMENT).glsdefs

clean-pdf:
	rm -f $(DOCUMENT).pdf $(DOCUMENT).pdf

show: $(DOCUMENT).pdf clean-src
	$(PDFVIEWER) $(DOCUMENT).pdf

