# Variables
RM=rm -rf

LATEXMK= \
	latexmk -pdf \
	-pdflatex="pdflatex -interaction=nonstopmode" \
	-use-make

PDFVIEWER=/usr/bin/google-chrome-stable

# Build Commands
.PHONY: clean
all: Main.pdf clean
clean-all: clean clean-everything
pdf: Main.pdf clean

# Building
Main.pdf: main.tex
	$(LATEXMK) $<
	biber main
	$(LATEXMK) $<
	$(LATEXMK) $<
	cp main.pdf ashton-hellwig_unit-7-essay.pdf

# Viewing
viewpdf: Main.pdf
	$(PDFVIEWER) ./ashton-hellwig_unit-7-essay.pdf

# Cleaning
clean:
	latexmk -c
	$(RM) *.4tc
	$(RM) *.4ct
	$(RM) *.tmp
	$(RM) *.xref
	$(RM) *.idv
	$(RM) *.lg
	$(RM) *.out.ps
	$(RM) *.bbl
	$(RM) *.bib.bbl
	$(RM) *.bib.blg
	$(RM) *.run.xml
	$(RM) *.dvi
	$(RM) *.lol
	$(RM) *.synctex.gz
	$(RM) *.html
	$(RM) *.css

clean-everything: clean
	latexmk -CA
	$(RM) main.pdf
