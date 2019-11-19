#!/bin/bash
# Generate a copy of the lab document.
# 2019-July-25 Jim Hefferon GPL 3
FN="lab"

TEXINPUTS="/usr/local/src/sage/local/share/texmf/tex/latex/sagetex//:/home/ftpmaint/Documents/linear-algebra/src/sty//:$TEXINPUTS"
PYTHONTEX_DIR="/usr/local/share/texmf/tex/latex/pythontex"

TEXINPUTS=${TEXINPUTS} xelatex "./${FN}"
python3 ${PYTHONTEX_DIR}/pythontex.py "${FN}"
sage ${FN}.sagetex.sage
bibtex lab
TEXINPUTS=${TEXINPUTS} xelatex "./${FN}"
