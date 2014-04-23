cv_chs = cv_chs.pdf cv_chs_edu.pdf cv_chs_programmer.pdf cv_chs_sa.pdf
cv_eng = cv_eng.pdf
all: $(cv_chs) $(cv_eng)

%.pdf: %.tex publications.bib xiaoyong.jpg research_experience_long.tex research_experience_short.tex
	latexmk -xelatex -quiet $<

cv_chs_sa.tex: cv_chs.tex
	sed -e 's/research_experience_long/research_experience_short/' -e 's/网页开发/系统管理/' -e 's/熟悉前端.*配置和使用。/多年的Linux（桌面和服务器）使用经验，Arch Linux粉丝；在VPS上配置管理过Web服务器，数据库服务器等；熟悉并喜爱Linux下的开发工具（Git，Vim，Make，Screen等）；Linux系统管理员一直是我的理想职业。/' cv_chs.tex > cv_chs_sa.tex

.PHONY: clean

clean:
	latexmk -c
