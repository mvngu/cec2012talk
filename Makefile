# Copyright (C) 2012 Minh Van Nguyen <mvngu.name@gmail.com>
# This work is licensed under a the GNU Free Documentation License version
# 1.3. For the full terms of the license, see
# http://www.gnu.org/licenses/fdl.html

FILE = talk
PLOT =

all:
	make pdf
	(BSTINPUTS=.:style:${BSTINPUTS:-:} && export BSTINPUTS && \
         bibtex $(FILE))
	make pdf
	make clean

clean:
	rm -rfv *~
	rm -rfv *.aux
	rm -rfv *.auxlock
	rm -rfv *.bak
	rm -rfv *.bbl
	rm -rfv *.blg
	rm -rfv *.dpth
	rm -rfv *.dvi
	rm -rfv *.log
	rm -rfv *.nav
	rm -rfv *.out
	rm -rfv *.ps
	rm -rfv *.snm
	rm -rfv *.toc
	rm -rfv *.vrb

plot:
	make pdf-plot
	make pdf-plot
	make clean
	mv $(PLOT)-figure0.pdf $(PLOT).pdf
	pdfcrop $(PLOT).pdf $(PLOT).pdf.tmp && mv $(PLOT).pdf.tmp $(PLOT).pdf

pdf:
	(TEXINPUTS=.:style:${TEXINPUTS:-:} && export TEXINPUTS && \
	 pdflatex -shell-escape $(FILE).tex)
	(TEXINPUTS=.:style:${TEXINPUTS:-:} && export TEXINPUTS && \
	 pdflatex -shell-escape $(FILE).tex)

pdf-plot:
	(TEXINPUTS=.:style:style/tex/context/third/pgf/basiclayer:style/tex/context/third/pgf/frontendlayer:style/tex/context/third/pgf/math:style/tex/context/third/pgf/systemlayer:style/tex/context/third/pgf/utilities:style/context/third/pgfplots:style/tex/generic/pgf/basiclayer:style/tex/generic/pgf/frontendlayer/svg:style/tex/generic/pgf/frontendlayer/tikz/libraries/circuits:style/tex/generic/pgf/frontendlayer/tikz/libraries/datavisualization:style/tex/generic/pgf/frontendlayer/tikz/libraries/graphs:style/tex/generic/pgf/frontendlayer/tikz/libraries:style/tex/generic/pgf/frontendlayer/tikz:style/tex/generic/pgf/libraries/datavisualization:style/tex/generic/pgf/libraries/decorations:style/tex/generic/pgf/libraries:style/tex/generic/pgf/libraries/shapes/circuits:style/tex/generic/pgf/libraries/shapes:style/tex/generic/pgf/math:style/tex/generic/pgf/modules:style/tex/generic/pgf/rendering:style/tex/generic/pgf/systemlayer:style/tex/generic/pgf/utilities:style/generic/pgfplots:style/generic/pgfplots/libs:style/generic/pgfplots/liststructure:style/generic/pgfplots/numtable:style/generic/pgfplots/oldpgfcompatib:style/generic/pgfplots/oldpgfplotscompatib:style/generic/pgfplots/sys:style/generic/pgfplots/util:style/latex/pgfplots:style/latex/pgfplots/libs:style/plain/pgfplots:style/tex/latex/pgf/basiclayer:style/tex/latex/pgf/compatibility:style/tex/latex/pgf/doc:style/tex/latex/pgf/frontendlayer/libraries:style/tex/latex/pgf/frontendlayer:style/tex/latex/pgf/math:style/tex/latex/pgf/systemlayer:style/tex/latex/pgf/utilities:style/tex/plain/pgf/basiclayer:style/tex/plain/pgf/frontendlayer:style/tex/plain/pgf/math:style/tex/plain/pgf/systemlayer:style/tex/plain/pgf/utilities:${TEXINPUTS:-:} && export TEXINPUTS && \
	 pdflatex -shell-escape $(PLOT).tex)
	(TEXINPUTS=.:style:style/tex/context/third/pgf/basiclayer:style/tex/context/third/pgf/frontendlayer:style/tex/context/third/pgf/math:style/tex/context/third/pgf/systemlayer:style/tex/context/third/pgf/utilities:style/context/third/pgfplots:style/tex/generic/pgf/basiclayer:style/tex/generic/pgf/frontendlayer/svg:style/tex/generic/pgf/frontendlayer/tikz/libraries/circuits:style/tex/generic/pgf/frontendlayer/tikz/libraries/datavisualization:style/tex/generic/pgf/frontendlayer/tikz/libraries/graphs:style/tex/generic/pgf/frontendlayer/tikz/libraries:style/tex/generic/pgf/frontendlayer/tikz:style/tex/generic/pgf/libraries/datavisualization:style/tex/generic/pgf/libraries/decorations:style/tex/generic/pgf/libraries:style/tex/generic/pgf/libraries/shapes/circuits:style/tex/generic/pgf/libraries/shapes:style/tex/generic/pgf/math:style/tex/generic/pgf/modules:style/tex/generic/pgf/rendering:style/tex/generic/pgf/systemlayer:style/tex/generic/pgf/utilities:style/generic/pgfplots:style/generic/pgfplots/libs:style/generic/pgfplots/liststructure:style/generic/pgfplots/numtable:style/generic/pgfplots/oldpgfcompatib:style/generic/pgfplots/oldpgfplotscompatib:style/generic/pgfplots/sys:style/generic/pgfplots/util:style/latex/pgfplots:style/latex/pgfplots/libs:style/plain/pgfplots:style/tex/latex/pgf/basiclayer:style/tex/latex/pgf/compatibility:style/tex/latex/pgf/doc:style/tex/latex/pgf/frontendlayer/libraries:style/tex/latex/pgf/frontendlayer:style/tex/latex/pgf/math:style/tex/latex/pgf/systemlayer:style/tex/latex/pgf/utilities:style/tex/plain/pgf/basiclayer:style/tex/plain/pgf/frontendlayer:style/tex/plain/pgf/math:style/tex/plain/pgf/systemlayer:style/tex/plain/pgf/utilities:${TEXINPUTS:-:} && export TEXINPUTS && \
	 pdflatex -shell-escape $(PLOT).tex)
