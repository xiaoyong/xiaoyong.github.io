cv_chs = cv_chs.pdf cv_chs_research_bioinf.pdf cv_chs_research_cs.pdf cv_chs_IT.pdf cv_chs_edu.pdf cv_chs_programmer.pdf cv_chs_sa.pdf
cv_eng = cv_eng.pdf
all: $(cv_chs) $(cv_eng)

%.pdf: %.tex publications.bib xiaoyong.jpg research_experience_long.tex research_experience_short.tex
	latexmk -xelatex -quiet $<

cv_chs_research_cs.tex: cv_chs_research_bioinf.tex
	sed -e 's/同时具有夯实的生物学基础.*遗传学等。/熟悉数据结构、算法设计与分析。/' -e 's/，生理学方向//' cv_chs_research_bioinf.tex > cv_chs_research_cs.tex

cv_chs_research_bioinf.tex: cv_chs.tex
	grep -v '\cvitem{网页开发}' cv_chs.tex > cv_chs_research_bioinf.tex

cv_chs_sa.tex: cv_chs.tex
	sed -e 's/research_experience_long/research_experience_short/' -e 's/同时具有夯实的生物学基础.*遗传学等。/熟悉数据结构、算法设计与分析。/' -e 's/计算机技能/系统管理/' -e 's/通过.*排版软件。/多年的Linux（桌面和服务器）使用经验，Arch Linux粉丝；在VPS上配置管理过Web服务器，数据库服务器等；熟悉并喜爱Linux下的开发工具（Git，Vim，Make，Screen等）；Linux系统管理员一直是我的理想职业。/' cv_chs.tex > cv_chs_sa.tex

cv_chs_IT.tex: cv_chs.tex
	sed -e 's/同时具有夯实的生物学基础.*遗传学等。/熟悉数据结构、算法设计与分析。/' cv_chs.tex > cv_chs_IT.tex

.PHONY: clean

clean:
	latexmk -c
