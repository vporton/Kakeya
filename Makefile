#!/usr/bin/make -f

%.pdf: %.tex
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<

%.pdf: %.asy
	asy $<