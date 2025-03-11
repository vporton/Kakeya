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
	gs -q -dNOCACHE -dNOPAUSE -dBATCH -dSAFER -dNOTRANSPARENCY -sDEVICE=ps2write -sOutputFile=$@ $<

%.eps: %.asy
	asy -f eps -render 0 $<

kakeya.pdf: gnomonic.pdf