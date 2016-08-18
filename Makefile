
# NOMES
TEXFILE=main.tex
PACKNAME=$(shell basename `pwd`)

# REGRAS
PDFFILE=$(TEXFILE:%.tex=%.pdf)

all: main.dvi

main.dvi: main.tex
	latex $(@:%.dvi=%.tex)
	bibtex $(@:%.dvi=%)
	latex $(@:%.dvi=%.tex)
	latex $(@:%.dvi=%.tex)
	dvips -t a4 -o $*.ps $*.dvi
	ps2pdf $*.ps
	@rm -fr $*.ps $*.dvi

clean:
	@rm -vf *.aux *.glo *.gls *.glg *.out *.brf *.ist *.backup
	@rm -vf *.lo[gtfa] *.toc *.idx *.inc *.ilg *.ind *.bbl *.blg
	@find . -name "*.bak" -exec rm -fv {} \;
	@find . -name "*~" -exec rm -fv {} \;
	@find . -name "*.aux" -exec rm -fv {} \;

deepclean: clean
	@rm -vf main.dvi main.ps main.pdf

