MASTER=Semesterarbeit_Lennart_Schink

default: pdf

clean:
	-rm $(MASTER).blg
	-rm $(MASTER).glg
	-rm $(MASTER).ilg
	-rm $(MASTER).log
	-rm $(MASTER).out

distclean: clean
	-rm $(MASTER).aux
	-rm ./Kapitel/*.aux
	-rm $(MASTER).bbl
	-rm $(MASTER).dvi
	-rm $(MASTER).glo
	-rm $(MASTER).fls
	-rm $(MASTER).fdb_latexmk
	-rm $(MASTER).gls
	-rm $(MASTER).glsdefs
	-rm $(MASTER).nls
	-rm $(MASTER).idx
	-rm $(MASTER).ind
	-rm $(MASTER).ist
	-rm $(MASTER).lof
	-rm $(MASTER).lol
	-rm $(MASTER).lot
	-rm $(MASTER).nlo
	-rm $(MASTER).nls
	-rm $(MASTER).toc
	-rm ./*~ ./*.bak
	-rm ./Kaptitel/*~
	-rm ./Einstellungen/*~

clean-emacs: distclean
	-rm -R auto
	-rm -R ./Einstellungen/auto
	-rm -R ./Kaptitel/auto

backup: clean-emacs
	cd .. && \
	zip -r MRT-Bericht-LaTeX-$(shell date '+%Y-%m-%d').zip LaTeX/

dist:	backup
	cp ../MRT-Bericht-LaTeX-$(shell date '+%Y-%m-%d').zip  ../MRT-Bericht-LaTeX.zip


pdf:	$(MASTER).tex
	pdflatex $(MASTER)
	pdflatex $(MASTER)
	makeindex $(MASTER).nlo -s nomencl.ist -o $(MASTER).nls
	makeindex $(MASTER)
	-makeglossaries $(MASTER)
	bibtex $(MASTER)
	pdflatex $(MASTER)
	pdflatex $(MASTER)
