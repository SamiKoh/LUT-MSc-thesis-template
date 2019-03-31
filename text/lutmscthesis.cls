% This is an unofficial Master's thesis template for LUT School of Business
%   
%
% This document style is originally extracted from
% P. Paalanen. Real-time Imaging and Mosaicing of Planar Surfaces.
% Master's thesis, Lappeenranta University of Technology. October 2006.
% 3.11.2006 - pq
% 3.10.2017 - ak

% Prehistory:
% - unknown, original version
% - Jarmo "trewas" Ilonen, masters thesis, 2003
% - Pekka "PQ" Paalanen, information processing project, 2004,
%     hints about graphicx and making PDF from Pasi Valminen

% Modifications:
% - Pekka Paalanen, 2010 (modified and cleaned up for TexLive 2008 and pdf)
% - (your name, work, year)
%
% - Sami Kohvakka, 2019 (Rewrote most of this template to meet LUT Business
%   School guidlines, updated packages, fixed References link issue, added 
%   some dependencies, switched to Perl based latexmk and removed old makefiles)

% Packages that this document class includes automatically:
% geometry, graphicx, subfig, caption(3)

% See the accompanying .tex files for usage information

% ------------ Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lutmscthesis}


% ------------ Initial code
\RequirePackage{ifthen}
\RequirePackage{calc}

\newif\if@hyperref@enabled

% ------------ Declaration of options


% ------------ Execution of options
\ProcessOptions \relax


% ------------ Package loading
\LoadClass[a4paper,12pt]{article}

\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{extramarks}
\RequirePackage{placeins}

% Required for labeling lists
\RequirePackage{scrextend}

% Set search path for images
\graphicspath{.}

% the caption3 package
\RequirePackage{caption}
\RequirePackage{subfig}

% Harvard referencing using natbib
%\RequirePackage{natbib}

% ------------ Main code

\AtBeginDocument{%
  \usepackage{lastpage}%
  \@ifpackageloaded{hyperref}{%
    \@hyperref@enabledtrue%
    \hypersetup{pdfauthor={\@author},pdftitle={\@title},%
      pdfkeywords={\EmitKeywords}}%
  }{%
    \@hyperref@enabledfalse%
  }%
}

\newcommand\MakeStringVar[2][\relax]{%
  \ifx#1\relax%
    \expandafter\newcommand\csname Emit#2\endcsname{%
      {\scriptsize (Use {\tt\textbackslash #2} to replace this text.)}}%
  \else%
    \expandafter\newcommand\csname Emit#2\endcsname{#1}%
  \fi%
  \expandafter\newcommand\csname #2\endcsname[1]{%
     \expandafter\renewcommand\csname Emit#2\endcsname{##1}%
  }%
}

% constants
\newcommand\UniversityNameFin{Lappeenrannan teknillinen yliopisto}
\newcommand\UniversityName{Lappeenranta University of Technology}

\MakeStringVar[School of Business and Management]{School}
\MakeStringVar[School of Business and Management]{SchoolFin}

\MakeStringVar[Lappeenranta]{City}

\MakeStringVar[Master's Thesis]{Doctype}
\MakeStringVar[Pro gradu -tutkielma]{DoctypeFin}

\MakeStringVar{titlefin}
\MakeStringVar{Major}
\MakeStringVar{MajorFin}

\MakeStringVar{SignDate}
\MakeStringVar{Year}

\MakeStringVar{Keywords}
\MakeStringVar{KeywordsFin}
\MakeStringVar[]{addtostats}
\MakeStringVar[]{addtostatsfin}


% Supervisors for cover page
\MakeStringVar{Supervisor}
\MakeStringVar[Supervisor]{SupervisorTitle}
\MakeStringVar{Examiner}
\MakeStringVar[2\textsuperscript{nd} examiner]{ExaminerTitle}

% Examiners for abstracts
\MakeStringVar{ExaminersEng}
\MakeStringVar{ExaminersFin}

\DeclareGraphicsExtensions{.pdf,.jpg,.png}

% Margins and paper size
\geometry{a4paper,tmargin=35mm,bmargin=20mm,lmargin=35mm,rmargin=20mm}

% Float caption style.
\captionsetup{labelfont=bf,labelsep=period,font=small}

% Subfloat caption style
\captionsetup[subfloat]{labelfont=normalfont,labelformat=parens}

% Harvard style references.
%\bibliographystyle{agsm}

% Cover page layout
\renewcommand\maketitle{%
  \onehalfspacing%
  \setlength\parindent{0pt}%
  \setlength\parskip{0pt}%
  \thispagestyle{empty}%
  \begin{flushleft}
    \hspace{-5mm}\includegraphics[scale=0.5]{images/LUT-logo.png}\\
    \vspace{-3mm}
    \textbf{\EmitSchool}\\
    Master's Degree in \EmitMajor

    \vspace{55mm}
  \end{flushleft}%
    
  \begin{center}
    {\normalfont\EmitDoctype}
    \vspace{5mm}
    
    {\normalfont\large\bfseries{\@title}}
    \vspace{100mm}
  \end{center}
    
  \begin{flushright}
    % Author and year
    {\normalfont\bfseries\@author}, {\bfseries\EmitYear}
    
      \EmitSupervisorTitle: \EmitSupervisor \\
      \EmitExaminerTitle: \EmitExaminer 

  \end{flushright}
}

% Abstract in English
\renewenvironment{abstract}{
  \clearpage\thispagestyle{empty}
  \onehalfspacing
  \section*{ABSTRACT}

  \begin{labeling}{thisdeterminesindentdepth} 
    \setlength{\parskip}{0pt}
    \setlength{\itemsep}{0pt plus 1pt}
    \item[\textbf{Author:}] \@author
    \item[\textbf{Title:}] \@title
    \item[\textbf{Year:}] \EmitYear
    \item[\textbf{Faculty:}] \EmitSchool
    \item[\textbf{Major:}] \EmitMajor
    \item[\textbf{Master's Thesis:}] \UniversityName\\ \pageref{LastPage} pages\Emitaddtostats.
    \item[\textbf{Examiners:}] \EmitExaminersEng
    \item[\textbf{Keywords:}] \EmitKeywords
  \end{labeling}
}

% Abstract in Finnish
\newenvironment{tiivistelma}{
  \clearpage\thispagestyle{empty}
  \onehalfspacing
  \begin{otherlanguage}{finnish}
  \section*{TIIVISTELM\"A}

  \begin{labeling}{thisdeterminesindentdepth} 
    \setlength{\parskip}{0pt}
    \setlength{\itemsep}{0pt plus 1pt}
    \item[\textbf{Tekij\"a:}] \@author
    \item[\textbf{Otsikko:}] \Emittitlefin
    \item[\textbf{Vuosi:}] \EmitYear
    \item[\textbf{Tiedekunta:}] \EmitSchoolFin
    \item[\textbf{P\"a\"aaine:}] \EmitMajorFin
    \item[\textbf{Pro gradu -tutkielma:}] \UniversityNameFin \\ \pageref{LastPage} sivua\Emitaddtostatsfin.
    \item[\textbf{Tarkastajat:}] \EmitExaminersFin
    \item[\textbf{Hakusanat:}] \EmitKeywordsFin
  \end{labeling}
}{%
  \end{otherlanguage}%
}

\newenvironment{preface}{%
  \clearpage\thispagestyle{empty}%
  \setlength{\parskip}{3ex}
  \onehalfspacing
  \section*{PREFACE}
}{%
  \par\vspace*{13mm}
  {\itshape \@author}\par
}

% Numbered page style for the main content
\newcommand\ps@masters{%
  \renewcommand\@oddfoot{}%
  \renewcommand\@evenfoot{}%
  \renewcommand\@oddhead{\hfil\normalfont\textrm{\thepage}}%
  \renewcommand\@evenhead{\normalfont\textrm{\thepage}\hfil}%
}

% Force a clearpage on every normal section
\let\orig@section\section
\renewcommand\section{\clearpage\orig@section}

% New page style for appendices.
\newcommand\ps@appendix{%
  \renewcommand\@oddfoot{\hfil\lastrightxmark}%
  \let\@evenfoot\@oddfoot%
  \renewcommand\@oddhead{%
    \normalfont\large\bfseries%
    \appendixname~\thesection.~\firstleftxmark\hfil}%
  \let\@evenhead\@oddhead%
}

\gdef\msc@app@title{muu}
\newcommand\msc@continues{(continues)}
\newcommand\msc@continued{(continued)}

% This command will start the appendices, and each appendix is a \section{}
% ended with \sectionend.
\renewcommand\appendix{%
  \clearpage%
  \pagestyle{appendix}%
  \renewcommand\thesection{\@arabic\c@section}%
  \renewcommand\thefigure{A\thesection.\@arabic\c@figure}%
  \renewcommand\thetable{A\thesection.\@arabic\c@table}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \addtocontents{toc}{\protect\contentsline{section}{APPENDICES}{}{}}%
  \renewcommand\section{%
    \clearpage%
    \setcounter{figure}{0}%
    \setcounter{table}{0}%
    \secdef\Appendix\sAppendix%
  }%
  \if@hyperref@enabled%
    \renewcommand\theHfigure{\theHsection.\arabic{figure}}%
    \renewcommand\theHtable{\theHsection.\arabic{table}}%
  \fi%
}

% the complex form to set appendix title
\newcommand\Appendix[2][?]{%
  \gdef\msc@app@title{#2}%
  \refstepcounter{section}%
  \addtocontents{toc}{\hspace*{1.5em}\appendixname~%
    \protect\makebox[1.5em][l]{\thesection:} #1\\}%
  %{\large\bfseries#2\par}%
  \sectionmark{#1}%
  \extramarks{\msc@app@title}{}%
  \extramarks{\msc@continued}{\msc@continues}%
  \@afterheading%
}

\newcommand\sectionend{%
  \FloatBarrier\null%
  \extramarks{\msc@continued}{}%
}

% the starred form (simple)
\newcommand\sAppendix[1]{%
  {\raggedleft\large\bfseries\appendixname\par #1\par}%
  \@afterheading\addvspace{\baselineskip}%
}

% Float separation spacings.
% The defaults:
% \setlength{\floatsep}{12pt plus 2pt minus 4pt}
% \setlength{\textfloatsep}{20pt plus 2pt minus 4pt}
% \setlength{\intextsep}{14pt plus 4pt minus 4pt}
% New settings:
\setlength{\intextsep}{26pt plus 6pt minus 2pt}
\setlength{\textfloatsep}{26pt plus 6pt minus 2pt}

