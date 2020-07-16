\ProvidesClass{titlescreen}[2020/05/08 make title screens for Linear Algebra]

\LoadClass{article}

\RequirePackage[papersize={16in,9.25in},margin=0in]{geometry}

\RequirePackage[defaultsans]{lato}

\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}

% Font family used
\newcommand{\fontfam}{ugq}

% Set font and size for title of slides
\newcommand{\titlefont}{\color{black}\fontsize{55pt}{50pt}\fontfamily{ugq}\selectfont}

% Set font and size, and typeset, the name of the text
\newcommand{\texttext}[1]{\color{black}\fontsize{35pt}{18pt}{\fontfamily{ugq}\selectfont #1}}

% Set font and size, and typeset, the edition number
\newcommand{\editiontext}[1]{\color{black}\fontsize{30pt}{18pt}{\fontfamily{ugq}\selectfont #1}}

% Set font size, and typeset, the URL
\newcommand{\urltext}[1]{{\fontsize{25}{18pt} \textsf{#1}}}

% Text under the title
\newcommand\undertext{%    
    \texttext{\textit{Linear Algebra}, by Hef{}feron} \\[0.0ex] 
    \editiontext{Edition four}  \\[0.4ex]
    % {\fontsize{25}{18pt} \textsf{http://hefferon.net/linearalgebra}}
    \urltext{https://hefferon.net/linearalgebra}
  }

% Splash screen for the start of videos
%  Inside the environment goes the title of this video, maybe
%    Introduction \\[1ex]  Part One 
\newenvironment{videotitle}{%
  % Put in the graphic 
  \setlength{\unitlength}{1in}
  \begin{picture}(0,0)
    \put(1,-8){\includegraphics[scale=1.1]{../../cover/asy/axesgraphic.pdf}}
  \end{picture}% 
  \vspace*{1.85in}% 
  % Put in the title
  \begin{center} 
    \titlefont
    %\color{black}\fontsize{55pt}{50pt}\fontfamily{ugq}\selectfont
}{%
    \\[4ex]
    \undertext{}
  \end{center}
  \clearpage
}


% Splash screen for the ends of videos
%  Inside the environment goes the title of the next video, maybe
%    Introduction \\[1ex]  Part Two 
\newenvironment{videoend}{%
  % Put in the graphic 
  \setlength{\unitlength}{1in}
  \begin{picture}(0,0)
    \put(1,-8){\includegraphics[scale=1.1]{../../cover/asy/axesgraphic.pdf}}
  \end{picture}% 
  \vspace*{1in}% 
  \begin{center} 
    \color{black}\fontsize{35pt}{8pt}\fontfamily{ugq}\selectfont
    \makebox[14in][l]{Next:}  \\[2.0ex]
    \titlefont %\color{black}\fontsize{55pt}{8pt}\fontfamily{ugq}\selectfont

}{%
    \\[3ex]
    \undertext{}
  \end{center}
  \clearpage
}