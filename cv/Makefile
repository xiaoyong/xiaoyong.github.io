cv_chs = cv_chs.pdf cv_chs_research.pdf cv_chs_IT.pdf
cv_eng = cv_eng.pdf
all: $(cv_chs) $(cv_eng)

%.pdf: %.tex publications.bib xiaoyong.jpg
	latexmk -xelatex -quiet $<

cv_chs_research.tex: cv_chs.tex
	grep -v '\cvitem{网页开发}' cv_chs.tex > cv_chs_research.tex

cv_chs_IT.tex: cv_chs.tex
	sed -e 's/同时具有夯实的生物学基础.*遗传学等。//' cv_chs.tex > cv_chs_IT.tex

.PHONY: clean

clean:
	latexmk -c
