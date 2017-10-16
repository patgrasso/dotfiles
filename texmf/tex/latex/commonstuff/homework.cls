% homework.cls
% Copyright 2012 Carl Eastlund <cce@ccs.neu.edu>, adapted from:
%
% interlake-assignment.cls
% Copyright 2009 Ankur Dave <ankurdave@gmail.com>
% 
% Licensed under the CC-GNU GPL version 2.0 or later.
% See http://creativecommons.org/licenses/GPL/2.0
% 
% See http://ankurdave.com/tex for more document classes.

\ProvidesClass{homework}

\LoadClass[11pt]{article}

\newcommand\insolution[1]{#1}
\newcommand\inassignment[1]{}

\DeclareOption{assignment}
{ \renewcommand\insolution[1]{}
  \renewcommand\inassignment[1]{#1} }
\DeclareOption{submission}
{ \renewcommand\insolution[1]{#1}
  \renewcommand\inassignment[1]{} }
\ExecuteOptions{submission}
\ProcessOptions

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}

% fonts
\usepackage{newcent}
\usepackage{fouriernc}
\renewcommand{\ttdefault}{cmtt}

% alignment
% (must be before indentation because raggedright clears parindent)
% \raggedright

% indentation
\usepackage{indentfirst}
\setlength{\parindent}{18pt}
\setlength{\parskip}{3pt}

% spacing
\usepackage{setspace}

% references
\usepackage{varioref}

% figures
\usepackage[pdftex]{graphicx}

% theorems and equations
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{nicefrac}

% URLs, filenames, emails, and hostnames
\usepackage{url}

% title customization:
\renewcommand{\title}[1]{\def \@title {{#1}\\}}
\renewcommand{\author}[1]{\def \@author {{#1}\\}}
\renewcommand{\date}[1]{\def \@date {{#1}\\}}
\newcommand{\subject}[1]{\def \@subject {{#1}\\}}
\newcommand{\subtitle}[1]{\def \@subtitle {{#1}\\}}

\def \@subject {}
\def \@subtitle {}

% title:
\def \@maketitle {%
  \begin{flushleft}
    \@author
    \smallskip
    \@subject
    \@date
  \end{flushleft}
  \begin{center}
    {\LARGE \bf \@title}
    {\Large \@subtitle}
  \end{center}
}

%% various:

\newtheorem{fact}{Fact}
\newenvironment{just}{\begin{proof}[Justification]}{\end{proof}}

\newcounter{exnum}
\newcommand\exercise[1][]
{ \vspace{2em}
  \pagebreak[2]
  \par\noindent
  {\normalfont\Large\bfseries
    Exercise \addtocounter{exnum}{1}\arabic{exnum}
    \large\mdseries #1}
  \par }

\newenvironment{problem}
{\begin{quotation}\noindent\textbf{Problem:}~}
{\end{quotation}}

\newenvironment{solution}
{\par\noindent\textbf{Solution:}}
{}
