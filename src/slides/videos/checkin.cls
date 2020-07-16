\ProvidesClass{checkin}[2020/05/07 Slides to check understanding]

% Defer to beamer
\LoadClass[12pt,t,xcolor={dvipsnames}]{beamer}
\usepackage[T1]{fontenc} % Needed for Type1 Concrete
\usepackage{concmath} % Concrete + Concmath

% ---- Page decoration  ------
% Get rid of navigation junk
\mode<presentation>
{
  \usetheme{boxes}
  \setbeamercovered{invisible}
  \setbeamertemplate{navigation symbols}{} 
}

% ---- Lists ---- 
\RequirePackage{enumitem}
% ? Use circle for paper fill-in?
% \RequirePackage{wasysym}
% \newcommand{\wacircsimple}{\raisebox{0.2ex}{$\ocircle$}}
\newenvironment{choices}{%
  \begin{enumerate}[label={\alph*)},
                  noitemsep]
}{%
  \end{enumerate}
}
% \usepackage[dvipsnames]{xcolor}
\newcommand{\rightanswer}[1]{\textcolor<2->{Green}{#1}}
