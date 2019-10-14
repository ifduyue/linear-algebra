# Makefile
# For Linear Algebra by Jim Hefferon joshua.smcvt.edu/linearalgebra
# 2019-Oct-10 JH GPL 2

# SRC_DIR  Full path for src/
#  From http://timmurphy.org/2015/09/27/how-to-get-a-makefile-directory-path/
SRC_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

# TEXINPUTS
#  String giving location of .sty files, etc.
#  Note that because SRC_DIR ends with a slash, the slash here makes there
# be two slashes, which causes TeX to search all subdirs of SRC_DIR.  Note
# also that here the "$(TEXINPUTS)" refers to the environment variable.
TEXINPUTS := "TEXINPUTS=$(SRC_DIR)/:$(TEXINPUTS)"

# ASYMPTOTE_DIR
#  Asymptote uses this to look for config and imported files.
#  Note that because SRC_DIR ends with a slash, the slash here makes there
# be two slashes, which causes a search of all subdirs of SRC_DIR.   Note
# also that here the "$(ASYMPTOTE_DIR)" refers to the environment variable.
ASYMPTOTE_DIR := "ASYMPTOTE_DIR=$(SRC_DIR)/asy//:$(ASYMPTOTE_DIR)"

# LaTeX compiler
LATEX := pdflatex

# LaTeX command line
#  The command line used to invoke LaTeX.  Set the environment, then call
# the program.
LATEX_CMD := $(TEXINPUTS) $(LATEX) 

# MetaPost environment variable
# MPINPUTS := ""

# Metapost command line.
#   Metapost makes graphics. I used to use it exclusively but lately
# use Asymptote.  Still, there is a lot of MetaPost in here.
METAPOST_CMD := mpost

# Asymptote command line.
# Asymptote to make graphics (newer and especially 3D graphics)
# Set the environment and then call the program.
# Options:
#   -nosafe gets around GhostScript error when using opacity:
#      https://github.com/vectorgraphics/asymptote/issues/77
#  -vv makes it talk more
ASYMPTOTE_CMD := $(TEXINPUTS) $(ASYMPTOTE_DIR) asy -nosafe -vv

vpath %.tex src cover pref gr vs map det jc appen bib

.PHONY : all clean book slides lab cover_asy \
           gr_mp vs_mp map_mp det_asy det_mp jc_asy jc_mp appen_asy

all : book slides lab

book : book.pdf

book.pdf : book.tex cover pref gr vs map det jc appen bib
	$(LATEX_CMD) book

# Cover and Preface
cover : cover/covernew.tex cover/symlist.tex cover/titlepage.tex cover_asy

cover_asy : cover/asy/axes.pdf cover/asy/shadow.pdf

cover/asy/axes.pdf cover/asy/shadow.pdf : cover/asy/axes.asy 
	cd $(dir $@);\
        $(ASYMPTOTE_CMD) $^ 

pref : pref.tex


# Chapter One
#  Need to compile what is in gr/bin?
gr : gr/*.tex gr_mp

gr_mp : gr/mp/ch1.1

gr/mp/ch1.1 : gr/mp/ch1.mp 
	cd $(dir $@);\
        $(METAPOST_CMD) $^ 


# Chapter Two
vs : vs/*.tex vs_mp

vs_mp : vs/mp/ch2.1 vs/mp/voting.1

vs/mp/ch2.1 : vs/mp/ch2.mp
	cd $(dir $@);\
        $(METAPOST_CMD) $^ 

vs/mp/voting.1 : vs/mp/voting.mp
	cd $(dir $@);\
        $(METAPOST_CMD) $^ 


# Chapter Three
#  Need to compile what is in map/bin?
map : map/*.tex map_mp

map_mp : map/mp/ch3.1

map/mp/ch3.1 : map/mp/ch3.mp
	cd $(dir $@);\
        $(METAPOST_CMD) $^ 


# Chapter Four
det : det/*.tex det_asy det_mp

det_asy : det/asy/ppiped.pdf 

det/asy/ppiped.pdf : det/asy/ppiped.asy 
	cd $(dir $@);\
        $(ASYMPTOTE_CMD) $^ 

det_mp : det/mp/ch4.1

det/mp/ch4.1 : det/mp/ch4.mp
	cd $(dir $@);\
        $(METAPOST_CMD) $^ 


# Chapter Five
jc : jc/*.tex jc_asy jc_mp

jc_asy : jc/asy/wilber.pdf

jc/asy/wilber.pdf : jc/asy/wilber.asy 
	cd $(dir $@);\
        $(ASYMPTOTE_CMD) $^ 

jc_mp : jc/mp/ch5.1

jc/mp/ch5.1 : jc/mp/ch5.mp
	cd $(dir $@);\
        $(METAPOST_CMD) $^ 


# Appendix and Bibliography
appen: appen/appen.tex appen_asy

appen_asy: appen/mp/appen.1

appen/mp/appen.1 : appen/mp/appen.mp
	cd $(dir $@);\
        $(METAPOST_CMD) $^ 

bib : bib/bib.tex



default :
	@echo $(ASYMPTOTE_DIR)
	@echo $(TEXINPUTS)




# book.pdf: cover symlist pref gr vs map det jc appen bib

# gr: gr1.tex gr2.tex gr3.tex cas.tex leontief.tex ppivot.tex network.tex
