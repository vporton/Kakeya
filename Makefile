#!/usr/bin/make -f

kakeya.pdf:

%.pdf: %.tex
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<

%.pdf: %.asy
	asy -f pdf -render 0 $<

%.eps: %.asy
	asy -f eps -render 0 $<

kakeya.pdf: gnomonic.pdf