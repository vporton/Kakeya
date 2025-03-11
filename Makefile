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
	gs -q -dNOCACHE -dNOPAUSE -dBATCH -dSAFER -dPLATFONTS -sDEVICE=ps2write -sOutputFile=$@ $<

%.dvi: %.tex
	latex $<
	bibtex $(basename $<)
	latex $<
	latex $<

# %.ps: %.dvi
# 	dvips -o $@ $<

%.eps: %.asy
	asy -f eps -render 0 $<

kakeya.pdf: gnomonic.pdf circles.pdf filters.pdf
kakeya.dvi: gnomonic.eps circles.eps filters.eps
