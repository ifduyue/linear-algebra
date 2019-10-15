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
TEXINPUTS := TEXINPUTS=$(SRC_DIR)/:$(TEXINPUTS)

# ASYMPTOTE_DIR
#  Asymptote uses this to look for config and imported files.
#  Note that because SRC_DIR ends with a slash, the slash here makes there
# be two slashes, which causes a search of all subdirs of SRC_DIR.   Note
# also that here the "$(ASYMPTOTE_DIR)" refers to the environment variable.
ASYMPTOTE_DIR := ASYMPTOTE_DIR=$(SRC_DIR)/asy//:$(ASYMPTOTE_DIR)

# LaTeX compiler
LATEX := pdflatex

# LaTeX command line
#  The command line used to invoke LaTeX.  Set the environment, then call
# the program.
LATEX_CMD := $(LATEX) 

# MetaPost environment variable
# (SRC_DIR has an ending /)
MPINPUTS := MPINPUTS=$(SRC_DIR)mp//:

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
ASYMPTOTE_CMD := asy -nosafe -vv

# vpath %.tex src cover pref gr vs map det jc appen bib


.PHONY : all
all : book.pdf slides lab

# .PHONY : book
# book : book.pdf

book.pdf : book.tex cover pref gr vs map det jc appen bib
	$(TEXINPUTS) $(LATEX_CMD) book.tex

# Cover and Preface
.PHONY : cover
cover : cover/covernew.tex cover/symlist.tex cover/titlepage.tex cover_asy

.PHONY : cover_asy
cover_asy : cover/asy/axes.pdf cover/asy/shadow.pdf

cover/asy/axes.pdf cover/asy/shadow.pdf : cover/asy/axes.asy 
	$(TEXINPUTS) $(ASYMPTOTE_DIR) \
        cd $(dir $@);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $@)) 

.PHONY : pref
pref : pref/pref.tex

pref/pref.tex :

# Chapter One
#  Need to compile what is in gr/bin?
.PHONY : gr
gr : gr/*.tex gr_mp

.PHONY : gr_mp
gr_mp : gr/mp/ch1.1

gr/mp/ch1.1 : gr/mp/ch1.mp
	cd $(dir $@);\
	$(TEXINPUTS) $(MPINPUTS) $(METAPOST_CMD) $(notdir $(basename $@)) 


# Chapter Two
.PHONY : vs
vs : vs/*.tex vs_mp

.PHONY : vs_mp
vs_mp : vs/mp/ch2.1 vs/mp/voting.1

vs/mp/ch2.1 : vs/mp/ch2.mp
	cd $(dir $@);\
        $(TEXINPUTS) $(MPINPUTS) $(METAPOST_CMD)  $(notdir $(basename $@))

vs/mp/voting.1 : vs/mp/voting.mp
	cd $(dir $@);\
        $(TEXINPUTS) $(MPINPUTS) $(METAPOST_CMD)  $(notdir $(basename $@))


# Chapter Three
#  Need to compile what is in map/bin?
.PHONY : map
map : map/*.tex map_mp

.PHONY : map_mp
map_mp : map/mp/ch3.1

map/mp/ch3.1 : map/mp/ch3.mp
	cd $(dir $@);\
        $(TEXINPUTS) $(MPINPUTS) $(METAPOST_CMD)  $(notdir $(basename $@))


# Chapter Four
.PHONY : det
det : det/*.tex det_asy det_mp

.PHONY : det_asy
det_asy : det/asy/ppiped.pdf 

det/asy/ppiped.pdf : det/asy/ppiped.asy 
	$(TEXINPUTS) $(ASYMPTOTE_DIR) \
	cd $(dir $@);\
        $(ASYMPTOTE_CMD) $^ 

.PHONY : det_mp
det_mp : det/mp/ch4.1

det/mp/ch4.1 : det/mp/ch4.mp
	cd $(dir $@);\
        $(TEXINPUTS) $(MPINPUTS) $(METAPOST_CMD)  $(notdir $(basename $@))


# Chapter Five
.PHONY : jc
jc : jc/*.tex jc_asy jc_mp

.PHONY : jc_asy
jc_asy : jc/asy/wilber.pdf

jc/asy/wilber.pdf : jc/asy/wilber.asy 
	$(TEXINPUTS) $(ASYMPTOTE_DIR) \
	cd $(dir $@);\
        $(ASYMPTOTE_CMD) $^ 

.PHONY : jc_mp
jc_mp : jc/mp/ch5.1

jc/mp/ch5.1 : jc/mp/ch5.mp
	cd $(dir $@);\
        $(TEXINPUTS) $(MPINPUTS) $(METAPOST_CMD)  $(notdir $(basename $@))


# Appendix and Bibliography
.PHONY : appen
appen: appen/appen.tex appen_asy

.PHONY : appen_asy
appen_asy: appen/mp/appen.1

appen/mp/appen.1 : appen/mp/appen.mp
	cd $(dir $@);\
        $(TEXINPUTS) $(MPINPUTS) $(METAPOST_CMD)  $(notdir $(basename $@))

.PHONY : bib
bib : bib/bib.tex

bib/bib.tex :



default :
	@echo $(ASYMPTOTE_DIR)
	@echo $(TEXINPUTS)




# book.pdf: cover symlist pref gr vs map det jc appen bib

# gr: gr1.tex gr2.tex gr3.tex cas.tex leontief.tex ppivot.tex network.tex
