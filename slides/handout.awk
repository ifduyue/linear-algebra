# handout.awk
#  From a slide .tex file, produce a .tex file that is suitable for handouts,
# because it doesn't have any \pause's.
#  2016-Aug-20 Jim Hefferon
$0 ~ /\\documentclass\[10pt,t\]{beamer}/ {print "\\documentclass[handout,10pt,t]{beamer}"}
$0 !~ /\\documentclass\[10pt,t\]{beamer}/ {print $0}