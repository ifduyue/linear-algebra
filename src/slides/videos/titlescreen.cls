\ProvidesClass{titlescreen}[2020/05/08 make title screens for Linear Algebra]

\LoadClass{article}

\RequirePackage[papersize={16in,9.25in},margin=0in]{geometry}

\RequirePackage[defaultsans]{lato}

\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}

% Font family used
\newcommand{\fontfam}{ugq}
\newcommand{\undertextfontsize}{}
\newcommand{\undertext}[1]{\color{black}\fontsize{45pt}{18pt}{\fontfamily{ugq}\selectfont #1}}
\newcommand{\editiontext}[1]{\color{black}\fontsize{35pt}{18pt}{\fontfamily{ugq}\selectfont #1}}

\newenvironment{videotitle}{%
  % Put in the graphic 
  \setlength{\unitlength}{1in}
  \begin{picture}(0,0)
    \put(1,-8){\includegraphics[scale=1.1]{../../cover/asy/axesgraphic.pdf}}
  \end{picture}% 
  \vspace*{2in}% 
  % Put in the title
  \begin{center} 
    \color{black}\fontsize{65pt}{8pt}\fontfamily{ugq}\selectfont
}{%
    \\[3ex]
    \undertext{Linear Algebra, by Hef{}feron} \\[0.8ex] 
    \editiontext{Edition four}  \\[1ex]
    {\fontsize{30}{18pt} \textsf{http://joshua.smcvt.edu/linearalgebra}}
  \end{center}
}


\newenvironment{videoend}{%
  % Put in the graphic 
  \setlength{\unitlength}{1in}
  \begin{picture}(0,0)
    \put(1,-8){\includegraphics[scale=1.1]{../../cover/asy/axesgraphic.pdf}}
  \end{picture}% 
  \vspace*{1.75in}% 
  \begin{center} 
    \color{black}\fontsize{55pt}{8pt}\fontfamily{ugq}\selectfont
    \makebox[14in][l]{Next see:}  \\[2.5ex]
}{%
    \\[3ex]
    \undertext{Linear Algebra, by Hef{}feron} \\[0.8ex] 
    {\fontsize{30}{18pt} \textsf{http://joshua.smcvt.edu/linearalgebra}}
  \end{center}
}