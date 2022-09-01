% --- Class structure: identification part
% ---
\ProvidesClass{examjh}[2013/05/03 version 0.01 Personal exam style]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: initial code part
% ---

% Generate semester automatically?
% \def\@date{\today}
% \newcommand{\setdate}[1]{\def\@date{#1}}
% \newcommand{\show@date}{\@date}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article, unless the file
% named "<currentoption>.min" exists, in which case it is loaded
%\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
%    \PassOptionsToClass{\CurrentOption}{article}}

% Leave space for student to enter their name in upper right?
% Default is not; to get it use option spaceforname
\def\spaceforname{\relax}
\DeclareOption{spaceforname}{
  \def\spaceforname{\makebox[2.25in]{Name:\enspace\hrulefill}}
}

% Include legalese (default) or not (nolegalese)
\def\legalese{\begin{center}
  \fbox{\parbox{4.5in}{\centering
  You must show your work to get credit for your answer.}}
  \end{center}}
\DeclareOption{nolegalese}{
  \def\legalese{\relax}
}
\AtBeginDocument{\legalese} 


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}

% --- Class structure: execution of options part
% ---
\ProcessOptions \relax

% --- Class structure: declaration of options part
% ---
\LoadClass{exam}

% --- Class structure: main code part
% ---

% page size
\usepackage[margin=1in]{geometry}

% font
\usepackage[sc]{mathpazo}
\linespread{1.05}         % Palatino needs more leading (space between lines)
\usepackage[T1]{fontenc}


% Headers and footers
\def\@examinfocourse{\relax}
\def\@examinfotitle{\relax}
\newcommand{\examhead}[2]{\def\@examinfocourse{#1}%
\def\@examinfotitle{#2}}

\pagestyle{headandfoot}
%\firstpageheader{\@examinfocourse}{\@examinfotitle}{\makebox[2.25in]{Name:\enspace\hrulefill}}
\firstpageheader{\@examinfocourse}{\@examinfotitle}{\spaceforname}
\runningheader{\small\textit{\@examinfocourse, \@examinfotitle}}{}{\small\textit{Page \thepage\ of \numpages}}
\runningheadrule
\firstpagefooter{}{}{}
\runningfooter{}{}{}

% question formatting
\renewcommand{\questionshook}{\setlength{\leftmargin}{1em}\setlength{\labelwidth}{1.25em}\setlength{\labelsep}{0.35em}}
\renewcommand{\partshook}{\setlength{\leftmargin}{0.5em}\setlength{\labelwidth}{1.25em}\setlength{\labelsep}{0.35em}}
\renewcommand{\partlabel}{\thepartno)}

% semester
\newcommand{\examjhspring}{Spring}
\newcommand{\examjhfall}{Fall}
\newcommand{\examjhsummer}{Summer}
\newcommand{\semester}{\ifcase\month\or \examjhspring % Jan
                                    \or \examjhspring % Feb
                                    \or \examjhspring % Mar
                                    \or \examjhspring % Apr
                                    \or \examjhspring % May
                                    \or \examjhsummer % Jun
                                    \or \examjhsummer % Jul
                                    \or \examjhsummer % Aug
                                    \or \examjhfall % Sep
                                    \or \examjhfall % Oct
                                    \or \examjhfall % Nov
                                    \or \examjhfall % Dec
                                  \fi }
\newcommand{\yearsemester}{\the\year-\semester}

% answers
% When you run this class, a file named ``answers.tex'' appears in the
% directory.
% The answer functionality is not yet working well.
\usepackage{answers}

\newenvironment{sol}{%
\question 
}{%
}

\Newassociation{answer}{sol}{answers}
\AtBeginDocument{\Opensolutionfile{answers}%
  \Writetofile{answers}{\protect\documentclass[11pt]{examjh}}%
  \Writetofile{answers}{\protect\answerfilesfalse} % print the answer
  \Writetofile{answers}{\protect\examhead{\@examinfocourse}{\@examinfotitle}}%
  \Writetofile{answers}{\protect\begin{document}} }
\AtEndDocument{\Writetofile{answers}{\protect\end{document}}%
  \Closesolutionfile{answers}}
