#!/bin/bash
# Generate a copy of the lab document.
# 2019-July-25 Jim Hefferon GPL 3
TEXINPUTS="/home/ftpmaint/Documents/linear-algebra.git/src//:$TEXINPUTS" xelatex lab
python3 /usr/local/share/texmf/tex/latex/pythontex/pythontex.py lab
sage lab.sagetex.sage
bibtex lab
TEXINPUTS="/home/ftpmaint/Documents/linear-algebra.git/src//:$TEXINPUTS" xelatex lab
