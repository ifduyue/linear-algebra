# Makefile
# For Linear Algebra by Jim Hefferon joshua.smcvt.edu/linearalgebra
# 2019-Oct-10 JH GPL 2
# 2021-Sep-09 JH Because of Asymptote's interactions with bad ghostscript
#    versions, I am temporarily adding some of the PDF's to the git, and
#    commenting out the commands to make them.

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
ASYMPTOTE_DIR := ASYMPTOTE_DIR=$(SRC_DIR)/asy//:$(SRC_DIR)/asy/asy-graphtheory-master/modules//:$(ASYMPTOTE_DIR)

# LaTeX compiler
LATEX := pdflatex

# LaTeX command line
#  The command line used to invoke LaTeX.  Set the environment, then call
# the program.  Trigger hardcopy with "make hardcopy=1"
ifdef hardcopy
  LATEX_CMD := $(TEXINPUTS) $(LATEX) "\def\hardcopy{}\input{book}"
else
  LATEX_CMD := $(TEXINPUTS) $(LATEX) 
endif

# MetaPost environment variable
# (SRC_DIR has an ending /)
MPINPUTS := MPINPUTS=$(SRC_DIR)mp//:

# Metapost command line.
#   Metapost makes graphics. I used to use it exclusively but lately
# use Asymptote.  Still, there is a lot of MetaPost in here.
METAPOST_CMD := $(TEXINPUTS) $(MPINPUTS) mpost

# Asymptote command line.
# Asymptote to make graphics (newer and especially 3D graphics)
# Set the environment and then call the program.
# Options:
#   -nosafe gets around GhostScript error when using opacity:
#      https://github.com/vectorgraphics/asymptote/issues/77
#  -vv makes it talk more
ASYMPTOTE_CMD := $(TEXINPUTS) $(ASYMPTOTE_DIR) asy -nosafe -vv

# Makeindex command line.
MAKEINDEX_CMD := makeindex -s sty/book.isty

# Command for making a .zip file, for the slides.
ZIP_CMD := zip



.PHONY : all
all : book.pdf slides lab answers

# .PHONY : book
# book : book.pdf

book.pdf : book.tex cover pref gr vs map det jc appen bib
	$(LATEX_CMD) book.tex
	$(MAKEINDEX_CMD) book
	$(LATEX_CMD) book.tex


# Cover and Preface
.PHONY : cover
cover : cover/cover.tex cover/symlist.tex cover/titlepage.tex cover_asy
	$(LATEX_CMD) cover/cover.tex

.PHONY : cover_asy
cover_asy : cover/asy/axesgraphic.pdf cover/asy/shadow.pdf

cover/asy/axesgraphic.pdf : cover/asy/axesgraphic.asy 
	echo "axesgraphic.pdf is in git until PBR is working for me"
        # $(TEXINPUTS) $(ASYMPTOTE_DIR) \
        # cd $(dir $@);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $@)) 
cover/asy/shadow.pdf : cover/asy/shadow.asy 
	echo "shadow.pdf is in git until PBR is working for me"
        # $(TEXINPUTS) $(ASYMPTOTE_DIR) \
        # cd $(dir $@);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $@)) 


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
	$(METAPOST_CMD) $(notdir $(basename $@)) 


# Chapter Two
.PHONY : vs
vs : vs/*.tex vs_mp

.PHONY : vs_mp
vs_mp : vs/mp/ch2.1 vs/mp/voting.1

vs/mp/ch2.1 : vs/mp/ch2.mp
	cd $(dir $@);\
        $(METAPOST_CMD)  $(notdir $(basename $@))

vs/mp/voting.1 : vs/mp/voting.mp
	cd $(dir $@);\
        $(METAPOST_CMD)  $(notdir $(basename $@))


# Chapter Three
#  Need to compile what is in map/bin?
.PHONY : map
map : map/*.tex map_mp

.PHONY : map_mp
map_mp : map/mp/ch3.1

map/mp/ch3.1 : map/mp/ch3.mp
	cd $(dir $@);\
        $(METAPOST_CMD)  $(notdir $(basename $@))


# Chapter Four
.PHONY : det
det : det/*.tex det_asy det_mp

.PHONY : det_asy
det_asy : det/asy/ppiped.pdf 

det/asy/ppiped.pdf : det/asy/ppiped.asy 
	cd $(dir $@);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $@))

.PHONY : det_mp
det_mp : det/mp/ch4.1

det/mp/ch4.1 : det/mp/ch4.mp
	cd $(dir $@);\
        $(METAPOST_CMD)  $(notdir $(basename $@))


# Chapter Five
.PHONY : jc
jc : jc/*.tex jc_asy jc_mp

.PHONY : jc_asy
jc_asy : jc/asy/wilber.pdf jc/asy/innerproduct000.pdf

jc/asy/wilber.pdf : jc/asy/wilber.asy 
	cd $(dir $@);\
        $(ASYMPTOTE_CMD)  $(notdir $(basename $@))

jc/asy/innerproduct000.pdf : jc/asy/innerproduct.asy 
	cd $(dir $@);\
        $(ASYMPTOTE_CMD)  $(subst 000,,$(notdir $(basename $@))) # strip out 000

.PHONY : jc_mp
jc_mp : jc/mp/ch5.1

jc/mp/ch5.1 : jc/mp/ch5.mp
	cd $(dir $@);\
        $(METAPOST_CMD)  $(notdir $(basename $@))


# Appendix and Bibliography
.PHONY : appen
appen: appen/appen.tex appen_asy

.PHONY : appen_asy
appen_asy: appen/mp/appen.1

appen/mp/appen.1 : appen/mp/appen.mp
	cd $(dir $@);\
        $(METAPOST_CMD)  $(notdir $(basename $@))

.PHONY : bib
bib : bib/bib.tex

bib/bib.tex :

# .PHONY : makeindex
# makeindex : book.idx
# 	$(MAKEINDEX_CMD) book 




# =============== answers =====================

.PHONY : answers
answers: jhanswer.pdf

jhanswer.pdf : book.pdf cover pref gr vs map det jc appen bib
	$(LATEX_CMD) jhanswer.tex




# =============== Slides =====================

# Slides come in groups of three.  For instance, slides/one_i.pdf is the
# slide deck I use, where in some cases I substitute an example for a proof.
# And, slides/one_i_allproofs.pdf is the deck with the proofs put back in.
# Then, slides/one_i_handout.pdf is the deck with the \pause command
# turned off, for people to print out.
define compile-slides
  cd $(dir $@);\
  $(LATEX_CMD) $(notdir $(basename $@));\
  $(LATEX_CMD) $(notdir $(basename $@))_allproofs;\
  $(LATEX_CMD) $(notdir $(basename $@))_handout;\
  cd ../..;\
  $(ZIP_CMD) slides slides/README;\
  $(ZIP_CMD) slides $@;\
  $(ZIP_CMD) slides $(basename $@)_allproofs.pdf;\
  $(ZIP_CMD) slides $(basename $@)_handout.pdf; 
endef

slides : slides_one slides_two slides_three slides_four slides_five \
  slides/README

# Slides for Chapter One
.PHONY : slides_one
slides_one : slides_one_asy slides/one/one_i.pdf slides/one/one_ii.pdf\
  slides/one/one_iii.pdf

.PHONY : slides_one_asy
slides_one_asy : slides/one/asy/one_ii_plane.pdf

slides/one/asy/one_ii_plane.pdf : slides/one/asy/one_ii_plane.asy
	echo "two/asy/two_i_a_plane.pdf is in git; see README.opacity"
        # cd $(dir $@);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $@))

slides/one/one_i.pdf : slides/one/one_i.tex slides/one/one_i_main.tex gr/gr1.tex
	$(compile-slides)

slides/one/one_ii.pdf : slides/one/one_ii.tex slides/one/one_ii_main.tex gr/gr2.tex
	$(compile-slides)

slides/one/one_iii.pdf : slides/one/one_iii.tex slides/one/one_iii_main.tex gr/gr3.tex
	$(compile-slides)


# Slides for Chapter Two
# I've folded slides/two/two_i_a.pdf into two_i.tex
.PHONY : slides_two
slides_two : slides_two_asy slides/two/two_i.pdf  \
  slides/two/two_ii.pdf \
  slides/two/two_iii.pdf

.PHONY : slides_two_asy
slides_two_asy : slides/two/asy/p2_subspaces.pdf \
  slides/two/asy/two_i_a_plane.pdf \
  slides/two/asy/p2_subspaces_spans.pdf \
  slides/two/asy/two_i_line_slope_two.pdf \
  slides/two/asy/r3_subspaces.pdf \
  slides/two/asy/two_i_plane.pdf \
  slides/two/asy/r3_subspaces_spans.pdf \
  slides/two/asy/two_i_spanplane.pdf \
  slides/two/asy/two_i_a_line.pdf

# == start of section added for opacity problems

# commented this out to do them one at a time
# slides/two/asy/%.pdf : slides/two/asy/%.asy 
# 	cd $(dir $@);\
#         $(ASYMPTOTE_CMD) $(notdir $(basename $@))

slides/two/asy/p2_subspaces.pdf : slides/two/asy/p2_subspaces.asy
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/two/asy/p2_subspaces_spans.pdf : slides/two/asy/p2_subspaces_spans.asy
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/two/asy/r3_subspaces.pdf : slides/two/asy/r3_subspaces.asy
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/two/asy/r3_subspaces_spans.pdf : slides/two/asy/r3_subspaces_spans.asy
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/two/asy/two_i_a_line.pdf : slides/two/asy/two_i_a_line.asy
	echo "two/asy/two_i_a_line.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/two/asy/two_i_a_plane.pdf : slides/two/asy/two_i_a_plane.asy
	echo "two/asy/two_i_a_plane.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/two/asy/two_i_line_slope_two.pdf : slides/two/asy/two_i_line_slope_two.asy
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/two/asy/two_i_plane.pdf : slides/two/asy/two_i_plane.asy
	echo "two/asy/two_i_plane.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/two/asy/two_i_spanplane.pdf : slides/two/asy/two_i_spanplane.asy
	echo "two/asy/two_i_spanplane.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

# == end of section added for opacity problems

slides/two/two_i.pdf : slides/two/two_i.tex slides/two/two_i_main.tex vs/vs1.tex
	$(compile-slides)

slides/two/two_ii.pdf : slides/two/two_ii.tex slides/two/two_ii_main.tex vs/vs2.tex
	$(compile-slides)

slides/two/two_iii.pdf : slides/two/two_iii.tex slides/two/two_iii_main.tex vs/vs3.tex
	$(compile-slides)

# slides/two/%.pdf : slides/two/%.tex gr/
# 	$(compile-slides)


# Slides for Chapter Three
.PHONY : slides_three
slides_three : slides_three_asy slides/three/three_i.pdf  \
  slides/three/three_ii.pdf \
  slides/three/three_iii.pdf \
  slides/three/three_iv.pdf \
  slides/three/three_v.pdf \
  slides/three/three_vi.pdf

.PHONY : slides_three_asy
slides_three_asy : slides/three/asy/three_ii_3dproj1.pdf \
  slides/three/asy/three_ii_3dproj2.pdf \
  slides/three/asy/three_ii_3dproj3.pdf \
  slides/three/asy/three_ii_dims.pdf \
  slides/three/asy/three_ii_inv_img00.pdf \
  slides/three/asy/three_ii_kernel.pdf \
  slides/three/asy/three_ii_proj_2d00.pdf \
  slides/three/asy/three_ii_rotate_basis.pdf \
  slides/three/asy/three_ii_rotate_prod_after.pdf \
  slides/three/asy/three_ii_rotate_prod_before.pdf \
  slides/three/asy/three_ii_rotate_sum_after.pdf \
  slides/three/asy/three_ii_rotate_sum_before.pdf \
  slides/three/asy/three_i_line.pdf \
  slides/three/asy/three_i_plane.pdf \
  slides/three/asy/three_vi_2dmutuallyortho.pdf \
  slides/three/asy/three_vi_3dgramschmidt0.pdf \
  slides/three/asy/three_vi_3dgramschmidt1.pdf \
  slides/three/asy/three_vi_3dprojtoline.pdf 
  # redundant: 
  # slides/three/asy/three_ii_inv_img01.pdf \
  # slides/three/asy/three_ii_inv_img02.pdf \
  # slides/three/asy/three_ii_inv_img03.pdf \
  # slides/three/asy/three_ii_inv_img04.pdf \
  # slides/three/asy/three_ii_inv_img05.pdf \
  # slides/three/asy/three_ii_inv_img06.pdf \
  # slides/three/asy/three_ii_proj_2d01.pdf \
  # slides/three/asy/three_ii_proj_2d02.pdf \
  # slides/three/asy/three_ii_proj_2d03.pdf \
  # slides/three/asy/three_ii_proj_2d04.pdf \
  # slides/three/asy/three_ii_proj_2d05.pdf \
  # slides/three/asy/three_ii_proj_2d06.pdf \


# == start of section added for opacity problems

# Commented out to do one at a time for opacity reasons
# slides/three/asy/%.pdf : slides/three/asy/%.asy
# 	cd $(dir $@);\
#         $(ASYMPTOTE_CMD) $(notdir $(basename $@))

slides/three/asy/three_ii_3dproj1.pdf : slides/three/asy/three_ii_3dproj1.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_3dproj2.pdf : slides/three/asy/three_ii_3dproj2.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_3dproj3.pdf : slides/three/asy/three_ii_3dproj3.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_dims.pdf : slides/three/asy/three_ii_dims.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_inv_img00.pdf : slides/three/asy/three_ii_inv_img.asy 
	echo "three/asy/three_ii_inv_img*.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_kernel.pdf : slides/three/asy/three_ii_kernel.asy 
	echo "three/asy/three_ii_kernel.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_proj_2d00.pdf : slides/three/asy/three_ii_proj_2d.asy
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_rotate_basis.pdf : slides/three/asy/three_ii_rotate_basis.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_rotate_prod_after.pdf : slides/three/asy/three_ii_rotate_prod_after.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_rotate_prod_before.pdf : slides/three/asy/three_ii_rotate_prod_before.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_rotate_sum_after.pdf : slides/three/asy/three_ii_rotate_sum_after.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_ii_rotate_sum_before.pdf : slides/three/asy/three_ii_rotate_sum_before.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_i_line.pdf : slides/three/asy/three_i_line.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_i_plane.pdf : slides/three/asy/three_i_plane.asy 
	echo "three/asy/three_i_plane.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_vi_2dmutuallyortho.pdf : slides/three/asy/three_vi_2dmutuallyortho.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_vi_3dgramschmidt0.pdf : slides/three/asy/three_vi_3dgramschmidt0.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_vi_3dgramschmidt1.pdf : slides/three/asy/three_vi_3dgramschmidt1.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/three/asy/three_vi_3dprojtoline.pdf : slides/three/asy/three_vi_3dprojtoline.asy 
	cd $(dir $<);\
        $(ASYMPTOTE_CMD) $(notdir $(basename $<))

# == end of section added for opacity problems

slides/three/three_i.pdf : slides/three/three_i.tex slides/three/three_i_main.tex map/map1.tex
	$(compile-slides)

slides/three/three_ii.pdf : slides/three/three_ii.tex slides/three/three_ii_main.tex map/map2.tex
	$(compile-slides)

slides/three/three_ii_a.pdf : slides/three/three_ii_a.tex slides/three/three_iia_main.tex map/map2.tex
	$(compile-slides)

slides/three/three_iii.pdf : slides/three/three_iii.tex slides/three/three_iii_main.tex map/map3.tex
	$(compile-slides)

slides/three/three_iv.pdf : slides/three/three_iv.tex slides/three/three_iv_main.tex map/map4.tex
	$(compile-slides)

slides/three/three_v.pdf : slides/three/three_v.tex slides/three/three_v_main.tex map/map5.tex
	$(compile-slides)

slides/three/three_vi.pdf : slides/three/three_vi.tex slides/three/three_vi_main.tex map/map6.tex
	$(compile-slides)

# slides/three/%.pdf : slides/three/%.tex
# 	$(compile-slides)


# Slides for Chapter Four
.PHONY : slides_four
slides_four : slides_four_asy \
  slides/four/four_i.pdf \
  slides/four/four_ii.pdf \
  slides/four/four_iii.pdf 

.PHONY : slides_four_asy
slides_four_asy : slides/four/asy/four_ii_2dtransedsizea.pdf \
  slides/four/asy/four_ii_2dtransedsizeb.pdf \
  slides/four/asy/four_ii_negvolbox.pdf \
  slides/four/asy/four_ii_orientation_neg0.pdf \
  slides/four/asy/four_ii_orientation.pdf \
  slides/four/asy/four_ii_orientation_pos.pdf
  # slides/four/asy/four_ii_orientation_neg10.pdf \
  # slides/four/asy/four_ii_orientation_neg1.pdf \
  # slides/four/asy/four_ii_orientation_neg2.pdf \
  # slides/four/asy/four_ii_orientation_neg3.pdf \
  # slides/four/asy/four_ii_orientation_neg4.pdf \
  # slides/four/asy/four_ii_orientation_neg5.pdf \
  # slides/four/asy/four_ii_orientation_neg6.pdf \
  # slides/four/asy/four_ii_orientation_neg7.pdf \
  # slides/four/asy/four_ii_orientation_neg8.pdf \
  # slides/four/asy/four_ii_orientation_neg9.pdf \


# == end of section added for opacity problems
# Commented out to handle them one at a time because of opacity problems
# slides/four/asy/%.pdf : slides/four/asy/%.asy
# 	cd $(dir $@);\
#         $(ASYMPTOTE_CMD) $(notdir $(basename $@))


slides/four/asy/four_ii_2dtransedsizea.pdf : slides/four/asy/four_ii_2dtransedsizea.asy
	echo "four/asy/four_ii_2dtransedsizea.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/four/asy/four_ii_2dtransedsizeb.pdf : slides/four/asy/four_ii_2dtransedsizeb.asy
	echo "four/asy/four_ii_2dtransedsizeb.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/four/asy/four_ii_negvolbox.pdf : slides/four/asy/four_ii_negvolbox.asy
	echo "four/asy/four_ii_negvolbox.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/four/asy/four_ii_orientation.pdf : slides/four/asy/four_ii_orientation.asy
	echo "four/asy/four_ii_orientation.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/four/asy/four_ii_orientation_neg0.pdf : slides/four/asy/four_ii_orientation_neg.asy
	echo "four_ii_orientation_neg0.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

slides/four/asy/four_ii_orientation_pos.pdf : slides/four/asy/four_ii_orientation_pos.asy
	echo "four/asy/four_ii_orientation_pos.pdf is in git; see README.opacity"
        # cd $(dir $<);\
        # $(ASYMPTOTE_CMD) $(notdir $(basename $<))

# == end of section added for opacity problems

slides/four/four_i.pdf : slides/four/four_i.tex slides/four/four_i_main.tex det/det1.tex 
	$(compile-slides)

slides/four/four_ii.pdf : slides/four/four_ii.tex slides/four/four_ii_main.tex det/det2.tex 
	$(compile-slides)

slides/four/four_iii.pdf : slides/four/four_iii.tex slides/four/four_iii_main.tex det/det3.tex 
	$(compile-slides)

# slides/four/%.pdf : slides/four/%.tex
# 	$(compile-slides)


# Slides for Chapter Five
.PHONY : slides_five
slides_five : slides_five_asy \
  slides/five/five_i.pdf \
  slides/five/five_ii.pdf \
  slides/five/five_ii_a.pdf 

.PHONY : slides_five_asy
slides_five_asy :

# slides/five/asy/%.pdf : slides/five/asy/%.asy
# 	cd $(dir $@);\
#         $(ASYMPTOTE_CMD) $(notdir $(basename $@))

slides/five/five_i.pdf : slides/five/five_i.tex slides/five/five_i_main.tex jc/jc1.tex
	$(compile-slides)

slides/five/five_ii.pdf : slides/five/five_ii.tex slides/five/five_ii_main.tex jc/jc2.tex
	$(compile-slides)

slides/five/five_ii_a.pdf : slides/five/five_ii_a.tex slides/five/five_ii_a_main.tex jc/jc2.tex
	$(compile-slides)

slides/five/%.pdf : slides/five/%.tex
	$(compile-slides)


# ================== Videos ============
# Make a PDF file used for the videos
define compile-video-file
  cd $(dir $@);\
  $(LATEX_CMD) $(notdir $(basename $@))
endef

.PHONY : videos
videos : slides/videos/checkin.pdf\
    slides/videos/titlescreen.pdf\
    slides/videos/videolist.pdf

slides/videos/checkin.pdf : slides/videos/checkin.tex
	$(compile-video-file)

slides/videos/titlescreen.pdf : slides/videos/titlescreen.tex cover/asy/axesgraphic.pdf 
	$(compile-video-file)

slides/videos/videolist.pdf : slides/videos/videolist.tex
	$(compile-video-file)


# ================ Lab ==================
# Go to the subdir and read INSTALL.


# ====================== Default ===============
default :
	@echo $(ASYMPTOTE_DIR)
	@echo $(TEXINPUTS)

help:
	@echo "Compile the book."
	@echo "  make   compiles the book, answers, slides, and lab (may need to run twice)"
	@echo "  make hardcopy=1  same, but makes book to send to the printer"

