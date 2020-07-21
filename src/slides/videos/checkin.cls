\ProvidesClass{checkin}[2020/05/07 Slides to check understanding]

% Defer to beamer
\LoadClass[12pt,t,xcolor={dvipsnames}]{beamer}
\usepackage[T1]{fontenc} % Needed for Type1 Concrete
\usepackage{concmath} % Concrete + Concmath
\usefonttheme{professionalfonts}
\usefonttheme{serif}

% ---- Page decoration  ------
% Get rid of navigation junk
\mode<presentation>
{
  \usetheme{boxes}
  \setbeamercovered{invisible}
  \setbeamertemplate{navigation symbols}{} 
}

% Get macros from the book
\usepackage{amsmath,amssymb}  
\usepackage{linalgjh}


% ---- Lists ---- 
\RequirePackage{enumitem}
% ? Use circle for paper fill-in?
% \RequirePackage{wasysym}
% \newcommand{\wacircsimple}{\raisebox{0.2ex}{$\ocircle$}}

% Questions, numbered 1) 2) ...
\newenvironment{questions}{%
  \begin{enumerate}[label={\arabic*)},
                  noitemsep]
}{%
  \end{enumerate}
}

% Choices within a question, numbered a) b) ...
\newenvironment{choices}{%
  \begin{enumerate}[label={\alph*)},
                  noitemsep]
}{%
  \end{enumerate}
}

% Mark the answer that is right, as in \item \rightanswer Ni! 
\newcommand{\rightanswer}{%
  \only<2->{\makebox[0in][c]{\makebox[0.85in][l]{\checkmark}}}}
