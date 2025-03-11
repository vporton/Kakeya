#!/usr/bin/make -f

kakeya.pdf:

%.pdf: %.tex
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<

%.pdf: %.asy
	asy -f pdf -render 0 $<

%.ps: %.pdf
#	gs -q -dNOCACHE -dNOPAUSE -dBATCH -dSAFER -dPLATFONTS -sDEVICE=ps2write -sOutputFile=$@ $<
	pdftops $< $@

%.dvi: %.tex
	latex $<
	bibtex $(basename $<)
	latex $<
	latex $<

# %.ps: %.dvi
# 	dvips -o $@ $<

%.eps: %.asy
	asy -f eps -render 0 $<

kakeya.pdf: gnomonic.pdf circles.pdf filters.pdf area.pdf
kakeya.dvi: gnomonic.eps circles.eps filters.eps area.eps

.PHONY: clean
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.pdf *.dvi *.ps *.eps