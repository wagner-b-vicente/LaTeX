%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	normal.cls
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	Licença LPPL ( LaTeX Project Public License )
%%	Esta licença diz basicamente que se você editar o código desta classe,
%%	mesmo que localmente (no seu micro), você DEVERÁ RENOMEAR o arquivo da
%%	classe.
%%
%%	Classe para confecção de monografias, dissertações ou teses de acordo
%%	com as nomas da Associação Brasileira de Normas Técnicas (ABNT).
%%
%%	Autor: Wagner Baptista Vicente
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	Controle de versão
%%
%%	Versão: 0.0.1 - 01/05/2013 - ID: v0.0.1
%%	The file create.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Identificação da classe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{normal}[2013/05/01 v.0.0.1 - Normal LaTeX document class]%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Packages used in this class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[latin1]{inputenc}%%% Allow process files with accents
\RequirePackage[T1]{fontenc}%%% Hyphenization algorithm
\RequirePackage{indentfirst}%%% Indentity the first line
\RequirePackage{makeidx}%%% Allow index "remissivo"
\RequirePackage{ifthen}%%% Allow conditions at LaTeX
\RequirePackage{calc}%%% stand pack for len and number easy calculations
\RequirePackage{url}%%% Active call of URL from PDF
\RequirePackage{multicol}%%%
\RequirePackage{amsmath}%%%
\RequirePackage{amsfonts}%%%
\RequirePackage{amssymb}%%%
\RequirePackage{amsbsy}%%% Bold version of symbols in amssymb
\RequirePackage{mathrsfs}%%%
\RequirePackage{latexsym}%%% Mathematic symbols
\RequirePackage[mathscr]{eucal}%%% New calligraphic letters
\RequirePackage{dsfont}%%% Double Stronker Fonts
\RequirePackage{fancyvrb}%%%
\RequirePackage[printonlyused]{acronym}%%%
\RequirePackage{array}%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Class declaration options initializations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
%%%	Fonts definitions
%%%	Times New Roman or Arial
%%%
\newboolean{NormalFontArial}%%%
\DeclareOption{FontArial}{\setboolean{NormalFontArial}{true}}%%%
\DeclareOption{FontTimes}{\setboolean{NormalFontArial}{false}}%%%
%%%	Default: Arial
\ExecuteOptions{FontArial}%%%

%%%
%%%	Page style definitions
%%%
%%%	- empty  => without header and footer definitions
%%%	- normal => footer empty and header with page number cfe ABNT
%%%
\newboolean{NormalPageStyle}%%%
\DeclareOption{NormalEmpty}	{\setboolean{NormalPageStyle}{false}}%%%
\DeclareOption{NormalPage}	{\setboolean{NormalPageStyle}{true}}%%%
%%%	Default: NormalPage
\ExecuteOptions{NormalPage}%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Loading basic configuration to base class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\NormalBaseClass{report}%%%

\ifthenelse{\equal{\CurrentOption}{12pt}}%%%
	{}%%% if
	{\PassOptionsToClass{12pt}{\NormalBaseClass}}%%% else

\ifthenelse{\equal{\CurrentOption}{a4paper}}%%%
	{}%%% if
	{\PassOptionsToClass{a4paper}{\NormalBaseClass}}%%% else

\ifthenelse{\equal{\CurrentOption}{twoside}}%%%
	{}%%% if
	{\PassOptionsToClass{twoside}{\NormalBaseClass}}%%% else

%%\ifthenelse{\equal{\CurrentOption}{openright}}%%%
%%	{}%%% if
%%	{\PassOptionsToClass{openright}{\NormalBaseClass}}%%% else

\PassOptionsToClass{\CurrentOption}{\NormalBaseClass}%%%
\ProcessOptions%%%
\LoadClass{\NormalBaseClass}%%%

\RequirePackage{setspace}%%%
\RequirePackage[pdftex,colorlinks=false]{hyperref}%%%
\RequirePackage[pdftex]{graphicx}%%%
\RequirePackage[english,brazil]{babel}%%%
\RequirePackage{epsfig}%%%
\RequirePackage{geometry}%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Page definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\NormalSup}%%%
\newlength{\NormalEsq}%%%
\newlength{\NormalInf}%%%
\newlength{\NormalDir}%%%

\setlength{\NormalSup}{30mm}%%%
\setlength{\NormalEsq}{30mm}%%%
\setlength{\NormalInf}{20mm}%%%
\setlength{\NormalDir}{20mm}%%%

%%%
%%%	Margem Superior
%%%
\setlength{\topmargin}{20mm}%%%
\setlength{\headheight}{5mm}%%%
\setlength{\headsep}{5mm}%%%
\setlength{\voffset}{\NormalSup-1in-\topmargin-\headheight-\headsep}%%%
%%%
%%%	Margem Inferior
%%%
\setlength{\textheight}%%%
	{\paperheight-\topmargin-\headheight-\headsep-\NormalInf}%%%
%%%
%%%	Margem Esquerda
%%%
\setlength{\hoffset}{\NormalEsq-1in}%%%
\setlength{\oddsidemargin}{0mm}%%%
\setlength{\evensidemargin}{-10mm}%%%
\setlength{\marginparwidth}{0mm}%%%
\setlength{\marginparsep}{0mm}%%%
%%%
%%%	Margem Direita
%%%
\setlength{\textwidth}{\paperwidth-1in-\hoffset-\oddsidemargin-\NormalDir}%%%

\setlength{\parindent}{20mm}%%%
\setlength{\parskip}{2.5mm}%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Page Styles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\NormalNewPage{\if@openright\cleardoublepage\else\clearpage\fi}%%%

\def\ps@NormalMainPage{%%%
	\let\@oddfoot\@empty%%%
	\let\@evenfoot\@empty%%%
%%	\let\@oddhead{\hfill{\small\thepage}}%%%
	\renewcommand{@oddhead}{\hfill{\small\thepage}}%%%
	\renewcommand{@evenhead}{{\small\thepage}\hfill}%%%
}%%%

%% \def\ps@NormalEmptyPage{%%%
%% 	\let\@oddfoot\@empty%%%
%% 	\let\@evenfoot\@empty%%%
%% 	\let\@oddhead\@empty%%%
%% 	\let\@evenhead\@empty%%%
%% }%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Class options implementation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%	Font
%%%
\ifthenelse{\boolean{NormalFontArial}}%
{%
	\IfFileExists{helvet.sty}{\RequirePackage{helvet}}{}%
	\IfFileExists{helvetic.sty}{\RequirePackage{helvetic}}{}%
	\renewcommand{\rmdefault}{phv}%
	\fontfamily{phv}%
}% ifthen
{%
	\IfFileExists{mathptmx.sty}{\RequirePackage{mathptmx}}{}%
	\IfFileExists{mathptm.sty}{\RequirePackage{mathptm}}{}%
	\IfFileExists{times.sty}{\RequirePackage{times}}{}%
	\renewcommand{\rmdefault}{ptm}%
	\fontfamily{ptm}%
}% else
%%%
%%%	Page style
%%%
%%% \ifthenelse{\boolean{NormalPageStyle}}%%%
%%% 	{\pagestyle{NormalMainPage}}%%%
%%% 	{\pagestyle{empty}}%%% else

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Class environment implementation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\aspas#1{``#1''}%%%

\def\italico#1{{\itshape #1}}%%%

\def\negrito#1{{\bfseries #1}}%%%

\def\citacao#1#2{%%%
	\vspace{2mm}%%%
	{%%%
		\singlespacing\footnotesize\hfill%%%
		\begin{minipage}{\textwidth-40mm}%%%
			\aspas{#1}. (#2)%%%
		\end{minipage}%%%
	}%%%
	\vspace{5mm}%%%
}%%%
%% 
%% \def\NormalResetSubCounters#1{%%%
%% 	\begingroup%%%
%% 		\let\@elt\@stpelt%%%
%% 		\csname cl@#1 \endcsname%%%
%% 	\endgroup%%%
%% }%%%
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	PART environment command
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\part{%%%
	\NormalNewPage%%%
	\thispagestyle{empty}%%%
	\if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi%%%
	\null\vfil\secdef\@part\@spart%%%
}%%%
%% 
%% \def\@part[#1]#2{%%%
%% 	\ifnum \c@secnumdepth >-2\relax%%%
%% 		\refstepcounter{part}%%%
%% 		\addcontentsline{toc}{part}{%%%
%% 			\protect\numberline{\thepart}{\uppercase{#1}}%%%
%% 		}%%%
%% 	\else%%%
%% 		\NormalResetSubCounters{part}%%%
%% 		\addcontentsline{toc}{part}{{\uppercase{#1}}}%%%
%% 	\fi%%%
%% 	\markboth{}{}{%%%
%% 		\centering%%%
%% 		\interlinepenalty \@M%%%
%% 		{%%%
%% 			\bfseries\large%%%
%% 			\ifnum \c@secnumdepth >-2\relax%%%
%% 				\MakeUppercase{\partname~\thepart}%%%
%% 				\par%%%
%% 				\vskip 20\p@%%%
%% 			\fi%%%
%% 			\MakeUppercase{#2}%%%
%% 		}%%%%
%% 		\par%%%
%% 	}%%%
%% %%%	\@endpart%%%
%% }%%%
%% 
%% \def\@spart#1{%%%
%% 	\addcontentsline{toc}{part}{{\uppercase{#1}}}%%%
%% 	\markboth{}{}{%%%
%% 		\centering\interlinepenalty \@M%%%
%% 		\negrito{\large\MakeUppercase{#1}}%%%%
%% 		\par%%%
%% 	}%%%
%% }%%%
%% 
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%
%% %%	CHAPTER environment command
%% %%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% \renewcommand\chapter{%%%
%% 	\NormalNewPage%%%
%% 	\global\@topnum\z@%%%
%% 	\@afterindentfalse%%%
%% 	\secdef\@chapter\@schapter%%%
%% }%%%
%% 
%% \def\@chapter[#1]#2{%%%
%% 	\ifnum \c@secnumdepth >\m@ne%%%
%% 		\refstepcounter{chapter}%%%
%% 		\typeout{\@chapapp\space\thechapter.}%%%
%% 		\addcontentsline{toc}{chapter}{%%%
%% 			\protect\numberline{\thechapter}{\uppercase{#1}}%%%
%% 		}%%%
%% 	\else%%%
%% 		\addcontentsline{toc}{chapter}{{\MakeUppercase{#1}}}%%%
%% 	\fi%%%
%% 	\if@twocolumn%%%
%% 		\@topnewpage[\@makechapterhead{#2}]%%%
%% 	\else%%%
%% 		\@makechapterhead{#2}%%%
%% 		\@afterheading%%%
%% 	\fi\par%%%
%% }%%%
%% 
%% \def\@makechapterhead#1{%%%
%% 	\negrito{%%%
%% 		\normalfont\large \singlespace%%%
%% 		\noindent%%%
%% 		\parbox[b]{\textwidth}%%%
%% 		{%%% parâmetro do texto do comando parbox
%% 			\parbox[t]{20mm}{\thechapter}%%%
%% 			\parbox[t]{\textwidth-20mm}{%%%
%% 				\interlinepenalty\@M%%%
%% 				\MakeUppercase{#1}%%%
%% 			}%%%
%% 		}%%%
%% 	}%%%
%% 	\vspace{5mm}%%% ou 15pt
%% }%%%
%% 
%% \def\@schapter#1{%%%
%% 	\if@twocolumn%%
%% 		\@topnewpage[\@makeschapterhead{#1}]%%%
%% 	\else%%%
%% 		\@makeschapterhead{#1}%%%
%% 		\@afterheading%%%
%% 	\fi%%%
%% 	\@mkboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}%%%
%% 	\addcontentsline{toc}{chapter}{{\MakeUppercase{#1}}}
%% 	\NormalResetSubCounters{chapter}%%%
%% 	\par%%%
%% }%
%% 
%% \def\@makeschapterhead#1{%%%
%% 	\par%%%
%% 	{\noindent\normalfont\bfseries\large\MakeUppercase{#1} \par}%%%
%% 	\vspace{10mm}%%%
%% 	\par%%% ou 30pt
%% }%%%
%% 
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%
%% %%	SECTION environment command
%% %%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% \def\NormalStartSection#1#2#3#4#5#6{%%%
%% 	\if@noskipsec \leavevmode \fi%%%
%% 	\par%%%
%% 	\@tempskipa #4\relax%%%
%% 	\@afterindenttrue%%%
%% 	\ifdim \@tempskipa <\z@%%%
%% 		\@tempskipa -\@tempskipa \@afterindentfalse%%%
%% 	\fi%%%
%% 	\if@nobreak%%%
%% 		\everypar{}%%%
%% 	\else%%%
%% 		\addpenalty\@secpenalty\addvspace\@tempskipa%%%
%% 	\fi%%%
%% 	\@ifstar%%%
%% 	{\NormalSSect{#1}{#4}{#5}{#6}}%%%
%% 	{\@dblarg{\NormalSect{#1}{#2}{#3}{#4}{#5}{#6}}}%%%
%% }%%%
%% 
%% \def\NormalSSect#1#2#3#4#5{%%%
%% 	\@tempskipa #3\relax%%%
%% 	\ifdim \@tempskipa>\z@%%%
%% 		\begingroup%%%
%% 			#4{\interlinepenalty \@M \centering #5\@@par}%%%
%% 		\endgroup%%%
%% 		\@ifundefined{Normal#1mark}{}{%%%
%% 			\csname Normal#1mark \endcsname{#5}%%%
%% 		}%%%
%% 		\addcontentsline{toc}{#1}{#5}%%% if then
%% 	\else%%%
%% 		\def\@svsechd{%%%
%% 			#4{#5}%%%
%% 			\@ifundefined{Normal#1mark}%%%
%% 			{}{\csname Normal#1mark \endcsname{#5}}%%%
%% 			\addcontentsline{toc}{#1}{#5}%%% if then
%% 		}%%%
%% 	\fi%%%
%% 	\@xsect{#3}%%%
%% }%%%
%% 
%% \def\NormalSect#1#2#3#4#5#6[#7]#8{%%%
%% 	\ifnum #2>\c@secnumdepth%%%
%% 		\let\@svsec\@empty%%%
%% 	\else%%%
%% 		\refstepcounter{#1}%%%
%% 		\protected@edef\@svsec{\@seccntformat{#1}\relax}%%%
%% 	\fi%%%
%% 	\@tempskipa #5\relax%%%
%% 	\ifdim \@tempskipa>\z@%%%
%% 		{#6\noindent%%%
%% 			\parbox[b]{\textwidth}{%%%
%% 				\parbox[t]{20mm}{\@svsec}%%%
%% 				\parbox[t]{\textwidth-20mm}{#7}%%%
%% 			}%%%
%% 		}%%%
%% 		\@ifundefined{Normal#1mark}{}{%%%
%% 			\csname Normal#1mark \endcsname{#7}%%%
%% 		}%%%
%% 		\addcontentsline{toc}{#1}{%%%
%% 			\ifnum #2>\c@secnumdepth \else%%%
%% 				\protect\numberline{\csname the#1\endcsname}%%%
%% 			\fi%%%
%% 			#7}%%%
%% 	\else%%%
%% 		\def\@svsechd{%%%
%% 			{#6\noindent%%%
%% 				\parbox[b]{\textwidth}{%%%
%% 					\parbox[t]{20mm}{\@svsec}%%%
%% 					\parbox[t]{\textwidth-20mm}{#7}%%%%
%% 				}%%%
%% 			}%%%
%% 			\@ifundefined{Normal#1mark}%%%
%% 				{}%%%
%% 				{\csname ABNT#1mark \endcsname{#7}}%%%
%% 			\addcontentsline{toc}{#1}{%%%
%% 				\ifnum #2>\c@secnumdepth \else%%%
%% 					\protect\numberline{%%%
%% 						\csname the#1\endcsname%%%
%% 					}%%%
%% 				\fi%%%
%% 				#7%%%
%% 			}%%%
%% 		}%%%
%% 	\fi%%%
%% 	\@xsect{#5}%%%
%% }%%%
%% 
%% \renewcommand\section{%
%% 	\NormalStartSection{section}%1.
%% 		{1}%2.
%% 		{\z@}%3.
%% 		{-3.5ex\@plus -1ex \@minus -.2ex}%4.
%% 		{2.3ex \@plus.2ex}%5.
%% 		{\singlespacing\normalfont\bfseries\normalsize}%6.
%% }%
%% 
%% \renewcommand\subsection{%
%% 	\NormalStartSection{subsection}%1o.
%% 		{2}%2o.
%% 		{\z@}%3o.
%% 		{-3.25ex\@plus -1ex \@minus -.2ex}%4.
%% 		{1.5ex \@plus.2ex}%5.
%% 		{\singlespacing\normalfont\bfseries\normalsize}%6.
%% }%
%% 
%% \renewcommand\subsubsection{%
%% 	\NormalStartSection{subsubsection}%1o.
%% 		{3}%2o.
%% 		{\z@}%3o.
%% 		{-2.25ex\@plus -1ex \@minus -.2ex}%4.
%% 		{0.7ex \@plus.2ex}%5.
%% 		{\singlespacing\normalfont\bfseries\normalsize}%6.
%% }%
%% 
%% \renewcommand\paragraph{%
%% 	\NormalStartSection{paragraph}%1o.
%% 		{4}%2o.
%% 		{\z@}%3o.
%% 		{3.25ex\@plus 1ex \@minus .2ex}%4.
%% 		{-1em}%5.
%% 		{\singlespacing\normalfont\bfseries\normalsize}%6.
%% }%
%% 
%% \renewcommand\subparagraph{%
%% 	\NormalStartSection{subparagraph}%1o.
%% 		{5}%2o.
%% 		{\z@}%3o.
%% 		{3.25ex\@plus 1ex \@minus .2ex}%4.
%% 		{-1em}%5.
%% 		{\singlespacing\normalfont\bfseries\normalsize}%6.
%% }%
%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	This should be the last command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	End of class file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%