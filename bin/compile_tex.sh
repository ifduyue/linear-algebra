#!/bin/bash
# Run LaTeX on the files provided as argument, while giving the needed
# TeX search directory variables.
# 2019-Oct-05 Jim Hefferon GPL 2.

SRCDIR=`expr match "$PWD" '\(.*/linear-algebra/src\)'`
# echo "SRCDIR is ${SRCDIR}"
# echo "TEXINPUTS is ${TEXINPUTS}"
TEXINPUTS="${SRCDIR}//:$TEXINPUTS" pdflatex "$@"
