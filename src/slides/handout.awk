# handout.awk
#  From a slide .tex file, produce a .tex file that is suitable for handouts,
# because it doesn't have any \pause's.
#  2016-Aug-20 Jim Hefferon
# 2018-Jan-14 JH Change 10pt in documentclass to 9pt
$0 !~ /\\documentclass\[9pt,t\]{beamer}/ {print $0}
$0 ~ /\\documentclass\[9pt,t\]{beamer}/ {print "\\documentclass[handout,9pt,t]{beamer}"}
