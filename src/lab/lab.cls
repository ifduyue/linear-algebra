% lab.cls
% 2012-Sep-10 Jim Hefferon jhefferon@smcvt.edu
% 2019-Oct-27 JH Revision to lab document, including sagetex.

% --- Class structure: identification part
% ---
\ProvidesClass{lab}[2019/07/25 version 1.8 Class style for lab manual]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: initial code part
% ---


% --- Class structure: declaration of options part
% ---

\RequirePackage{etoolbox}
% Package options: final, notfinal
%  Do not generate the Sage output fresh, but instead take it from the 
% .result files.
% \newtoggle{generatesagelab}  % from etoolbox
% \toggletrue{generatesagelab}                        
% \DeclareOption{generatesage}{\toggletrue{generatesagelab}}   % default 
% \DeclareOption{notgeneratesage}{\togglefalse{generatesagelab}}

% This class extends the book class
% Read all the documentclass options; pass them to book
\PassOptionsToClass{11pt}{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% --- Class structure: execution of options part
% ---
\ProcessOptions \relax
% \iftoggle{generatesagelab}{%
%   \PassOptionsToPackage{generatesage}{sageoutput}
% }{%
%   \PassOptionsToPackage{notgeneratesage}{sageoutput}
% }

% --- Class structure: declaration of options part
% ---
\LoadClass{book}

% --- Class structure: main code part
% ---


% ======= Colors ============
% \RequirePackage{color}
\RequirePackage[usenames,dvipsnames]{xcolor}
  \definecolor{darkcolor}{HTML}{193E9A}  % RGB: 0.098, 0.243, 0.604
  \definecolor{boldcolor}{HTML}{0034B7}  % RGB: 0, 0.204, 0.718
  \definecolor{lightcolor}{HTML}{DAE4FC} % RGB: 0.855, 0.894, 0.988
  \definecolor{bgcolor}{HTML}{FCFFDC}    % RGB: 0.988, 1.000, 0.863  
  \definecolor{flourishcolor}{HTML}{F80018}  % RGB 0.973, 0, 0.094

\RequirePackage{graphicx}


% =========== Fonts ====================
% Set the directory for fonts that I will distribute because
% they are not standard/automatically distributed.
\ifdefined\FontDir
  \relax
\else
  \def\FontDir{fonts/} % from src/lab/ to src/lab/fonts 
\fi
\typeout{FontDir is \FontDir.}

%\usepackage{beton,euler}  % eulervm gives an error Paragraph ended before \@tempb was complete. 
\usepackage{ccfonts}
\usepackage{euler}
\usepackage{berasans}
\usepackage[T1]{fontenc}
\usepackage{fontspec}
  % \defaultfontfeatures{Ligatures=TeX} % causes " and ' to go away
\setmainfont[Ligatures=TeX,  % CM-Super Concrete
             % Path = /usr/local/texlive/2012/texmf-dist/fonts/type1/public/cm-super/,
             Path = /usr/share/texmf/fonts/type1/public/cm-super/,
             ItalicFont = sfoti10.pfb,
             SmallCapsFont = sfocc10]{sform10.pfb}  % Concrete
% font for code listings
\newfontface\listingsfont[Path=\FontDir,
                          Scale=1]{ProggyClean.ttf}
\newfontface\listingsinlinefont[Path=\FontDir,
                                Scale=MatchLowercase]{ProggyClean.ttf}
\newfontface\sagelistingsfont[Path=\FontDir,
                          Scale=1]{ProggyCleanSage.ttf}
\newfontface\sagelistingsinlinefont[Path=\FontDir,
                                Scale=MatchLowercase]{ProggyCleanSage.ttf}

\setmonofont[Scale=MatchLowercase]{Courier}  



% =============== Page layout ======================
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in,
                head=13.6pt]{geometry}

\RequirePackage{fancyhdr}
\fancypagestyle{preface}{%
  \fancyhf{} % clear all six fields
  \setlength{\headheight}{0pt}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{firstpage}{%
  \fancyhf{} % clear all six fields
  \setlength{\headheight}{14.5pt}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{%
  \fancyhf{} % clear all six fields
  \fancyhead[RE]{{\sffamily \nouppercase{\leftmark}}}
  \fancyhead[LO]{{\sffamily Section: \nouppercase{\rightmark}}}
  \fancyhead[LE,RO]{{\sffamily Page \thepage}}
  \setlength{\headheight}{14.5pt}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{followingpage}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername:\ #1}{}}
\AtBeginDocument{\thispagestyle{firstpage}}



% ========== Bibliography ======================
\usepackage[square,colon]{natbib}
% Change the look of footnotes
\usepackage[perpage,para]{footmisc}
% Change horiz room between fn mark and fn hskip from .5em 
\makeatletter
\long\def\@makefntext#1{\leavevmode
\@makefnmark\nobreak
\hskip.05em\relax#1%
}



% =============== Sectioning =======================
% \@startsection{<type>}{<level>}{<indent>}{<beforeskip>}{<afterskip>}{<style>}
% <type>
%    One of: section, subsection, subsubsection, paragraph or subparagraph. 
%    No backslash.
% <level>
%     Sectioning level:
%       chapter 0
%       section 1
%       subsection 2
%       subsubsection 3
%       paragraph 4
%       subparagraph 5
% <indent>
%     A length specifying the indentation from the left margin.
% <beforeskip>
%     The absolute value is how much vertical distance to leave before the 
%     heading. If <beforeskip> negative then the first paragraph will not 
%     be indented.
% <afterskip>
%     The absolute value is how much vertical distance to leave after the 
%     heading. If <afterskip> is negative, the text following the sectioning 
%     command will appear on the same level as the section heading.
% <style>
%     Set the style of the heading (e.g. \itshape for an italic heading). The 
%     last command in <style> may take a single argument but all the others 
%     must be declarations.

\newsavebox{\chapterrule}
\savebox{\chapterrule}{\colorbox{red}{\makebox[\textwidth][l]{\rule{0em}{0.6pt}}}}
% \savebox{\chapterrule}{\setlength{\fboxsep}{0pt}\colorbox{red}{dddd\makebox[.5\textwidth]{\rule{0em}{6pt}}}}
% \colorbox{red}{\makebox[0em][l]{\rule[-.15in]{\textwidth}{.6pt}}}}

% \renewcommand{\chapter}{\@startsection
% {chapter}%                   % the name
% {1}%                         % the level
% {0em}%                       % the indent
% {-4in}%            % the before skip was: {-2.5\baselineskip}
% {2.0\baselineskip}%          % the after skip
% {\noindent\makebox[0em][l]{\raisebox{-7.5pt}{\setlength{\fboxsep}{0pt}\colorbox{red}{\makebox[\textwidth][l]{\rule{0em}{0.6pt}}}}}\sffamily\Huge\bfseries}} % the style

%---------------------------------------------
% Modified slightly from ../bookconcretejh.sty
% for clearing out (needs twoside document option).
\newcommand{\clearemptydoublepage}{%
  \clearpage{\pagestyle{empty}\cleardoublepage}}

\def\@makechapterhead#1{\clearemptydoublepage
  % Grab the name of the chapter.  Has to go here, not in \chapter, since
  % that macro does not take an argument.
  % \gdef\sectioningname{#1} 
  % Below here is where the chapter heading is formatted
  \vspace*{80pt plus 10pt minus 8pt} % was 50\p@ 
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        % \huge\bfseries \@chapapp\space \thechapter
        {\setlength{\fboxsep}{0pt}\colorbox{flourishcolor}{\makebox[\textwidth]{\rule{0em}{0.6pt}}}} \\[-5ex]
        % \selectfont\Large\textcolor{boldcolor}{\fancyfont{ \@chapapp{} \thechapter}}
        \par\nobreak
        \vskip 0\p@
      \fi
    \par
    \vskip 0\p@ \fi %was 20\p@
    \interlinepenalty\@M
    % \Huge \bfseries \usefont{T1}{fvs}{b}{n}\Huge\textcolor{black}{#1}\par\nobreak
    {\sffamily\Huge\bfseries #1}
    \vspace{40pt plus 5pt minus 3pt}
    % \vskip 50\p@  % was 30\p@
  }}

% For starred chaters
\def\@makeschapterhead#1{%
  \vspace*{75pt plus 10pt minus 8pt} % was: \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    % \usefont{T1}{fvs}{b}{n}\Huge\textcolor{black}{#1} \\[-1.75ex] 
    {\sffamily\Huge\bfseries #1} \\[-1.75ex]
    {\setlength{\fboxsep}{0pt}\colorbox{flourishcolor}{\makebox[\textwidth]{\rule{0em}{0.6pt}}}}\par\nobreak
    \vspace{40pt plus 5pt minus 3pt}
    % \vskip 40\p@
  }}
%---------------------------------------------

\renewcommand{\section}{\@startsection
{section}%                   % the name
{2}%                         % the level
{0em}%                       % the indent
{-2.5\baselineskip}%            % the before skip
{0.5\baselineskip}%          % the after skip
{\sffamily\large\bfseries}} % the style

\renewcommand{\subsection}{\@startsection
{subsection}%                   % the name
{3}%                         % the level
{0em}%                       % the indent
{-1\baselineskip}%            % the before skip
{-0.8em}%          % the after skip
{\sffamily\bfseries}} % the style
% \renewcommand{\thesub}{}

% Depth to with sections numbering is shown?
\setcounter{secnumdepth}{0}




% Set the fonts
% \usepackage{conc}

% \RequirePackage{amsmath}
% \RequirePackage{amsmath,amsthm,amssymb}
% \newtheorem{thm}{Theorem}
% \newtheorem{lem}[thm]{Lemma}    % numbered in sequence with thm	 
% \newtheorem{cor}[thm]{Corollary}	

% \usepackage{fontspec}
% \setmainfont[Ligatures=TeX,  % CM-Super
%              % Path = /usr/local/texlive/2012/texmf-dist/fonts/type1/public/cm-super/,
%              Path = /usr/share/texmf/fonts/type1/public/cm-super/,
%              ItalicFont = sfoti10.pfb,
%              SmallCapsFont = sfocc10]{sform10.pfb}
% \setsansfont{Latin Modern Sans Demi Cond}
% \setmonofont[
%              Scale=MatchLowercase]{Courier}  
% % font for code listings
% \newfontfamily\listingsfont[Path=fonts/,
%                                   Scale=1]{ProggyClean.ttf}
% \newfontfamily\listingsinlinefont[Path=fonts/,
%                                   Scale=MatchLowercase]{ProggyClean.ttf}
% \newfontfamily\luximono[Path=/usr/local/share/texmf/fonts/type1/bh/luxi/,
%                         ItalicFont = ul9ro8a.pfb,
%                         BoldFont = ul9b8a.pfb]{ul9r8a.pfb}
% \newfontfamily\berasans[Path=/usr/share/texlive/texmf-dist/fonts/type1/public/bera/,
%   % Path=/usr/local/texlive/2012/texmf-dist/fonts/type1/public/bera/,
%                         BoldFont = fvsb8a.pfb]{fvsr8a.pfb}
% \newfontfamily\berasansx[Path=/usr/share/texlive/texmf-dist/fonts/type1/public/bera/,
%   % Path=/usr/local/texlive/2012/texmf-dist/fonts/type1/public/bera/,
%                         BoldFont = fvsb8a.pfb,
%                         Scale = MatchLowercase]{fvsr8a.pfb}


% \usepackage[math-style=upright]{unicode-math} % see http://tex.stackexchange.com/questions/50995/font-mixup-with-neo-euler-and-fontspec
% % \setmathfont[% Path=/usr/local/texlive/texmf-local/fonts/opentype/euler/
% %              ]{euler.otf}
% % From https://tex.stackexchange.com/a/425887/339
% \setmathfont[Path=fonts/euler-otf-master/,
%              range={"0000-"0001,"0020-"007E,
%                     "00A0,"00A7-"00A8,"00AC,"00AF,"00B1,"00B4-"00B5,"00B7,
%                     "00D7,"00F7,
%                     "0131,
%                     "0237,"02C6-"02C7,"02D8-"02DA,"02DC,
%                     "0300-"030C,"030F,"0311,"0323-"0325,"032E-"0332,"0338,
%                     "0391-"0393,"0395-"03A1,"03A3-"03A8,"03B1-"03BB,
%                     "03BD-"03C1,"03C3-"03C9,"03D1,"03D5-"03D6,"03F5,
%                     "2016,"2018-"2019,"2021,"2026-"202C,"2032-"2037,"2044,
%                     "2057,"20D6-"20D7,"20DB-"20DD,"20E1,"20EE-"20EF,
%                     "210B-"210C,"210E-"2113,"2118,"211B-"211C,"2126-"2128,
%                     "212C-"212D,"2130-"2131,"2133,"2135,"2190-"2199,
%                     "21A4,"21A6,"21A9-"21AA,"21BC-"21CC,"21D0-"21D5,
%                     "2200,"2202-"2209,"220B-"220C,"220F-"2213,"2215-"221E,
%                     "2223,"2225,"2227-"222E,"2234-"2235,"2237-"223D,
%                     "2240-"224C,"2260-"2269,"226E-"2279,"2282-"228B,"228E,
%                     "2291-"2292,"2295-"2299,"22A2-"22A5,"22C0-"22C5,
%                     "22DC-"22DD,"22EF,"22F0-"22F1,
%                     "2308-"230B,"2320-"2321,"2329-"232A,"239B-"23AE,
%                     "23DC-"23DF,
%                     "27E8-"27E9,"27F5-"27FE,"2A0C,"2B1A,
%                     "1D400-"1D433,"1D49C,"1D49E-"1D49F,"1D4A2,"1D4A5-"1D4A6,
%                     "1D4A9-"1D4AC,"1D4AE-"1D4B5,"1D4D0-"1D4E9,"1D504-"1D505,
%                     "1D507-"1D50A,"1D50D-"1D514,"1D516-"1D51C,"1D51E-"1D537,
%                     "1D56C-"1D59F,"1D6A8-"1D6B8,"1D6BA-"1D6D2,"1D6D4-"1D6DD,
%                     "1D6DF,"1D6E1,"1D7CE-"1D7D7
%                    }]{euler.otf}
% \setmathfont[Path=fonts/euler-otf-master/,
%              range=up/{greek,Greek}, script-features={}, sscript-features={}
%             ]{euler.otf}
% \setmathfont[Path=fonts/euler-otf-master/,
%             range=up/{latin,Latin,num}, script-features={}, sscript-features={}
%             ]{euler.otf}
% % \AtBeginDocument{\DeclareMathAlphabet\mathbf{U}{eur}{b}{n}} % fontspec manual p. 11; doesn't seem to do anything.
% \setmathfont[range=\mathbb,
%              % Path=/usr/local/texlive/2012/texmf-dist/fonts/type1/public/amsfonts/symbols/
%             Path=/usr/share/texlive/texmf-dist/fonts/type1/public/amsfonts/symbols/]{msbm10.pfb}	
% % Bug leaves \prime undefined: https://tex.stackexchange.com/a/208996/339
% % \setmathfont[range=\mathit/{latin,Latin}]{Gentium Italic}
% \setmathfont[range={"2032}]{TeX Gyre Pagella Math}
% % \setmathfont[range={\int}]{Latin Modern Math}

% \newfontfamily\lcircleone[Path=/usr/local/texlive/2012/texmf-dist/fonts/type1/public/amsfonts/latxfont/]{lcircle1.pfb}
% \newcommand{\lcircleonedot}{\lcircleone \char"119}

% \RequirePackage[pdfpagemode=FullScreen]{hyperref}

% % Have the Sage output generated on the fly to guarantee accuracy
% % \RequirePackage{sageoutput/sageoutput}
% % The same for python output 
% % \RequirePackage{sageoutput/python}
% \RequirePackage{reploutput}
% % Make a file for improved graphics
% % \RequirePackage{append}
% % \newcommand{\graphicsfn}{reploutput/improvedgraphics.sage}
% % \immediate\openout\appendwrite=\graphicsfn\relax
% % \immediate\write\appendwrite{\filecontent #2}%
% % \immediate\closeout\appendwrite






% =============== PythonTeX ===========================
% Because of a bug in newfloat you want to load pythontex before sagetex,
% which loads listings, which loads newfloat. 
% See https://tex.stackexchange.com/a/416739/121234
\usepackage{pythontex}
  \setpythontexpyglexer{text} 
  \setpythontexpygopt{style=bw} 
% \usepackage[prettyprinter=fancyvrb]{pythontex}
% pythontex loads a version of fancyvrb.
% Give general settings for fancyvrb-formatted text.
% The fancyvrb package does not allow background color.  This patches
% it to allow that.  https://tex.stackexchange.com/a/39631/121234
\newif\ifFV@bgcolor
\newbox\FV@bgbox
\define@key{FV}{bgcolor}{\FV@bgcolortrue\def\FV@bgcolor{#1}}

\def\FV@BeginVBox{%
  \leavevmode\ifFV@bgcolor\setbox\FV@bgbox=\fi
  \hbox\ifx\FV@boxwidth\relax\else to\FV@boxwidth\fi\bgroup
  \ifcase\FV@baseline\vbox\or\vtop\or$\vcenter\fi\bgroup}
\def\FV@EndVBox{\egroup\ifmmode$\fi\hfil\egroup
  \ifFV@bgcolor\colorbox{\FV@bgcolor}{\box\FV@bgbox}\fi}
% Apparently to set the font you have to look through a 
% .log file from a prior run and find the name that fontspec gave the font
% (a number is appended in case it is taken in with italics, ...).  Why
% you can't say \listingsfont, I don't know.
\fvset{fontfamily=ProggyClean.ttf(0),
  % baselinestretch=0.5pt,
  bgcolor=pythoncolor} 
% Change spacing above and below the verbatim envs.
% From https://tex.stackexchange.com/a/43336/339
% \preto{\@verbatim}{\topsep=-10pt \partopsep=0pt }

% These environments wrap PythonTeX's environments to give colored boxes.
% They use mdframed for the color, because PythonTeX's author G Poore
% uses mdframed in an example on CTAN.  Note that to wrap a verbatim
% environment need to start with the declaration \VerbatimEnvironment
\usepackage{mdframed}
\mdfdefinestyle{jhmdstyle}{%
  hidealllines=true,  % no lines around the box
  innerrightmargin=0pt,innerleftmargin=0pt,  % no horiz padding at start or end
  innertopmargin=3pt,innerbottommargin=3pt,
  backgroundcolor=pythoncolor, % color of background
  roundcorner=0pt,  % square corners
  splitbottomskip=6pt,splittopskip=6pt  % if box gets split across pages
}

\newenvironment{pythonconsole}{\VerbatimEnvironment% See https://tex.stackexchange.com/a/455300/121234
  \begin{mdframed}[style=jhmdstyle]
  \begin{pyconsole}
}{%
  \end{pyconsole}
  \end{mdframed}
}



% =============== SageTeX ===========================
% Requires a 2019 version of SageTeX.
\usepackage{sagetex} % has to come before listings because defines some stuff


% Fix bug in xetex: prevent color changes on pages with Sage graphics;
% see http://tex.stackexchange.com/questions/60315/text-appearing-bold-on-some-pages-with-images
\usepackage{eso-pic}
\AddToShipoutPicture{%
% \makeatletter%
\special{pdf: put @thispage <</Group << /S /Transparency /I true /CS /DeviceRGB>> >>}%
% \makeatother%
}




\usepackage{sagetex} % has to come before listings because defines some stuff
%------------------------- code listings
\definecolor{pythoncolor}{HTML}{BCD4CE}   
\definecolor{latexrulecolor}{HTML}{E6E6E6}   
\definecolor{rulecolor}{HTML}{3D2B22}   
\definecolor{shellcolor}{HTML}{D1A298}  
\RequirePackage{listings}
% make hyphens show up as hyphens; http://tex.stackexchange.com/a/33188
\makeatletter
  \def\lst@filenamerpl{_\textunderscore $\textdollar} % keep emacs's coloring: $
  \lst@CCPutMacro\lst@ProcessOther {"2D}{\lst@ttfamily{-{}}{-{}}}
  \@empty\z@\@empty
\makeatother
\lstloadlanguages{TeX,bash,Python}
\lstset{basicstyle=\sagelistingsfont,
   columns=flexible,  % Stop the horrifying space adjustment
   % breaklines=true,  % These two lines insert a hook when the line breaks
   % postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
   % lineskip=10pt,
   % aboveskip=\medskipamount,
   % belowskip=\medskipamount,
   showstringspaces=false,
   xleftmargin=0pt,                      
   numberfirstline=true,           % first line gets numbered always
   numbers=none,                   % where to put the line-numbers
   numberstyle=\tiny\color{gray},  % the style that is used for the line-numbers
   stepnumber=1,                   % the step between two line-numbers.
   numbersep=5pt,                  % how far the line-numbers are from the code
   backgroundcolor=\color{pythoncolor},  % choose the background color. You must add \usepackage{color}
   showspaces=false,               % show spaces adding particular underscores
   showstringspaces=false,         % underline spaces within strings
   showtabs=false,                 % show tabs within strings adding particular underscores
   % frame=single,                   % adds a frame around the code
   rulecolor=\color{rulecolor},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
   tabsize=2,                      % sets default tabsize to 2 spaces
}
\lstdefinestyle{inline}{basicstyle=\listingsinlinefont,texcl=true}
\lstdefinestyle{shell}{backgroundcolor=\color{shellcolor}}
\lstdefinestyle{python}{backgroundcolor=\color{pythoncolor},
  language=Python,
  identifierstyle=\listingsfont,
  commentstyle=\listingsfont,
  stringstyle=\listingsfont,
  keywordstyle=\listingsfont,
  }
\lstdefinestyle{latex}{
  language=[LaTeX]TeX,                % the language of the code
}

% Copied and modified from sagetex
% Was:
% \lstdefinelanguage{Sage}[]{Python}
%   {morekeywords={False,sage,True},sensitive=true}
% \lstdefinelanguage{SageOutput}[]{}
%   {morekeywords={False,True},sensitive=true}
% \lstdefinestyle{DefaultSageInputOutput}{
%   backgroundcolor=\color{pythoncolor}
%   nolol,
%   identifierstyle=,
%   name=sagecommandline,
%   xleftmargin=5pt,
%   numbersep=5pt,
%   aboveskip=0pt,
%   belowskip=0pt,
%   breaklines=true,
%   numberstyle=\footnotesize,
%   numbers=right
% }
% \lstdefinestyle{DefaultSageInput}{
%   language=Sage,
%   style=DefaultSageInputOutput,
%   basicstyle={\ttfamily\bfseries},
%   commentstyle={\ttfamily\color{dgreencolor}},
%   keywordstyle={\ttfamily\color{dbluecolor}\bfseries},
%   stringstyle={\ttfamily\color{dgraycolor}\bfseries},
% }
% \lstdefinestyle{DefaultSageOutput}{
%   language=SageOutput,
%   style=DefaultSageInputOutput,
%   basicstyle={\ttfamily},
%   commentstyle={\ttfamily\color{dgreencolor}},
%   keywordstyle={\ttfamily\color{dbluecolor}},
%   stringstyle={\ttfamily\color{dgraycolor}},
% }
% \lstdefinestyle{SageInput}{
%   style=DefaultSageInput,
% }
% \lstdefinestyle{SageOutput}{
%   style=DefaultSageOutput,
% }
\lstdefinelanguage{Sage}[]{Python}
  {morekeywords={False,sage,True},sensitive=true}
\lstdefinelanguage{SageOutput}[]{}
  {morekeywords={False,True},sensitive=true}
\lstdefinestyle{DefaultSageInputOutput}{
   % basicstyle=\listingsfont,
   % columns=flexible,  % Stop the horrifying space adjustment
   % breaklines=true,  % These two lines insert a hook when the line breaks
   % postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
  numbers=none,
  lineskip=-2ex
}
\lstdefinestyle{DefaultSageInput}{
  language=Sage,
  style=DefaultSageInputOutput,
  % basicstyle={\ttfamily\listingsfont},
  % commentstyle={\ttfamily},
  % keywordstyle={\ttfamily},
  % stringstyle={\ttfamily},
}
\lstdefinestyle{DefaultSageOutput}{basicstyle=\sagelistingsfont,
   columns=flexible,  % Stop the horrifying space adjustment
   breaklines=true,  % These two lines insert a hook when the line breaks
   % postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
  language=SageOutput,
  style=DefaultSageInputOutput,
  % basicstyle={\ttfamily},
  % commentstyle={\ttfamily},
  % keywordstyle={\ttfamily},
  % stringstyle={\ttfamily},
}
\lstdefinestyle{SageInput}{basicstyle=\sagelistingsfont,
   columns=flexible,  % Stop the horrifying space adjustment
   breaklines=true,  % These two lines insert a hook when the line breaks
   % style=DefaultSageInput,
   aboveskip=0ex,
   belowskip=0ex,
   numbers=none,
   lineskip=0ex,
}
\lstdefinestyle{SageOutput}{basicstyle=\sagelistingsfont,
   columns=flexible,  % Stop the horrifying space adjustment
   breaklines=true,  % These two lines insert a hook when the line breaks
   % style=DefaultSageOutput,
   aboveskip=0ex,
   belowskip=0ex,
   numbers=none,
   lineskip=0ex,
}



% =========== Table of Contents ====================
\RequirePackage{tocloft}
\setcounter{tocdepth}{0}
\tocloftpagestyle{empty}
\setlength{\cftbeforetoctitleskip}{20ex}  % page head vert sizes
\setlength{\cftaftertoctitleskip}{5ex}
\renewcommand{\cfttoctitlefont}{\sffamily\Large\bfseries} % font in page head
\renewcommand{\cftchapdotsep}{\cftdotsep} 
\setlength{\cftbeforechapskip}{.2ex}   % vert space between chap lines
\setlength{\cftchapnumwidth}{0em}  % omit chapter numbers
\renewcommand{\cftchappresnum}[1]{\relax}






% =========== Math tools ====================
\usepackage{linalgjh}
% \RequirePackage{mathtools,amsthm,amssymb} % loaded by linalgjh
\newtheorem{thm}{Theorem}
\newtheorem{lem}[thm]{Lemma}    % numbered in sequence with thm	 
\newtheorem{cor}[thm]{Corollary}	

\AtBeginDocument{\def\Re{\mathbb{R}}}

\newcommand{\pgm}[1]{\texttt{#1}}
\newcommand{\pkg}[1]{\textit{#1}}
\newcommand{\keyboardkey}[1]{\textit{$\langle$#1\,$\rangle$}}
% already defined \newcommand{\Sage}{Sage}
\newcommand{\Sagecmd}[1]{\texttt{#1}}
\newcommand{\python}{Python}
\newcommand{\pythoncmd}[1]{\texttt{#1}}
\newcommand{\inlinecode}[1]{\hspace{0.1em}\lstinline[style=inline]!#1!\hspace{0.1em}}

\newcommand{\noterightmult}{Recall that 
\protect\Sage{} prefers to do matrix-vector 
multiplication as $\vec{v}M$ (here $\vec{v}$ is a row vector).
Translate to the book's convention by transposing,
$\trans{M}\trans{\vec{v}}$.
See the discussion on page~\protect\pageref{sec:leftright}. 
% Can't get LaTeX to take the equation* environment, although a test file does fine.
% Thus, for the $\protect\nbyn{2}$ case \protect\Sage's way 
% $\protect\vec{v}M$
% is first below.
% \begin{equation*}
%   \protect\rowvec{x &y}
%   \protect\begin{mat}
%     a &b \\
%     c &d
%   \protect\end{mat}
%   =\protect\rowvec{ax+cy &bx+dy}
%   \protect\qquad
%   \protect\begin{mat}
%     a &c \\
%     b &d
%   \protect\end{mat}
%   \protect\colvec{x \\ y}
%   =\protect\colvec{ax+cy \\ bx+dy}
% \end{equation*}
% Second is
% the translation to the book's convention $\protect\trans{M}\protect\vec{v}$.
}



% ============ Misc ================
% Preface
\newcommand{\quotefrom}[1]{\hspace*{5em}--\textrm{#1}} % Who made the quote?


% Dashes, lifted from ltugboat.cls
\usepackage{dash}
% \def\thinskip{\hskip 0.16667em\relax}
% \def\endash{--}
% \def\emdash{\endash-}
% \def\d@sh#1#2{\unskip#1\thinskip#2\thinskip\ignorespaces}
% \def\dash{\d@sh\nobreak\endash}
% \def\Dash{\d@sh\nobreak\emdash}
% \def\ldash{\d@sh\empty{\hbox{\endash}\nobreak}}
% \def\rdash{\d@sh\nobreak\endash}
% \def\Ldash{\d@sh\empty{\hbox{\emdash}\nobreak}}
% \def\Rdash{\d@sh\nobreak\emdash}




\RequirePackage{lipsum}


% ========= Hyper references ============
% Typically this comes last (except for cleveref, if present).
\RequirePackage{hyperref}
\hypersetup{
    bookmarks=false,         % show bookmarks bar?
    % unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    % pdffitwindow=true,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={Lab Manual for Linear Algebra},    % title
    pdfauthor={Jim Hefferon},     % author
    pdfsubject={Linear Algebra},   % subject of the document
    pdfcreator={Jim Hefferon},   % creator of the document
    pdfproducer={xelatex}, % producer of the document
    pdfkeywords={Linear Algebra} {mathematics} {textbook} {Sage} {Free} {Hefferon} {lab},  % list of keywords
    pdfnewwindow=true,      % links in new window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=blue,          % color of internal links
    citecolor=blue,        % color of links to bibliography
    filecolor=blue,      % color of file links
    urlcolor=blue           % color of external links
}
% Change the font for URL's
\def\UrlFont{\normalfont}



