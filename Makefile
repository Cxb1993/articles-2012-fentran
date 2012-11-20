
# NOMES
TEXFILE=main.tex
PACKNAME=$(shell basename `pwd`)

# REGRAS
PDFFILE=$(TEXFILE:%.tex=%.pdf)

all: main.pdf

main.pdf: main.tex
	pdflatex $(@:%.pdf=%.tex)
	bibtex $(@:%.pdf=%)
	pdflatex $(@:%.pdf=%.tex)
	pdflatex $(@:%.pdf=%.tex)

clean:
	@rm -vf *.aux *.glo *.gls *.glg *.out *.brf *.ist *.backup
	@rm -vf *.lo[gtfa] *.toc *.idx *.inc *.ilg *.ind *.bbl *.blg
	@find . -name "*.bak" -exec rm -fv {} \;
	@find . -name "*~" -exec rm -fv {} \;
	@find . -name "*.aux" -exec rm -fv {} \;

deepclean:
	@rm -vf *.aux *.glo *.gls *.glg *.dvi *.ps *.out *.brf *.ist *.spl
	@rm -vf index.pdf main.pdf
	@rm -fr submit
	@rm -vf *.lo[gtfa] *.toc *.idx *.inc *.ilg *.ind *.bbl *.blg *.backup
	@find . -name "*.bak" -exec rm -fv {} \;
	@find . -name "*~" -exec rm -fv {} \;
	@find . -name "*.aux" -exec rm -fv {} \;
