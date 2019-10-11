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
TEXINPUTS := "$(SRC_DIR)/:$(TEXINPUTS)"

# ASYMPTOTE_DIR
#  Asymptote uses this to look for config and imported files.
#  Note that because SRC_DIR ends with a slash, the slash here makes there
# be two slashes, which causes a search of all subdirs of SRC_DIR.   Note
# also that here the "$(ASYMPTOTE_DIR)" refers to the environment variable.
ASYMPTOTE_DIR := "$(SRC_DIR)/asy//:$(ASYMPTOTE_DIR)"

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

.PHONY: all clean book slides lab cover_asy

all: book slides lab

book: book.pdf

book.pdf: book.tex cover pref gr vs map det jc appen bib

cover: cover/*.tex cover_asy

cover_asy: cover/asy/%.pdf

cover/asy/%.pdf: cover/asy/%.pdf 
	echo "dollar sign at-sign is " $@
	# cd $(dir $@);\
        # $(ASYMPTOTE_CMD) $@ 

default:
	@echo $(ASYMPTOTE_DIR)
	@echo $(TEXINPUTS)





# book.pdf: cover symlist pref gr vs map det jc appen bib

# gr: gr1.tex gr2.tex gr3.tex cas.tex leontief.tex ppivot.tex network.tex
