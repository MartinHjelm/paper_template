FILE = main

target:
	-@rm -rf  abstractmd.tex introduction.tex relatedwork.tex methodology.tex experiments.tex conclusion.tex todo.tex  2>/dev/null || true
	#rm abstractmd.tex introduction.tex relatedwork.tex methodology.tex experiments.tex conclusion.tex todo.tex 
	pandoc abstract.md -f markdown -t latex -o abstract.tex
	pandoc introduction.md -f markdown -t latex -o introduction.tex
	pandoc relatedwork.md -f markdown -t latex -o relatedwork.tex
	pandoc methodology.md -f markdown -t latex -o methodology.tex
	pandoc experiments.md -f markdown -t latex -o experiments.tex
	pandoc conclusion.md -f markdown -t latex -o conclusion.tex
	pandoc todo.md -f markdown -t latex -o todo.tex
	# pdflatex -shell-escape $(FILE)
	# biber $(FILE)
	# pdflatex -shell-escape $(FILE)
	ltx2any -lf pdf $(FILE)
pdf: *.tex
	ltx2any -lf pdf $(FILE)
	# pdflatex -shell-escape $(FILE)
bib:
	biber $(FILE)
clean: 
	-rm ./*.aux ./*.dvi ./*.blg ./*.log ./*.out ./*.toc ./*.spl ./*.tpt ./*.bbl ./$(FILE).pdf ./*~


