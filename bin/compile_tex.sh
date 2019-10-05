#!/bin/bash
# Run LaTeX on the files provided as argument, while giving the needed
# TeX search directory variables.
# 2019-Oct-05 Jim Hefferon GPL 2.

echo "Apply LaTeX to:" "$@"
SRCDIR=`expr match "$PWD" '\(.*/linear-algebra.git/src\)'`
echo "SRCDIR is ${SRCDIR}"

echo "TEXINPUTS is ${TEXINPUTS}"
TEXINPUTS="${SRCDIR}//:$TEXINPUTS" pdflatex "$@"
