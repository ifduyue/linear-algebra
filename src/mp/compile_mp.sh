#!/bin/bash
# Run MetaPost on the files provided as argument, while giving the needed
# TeX and MetaPost search directory variables.
# 2019-Oct-04 Jim Hefferon GPL 2.

echo "Apply MetaPost to:" "$@"
TEXINPUTS=../..//:$TEXINPUTS MPINPUTS=../..//:$MPINPUTS mpost "$@"
