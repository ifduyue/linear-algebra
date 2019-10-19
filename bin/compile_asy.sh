#!/bin/bash
# Run Asymptote on the files provided as argument, while giving the needed
# TeX search directory variables.
# 2019-Oct-07 Jim Hefferon GPL 2.

SRCDIR=`expr match "$PWD" '\(.*/linear-algebra/src\)'`
echo "SRCDIR is ${SRCDIR}"
# echo "TEXINPUTS is ${TEXINPUTS}"
echo "ASYMPTOTE_DIR is ${SRCDIR}/asy//:$ASYMPTOTE_DIR"
# -nosafe gets around GhostScript error when using opacity:
#    https://github.com/vectorgraphics/asymptote/issues/77
TEXINPUTS="${SRCDIR}//:$TEXINPUTS" ASYMPTOTE_DIR="${SRCDIR}/asy//:$ASYMPTOTE_DIR" asy  -nosafe "$@"
