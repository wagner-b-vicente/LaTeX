%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%	freemasonry.cls
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
%%  Versão: 1.0.0 - 24/01/2025 - ID: v1.0.0
%%  . This initial version is a copy from 'macom.sty' version 1.0.0, 04/11/2022
%%  . Development of the 'macom.sty' file began on 2013-05-01,
%%    with version ID v0.0.1.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Identificação da classe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}%[1995/12/01]%%
\ProvidesClass{freemasonry}[2025/01/24 Freemasonry LaTeX document class]%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- Freemasonry definition - start ---------------------------------------------

%------------------------------------------------------------------------------
%
%   Load Defaults options and pass to base class 'book.cls'
%
%------------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}%
\ProcessOptions%
\LoadClass[a4paper,twoside,onecolumn,final,openright,openbib]{book}%

%------------------------------------------------------------------------------
%
%   Load all packages used in this solution.
%
%------------------------------------------------------------------------------
\RequirePackage[english,brazil]{babel}% % Support Multi-language
\RequirePackage[utf8]{inputenc}%        % Accept different input encodings
\RequirePackage[T1]{fontenc}%         	% Std. pckg. 4 selecting font encodings
\RequirePackage{calc}%	              	% Simple arithmetic in LaTeX commands
\RequirePackage{dsfont}%              	% Double Stronker Fonts
\RequirePackage{setspace}%              % Set space between lines
%
\RequirePackage[nolist]{acronym}%       % Expand acronyms at least once
\RequirePackage{color}%                 %
\RequirePackage{cjhebrew}%              % Typeset Hebrew with LaTeX
\RequirePackage{fancyvrb}%            	% Sophisticated verbatim text
\RequirePackage{xstring}%               % Tratamento de strings.
\RequirePackage{amsbsy}%              	% Produce bold math symbols (AMS-LaTeX)
\RequirePackage{amsfonts}%            	% TeX fonts from the American Math Society
\RequirePackage{amsmath}%             	% AMS mathematical facilities for LaTeX
\RequirePackage{amssymb}%             	%
\RequirePackage[pdftex]{graphicx}%      %
\RequirePackage[table]{xcolor}%         %
\RequirePackage{longtable}%             % Allow tables to flow over page boundaries
\RequirePackage{forloop}%               % Iteration in LaTeX
\RequirePackage{xparse}%                % A generic document command parser
%
% \RequirePackage[mathscr]{eucal}%      %% New calligraphic letters
% \RequirePackage{ifthen}%              %% Conditional commands in LaTeX documents
% \RequirePackage{indentfirst}%         %% Indent 1st paragraph after section header
% \RequirePackage{makeidx}%             %% Std. LaTeX package for creating indexes
% \RequirePackage{multicol}%            %%
% \RequirePackage{mathrsfs}%            %%
% \RequirePackage{latexsym}%            %% Mathematic symbols
% \RequirePackage{microtype}%           %% para melhorias de justificação
% \RequirePackage{url}%	              %% Active call of URL from PDF
% \RequirePackage[pdftex,colorlinks=false]{hyperref}%%%
% \RequirePackage{epsfig}%%%

%------------------------------------------------------------------------------
%
%   Page definitions
%
%------------------------------------------------------------------------------
\newlength\freemasonryTopMargin%
\newlength\freemasonryBottonMargin%
\newlength\freemasonryRightMargin%
\newlength\freemasonryLeftMargin%

\setlength{\freemasonryTopMargin}{35mm}%
\setlength{\freemasonryBottonMargin}{20mm}%
\setlength{\freemasonryRightMargin} {20mm}%
\setlength{\freemasonryLeftMargin}  {30mm}%

%	Set Top paper configurations
\setlength{\voffset}{-1in}%
\setlength{\topmargin}{5mm}%
\setlength{\headheight}{5mm}%
\setlength{\headsep}{\freemasonryTopMargin}%

%	Set Botton paper configuration
\setlength{\textheight}{%
	\paperheight-\topmargin-\headheight-\headsep-\freemasonryBottonMargin%
}%

%	Set Left paper configurations
\setlength{\hoffset}{\freemasonryLeftMargin-1in}%
\setlength{\oddsidemargin}{0mm}%
\setlength{\evensidemargin}{-10mm}%
\setlength{\marginparwidth}{0mm}%
\setlength{\marginparsep}{0mm}%

%	Set Right paper configuration
\setlength{\textwidth}{%
	\paperwidth-1in-\hoffset-\oddsidemargin-\freemasonryRightMargin%
}%

%	Set paragraph indentation and border
\setlength\parindent{20mm}%
\setlength\parskip{3mm}%

%------------------------------------------------------------------------------
%
%   Set Default Font as 'arial'
%
%------------------------------------------------------------------------------
% \IfFileExists{helvet.sty}{\RequirePackage{helvet}}{}%
% \IfFileExists{helvetic.sty}{\RequirePackage{helvetic}}{}%
% \renewcommand{\rmdefault}{phv}%
% \fontfamily{phv}%
\RequirePackage{helvet}%
\renewcommand{\rmdefault}{phv}%
\renewcommand{\sfdefault}{\rmdefault}%
\renewcommand{\familydefault}{\sfdefault}%

%------------------------------------------------------------------------------
%
%   General non Masonic definitions
%
%------------------------------------------------------------------------------

\def\dia{}%
\def\mes{}%
\def\ano{}%
%
\def\nomeMes{%
  \ifcase\mes\or janeiro\or fevereiro\or março\or abril\or maio\or junho%
  \or julho\or agosto\or setembro\or outubro\or novembro\or dezembro\fi%
}%

\def\diaCardinal{%
  \ifcase\dia\or um\or dois\or três\or quatro\or cinco\or seis\or sete\or oito\or nove\or dez%
  \or onze\or doze\or treze\or quatorze\or quinze\or dezesseis\or dezesete\or dezoito\or dezenove\or vinte%
  \or vinte e um\or vinte e dois\or vinte e três\or vinte e quatro\or vinte e cinco\or vinte e seis%
  \or vinte e sete\or vinte e oito\or vinte e nove\or trinta\or trinta e um\or dia inválido\fi%
}%
%
\def\aspas#1{``#1''}%

%
\def\aspassimples#1{`#1'}%

%
\def\italico#1{{\slshape #1}}%

%
\def\negrito#1{{\bfseries #1}}%

%
\def\sublinhado#1{\underline{#1}}%

%
\def\citacao#1#2{\vskip 2mm{\singlespacing\footnotesize\hfill%
    \begin{minipage}{\textwidth-40mm}%%
      \aspas{#1}. \ifx&#2&\else(#2)\fi%
    \end{minipage}}\vskip 5mm%
}%

%
\def\citado{%
  \list{}{%
    \singlespacing\footnotesize%
    \setlength{\listparindent}{0mm}%
    \setlength{\itemindent}{\listparindent}%
    \setlength{\rightmargin}{0mm}%
    \setlength{\leftmargin}{40mm}%
    \setlength{\parsep}{0pt}%
    \item[]%
  }%
}%

%
\let\endcitado\endlist%

%
%  Create a new counter to add in list or order things.
\newcounter{FreemasonryCounter}%
\def\ShowSequenceNumber{\stepcounter{FreemasonryCounter}\theFreemasonryCounter}%

%
%  This definitions add Blanks lines in a table
\ExplSyntaxOn%
\DeclareExpandableDocumentCommand{\AddBlankRowsToTable}{m m}{%
  \prg_replicate:nn { #1 } {\hline #2 \\[5pt]}%
}%
\ExplSyntaxOff%

%
\def\Titulo#1{\vskip 15pt\noindent{\fontsize{14}{1}\selectfont\sc #1 \vskip 3pt}}%

%
\def\Secao#1{\vskip 5mm\noindent{\fontsize{13}{1}\selectfont\negrito{#1}}\vskip 3mm}%

%
%   Words in Hebrew characters
%   Input parameters:
%   #1  - only a number to define <fontsize>
%   #2  - string to be write in hebrew characters
%------------------------------------------------------------------------------   
\def\TheHebrewWord[#1]#2{%
	\ifnum#1>0{\fontsize{#1}{1}\selectfont\<#2>}\else\<#2>\fi%
}%

%
%   Letter Expander
%   Input parameters:
%   #1  - size to input in \kern command distance between letters
%   #2  - string or word
%------------------------------------------------------------------------------   
\def\LetterExpander[#1]#2{\makeatletter\@tfor\EachLetter:=#2\do{\EachLetter\kern #1pt}}%

%------------------------------------------------------------------------------
%
%   General Masonic definitions
%
%------------------------------------------------------------------------------

%	A conditional to insert or not the logo image lodge
\newif\if@timbreimage%
\@timbreimagefalse%

%   General Definitions will be used
%------------------------------------------------------------------------------
\newcount\@MaxLen%
\newcount\@ItemAtual%
\def\strAnd{~e~}%
\def\strComma{,~}%
%
\xdef\threeDots{\raise .15ex \hbox{$\therefore$}}%
\xdef\oneDot{.}%

%
%	Sigla maconica ou abreviações maconias
%   Input parameters:
%   #1  - Acronym or (Sigla)
%------------------------------------------------------------------------------
\def\SM#1{\StrSubstitute{#1}{\oneDot}{\threeDots}}%
% \def\SM#1{\StrSubstitute{#1}{.}{\raise.15ex\hbox{$\therefore$}}}%
% \def\SM#1{\makeatletter%
%   \@tfor\EachLetter:=#1\do{\ifx\EachLetter\oneDot\threeDots\else\EachLetter\fi}%
% }%
%
\def\TheJob#1{\noindent{\fontsize{13}{1}\selectfont{\bfseries Trabalho :} #1}\vskip 5mm}%
%
%------------------------------------------------------------------------------
%   Set configuration to Masonry Treatment Pronoun
%------------------------------------------------------------------------------
\def\TheSingular{s}%
\def\ThePlural{p}%
%
%   Masonic Treatment Pronoun
%   Input parameters:
%   #1  - < s | p > -> Singular or Plural
%   #2  - Degree number
%------------------------------------------------------------------------------
\def\TheMasonicTreatmentPronoun#1#2{%
\ifnum#2>18%
  \ifnum#2>32%
    Poderoso\if\ThePlural#1{s}\fi~%
  \else%
    Mui Respeitáve\if\ThePlural#1{is}\else{l}\fi~%
  \fi%
\else%
  \ifnum#2>3%
    Respeitáve\if\ThePlural#1{is}\else{l}\fi~%
  \else%
    \ifnum#2=3%
      Veneráve\if\ThePlural#1{is}\else{l}\fi~%
    \fi%
  \fi%
\fi%
Irmão\if\ThePlural#1{s}\fi%
}%

%
%   Degree acronym
%   Input parameters:
%   #1  - Degree number
%------------------------------------------------------------------------------
\def\TheDegreeAcronyms#1{%
% \ifnum#1=33$\vcenter{\hbox{\includegraphics[scale=0.12]{Pin33.png}}}$\else%
  \ifnum#1=1\SM{A.M.}\else%
    \ifnum#1=2\SM{C.M.}\else%
      \ifnum#1=3\SM{M.M.}\else\SM{#1.}\fi%
    \fi%
  \fi%
% \fi%
}%

%
%   The Degree Full Name of REAA
%   Input parameters:
%   #1  - Degree number
%------------------------------------------------------------------------------
\def\TheREAADegreeFullName#1{%
\ifcase#1%
\or Aprendiz%
\or Companheiro%
\or Mestre%
\or Mestre Secreto%
\or Mestre Perfeito%
\or Secretário Íntimo%
\or Preboste e Juiz%
\or Intendentes dos Edifícios%
\or Mestre Eleito dos Nove%
\or Ilustre Eleito dos Quinze%
\or Sublime Cavaleiro Eleito%
\or Grão Mestre Arquiteto%
\or Cavaleiro do Real Arco%
\or Grande Eleito ou Perfeito e Sublime Maçom%
\or Cavaleiro do Oriente e da Espada%
\or Príncipe de Jerusalém%
\or Cavaleiro do Oriente e do Ocidente%
\or Cavaleiro Rosa Cruz%
\or Grande Pontífice ou Sublime Escocês%
\or Venerável Mestre das Lojas Regulares ou Grão Mestre Ad Vitam%
\or Noaquita ou Cavaleiro Prussiano%
\or Cavaleiro do Real Machado ou Príncipe do Libano%
\or Chefe do Tabernáculo%
\or Príncipe do Tabernáculo%
\or Cavaleiro da Serpente de Bronze%
\or Escocês Trinitário ou Príncipe da Mercê%
\or Grande Comendador do Templo%
\or Cavaleiro do Sol ou Príncipe Adepto%
\or Grande Escocês de Santo André ou Patriarca das Cruzadas%
\or Cavaleiro Kadosch ou Cavaleiro da Águia Branca e Preta%
\or Grande Inspetor Inquisidor Comendador%
\or Sublime Príncipe do Real Segredo%
\or Grande Inspetor Geral da Ordem%
\fi%
}%

%------------------------------------------------------------------------------
%   Declaration de Irmão ou Irmãos.
%------------------------------------------------------------------------------

%   Brother Definition
%------------------------------------------------------------------------------
\def\Ir{\secdef\@mainIr\@secondaryIr}%

%   Main Brother Definition
%   Input parameters:
%   #1  - Brother Degree
%   #2  - Brother Code to find in acronyms
%------------------------------------------------------------------------------
\def\@mainIr[#1]#2{%
\TheMasonicTreatmentPronoun{s}{#1}~\acl{#2},~\TheDegreeAcronyms{#1}%
}%

%   Secondary Brother Definition
%   Input parameters:
%   #1  - Brother Degree
%   #2  - Brother Nome
%------------------------------------------------------------------------------
\def\@secondaryIr[#1]#2{%
\TheMasonicTreatmentPronoun{s}{#1}~#2,~\TheDegreeAcronyms{#1}%
}%

%   The Brothers Definition
%   Input parameters:
%   #1  - Brother Degree
%   #2  - Array Brother Code to find in acronyms
%------------------------------------------------------------------------------
\def\IIr[#1]#2{%
  \TheMasonicTreatmentPronoun{p}{#1}%
  \ifx&#2&\else~\fi%
  \@MaxLen\z@%
  \@ItemAtual\z@%
  \@for\@aux:=#2\do{\advance\@MaxLen\@ne}%
  \def\NextIr{\def\NextIr{\ifnum\the\@MaxLen=\the\@ItemAtual\strAnd\else\strComma\fi}}%
  \@for\@ir:=#2\do{\advance\@ItemAtual\@ne\NextIr\acl\@ir,~\TheDegreeAcronyms{#1}}%
}%

%------------------------------------------------------------------------------
%   Greetings, Mottos, Themes and Slogans
%------------------------------------------------------------------------------

%------------------------------------------------------------------------------
%   Symbolic
%------------------------------------------------------------------------------

\def\TheSFU{\noindent\begin{center}\SM{F.}\vskip 3mm\SM{S.}\hskip 6.93mm\SM{U.}\end{center}}%
%
\def\TheSSS{\noindent\begin{center}\SM{S.}\vskip 3mm\SM{S.}\hskip 6.93mm\SM{S.}\end{center}}%
%
\def\SymbolicSalutation{%
\centerline{\sc{À Glória do Grande Arquiteto do Universo}}\par\vskip 12pt%
\centerline{\SM{V.M.}~--~\SM{1º Vig.}~--~\SM{2º Vig.}~--~\SM{OOf.}~--~\italico{Past Master}~--~Meus \IIr[1]{}}%
}%

%------------------------------------------------------------------------------
%   Higher degrees or Superior Degrees
%------------------------------------------------------------------------------

\def\TheSupremoConselhoName{Supremo Conselho dos Graus Escoceses 4 a 33 para o Brasil}%

%   Higher Degree Salutation
%   Input parameters:
%   #1  - Salutation description
%------------------------------------------------------------------------------
\def\HigherDegreeSalutation#1{\noindent\centerline{\aspas{\sc #1}}}%

%
\def\TheDeusMeumqueJus{Deus Meumque Jus}%
%
\def\TheFullNameAUTOSAG{Ad Universi Terrarum Orbis Summi Architecti Gloriam}%
%
\def\TheCaptionSupremo{Lvcen Pacen Ivstitiam Vniverse Porto}%
%
\def\TheDivisaSupremo{Laus Deo}%
%
\def\TheDivisaConsistorio{Lux Populi Dei}%
%
\def\TheDivisaKadosch{Ordo Ab Chao}%
%
\def\TheDivisaCapitulo{Lux ex Tenebris}%
%

%------------------------------------------------------------------------------
%
%   Page Style Declaration for all Lodges
%
%------------------------------------------------------------------------------

%
%   Symbolic Lodge - APOSTOLOS PAULISTAS
%
%------------------------------------------------------------------------------
\def\TheApostolosPaulistasAcron{\SM{Aug.~e Resp.~Benem.~Loj.~Simb.}}%
%
\def\TheApostolosPaulistasName{Apóstolos Paulistas}%
%
\def\TheApostolosPaulistasNumber{nº 91}%
%
\def\TheApostolosPaulistasImage{\includegraphics[width=34mm]{arls-ap.png}}%
%
\def\TheApostolosPaulistasAddress{%
	\singlespace{\fontsize{8}{1}\selectfont%
		Rua Doutor Olavo Egídio, nº 185 - Santana\vskip -6pt São Paulo - SP - CEP 02037-000%
	}%
}%
%
\def\TheApostolosPaulistasHeader{%
	{\fontsize{12}{1}\selectfont%
		\TheApostolosPaulistasAcron~\TheApostolosPaulistasName~-~\TheApostolosPaulistasNumber%
	}\vskip 5mm%
	{\fontsize{10}{1}\selectfont%
		Filiada ao Grande Oriente Paulista (\negrito{GOP}),\vskip 1.5mm%
		Integrante da Confederação Maçônica do Brasil (\negrito{COMAB}) e da\vskip -1mm%
		Confederação Maçônica Interamericana (\negrito{CMI})%
	}%
}%
%
\def\ps@PapelTimbradoApostolosPaulistas{%
	\renewcommand{\@oddhead}{%
	\noindent%
	\if@timbreimage%
	\parbox[c]{25mm}{\vskip -2mm\hskip -10mm \TheApostolosPaulistasImage}%
	\parbox{\textwidth-25mm}{{\centering\TheApostolosPaulistasHeader\par}}%
	\else%
	\parbox{\textwidth}{{\centering\TheApostolosPaulistasHeader\par}}%
	\fi%
	}%
  %
	\renewcommand{\@oddfoot}{%
	\begin{minipage}{\textwidth}%
		\begin{center}%
			\TheApostolosPaulistasAddress%
			\vskip -22pt\hfill{\fontsize{8}{1}\selectfont\thepage}%
		\end{center}%
	\end{minipage}%
	}%
  %
	\let\@evenhead\@empty%
	\renewcommand{\@evenfoot}{%
	\noindent
	\begin{minipage}{\textwidth}%
			\hfill{\fontsize{8}{1}\selectfont\thepage}%
	\end{minipage}%
	}%
}%
%

%
%   Symbolic Lodge - DANYLO JOSÉ FERNANDES
%
%------------------------------------------------------------------------------
\def\TheDanyloJoseFernandesAcron{\SM{Aug.~e Resp.~Benem.~Loj.~Simb.}}%
%
\def\TheDanyloJoseFernandesName{Danylo José Fernandes}%
%
\def\TheDanyloJoseFernandesNumber{nº 90}%
%
\def\TheDanyloJoseFernandesImage{\includegraphics[width=34mm]{arls-djf.png}}%
%
\definecolor{ColorDanyloJoseFernandes}{rgb}{.58,.21,.20}% ( 148, 54, 52 )
%
\def\TheDanyloJoseFernandesHeader{%
	{\fontsize{10}{1}\selectfont%
		\TheDanyloJoseFernandesAcron~\TheDanyloJoseFernandesName~-~\TheDanyloJoseFernandesNumber%
	}\vskip 2mm%
	{\fontsize{8}{1}\selectfont%%
		Filiada ao Grande Oriente Paulista (\negrito{GOP}),\vskip 1.5mm%
		Integrante da Confederação Maçônica do Brasil (\negrito{COMAB}) e da\vskip -1.5mm%
		Confederação Maçônica Interamericana (\negrito{CMI})%
	}%
}%
%
\def\TheDanyloJoseFernandesFooter{%
	\noindent{\color{ColorDanyloJoseFernandes}\rule{\textwidth}{1pt}}\par%
	{\fontsize{10}{1}\selectfont%
		\TheDanyloJoseFernandesAcron~\TheDanyloJoseFernandesName~--~\TheDanyloJoseFernandesNumber\vskip 0.1mm%
	}%
	{\fontsize{8}{1}\selectfont%
		Sob os auspícios do Grande Oriente Paulista -- \negrito{\SM{G.O.P.}}\vskip 0.1mm%
	}%
	\TheDanyloJoseFernandesAddress\vskip 0.1mm%
}%
%
\def\TheDanyloJoseFernandesAddress{%
	\singlespace{\fontsize{8}{1}\selectfont%
		Rua Doutor Olavo Egídio, nº 185 -- Santana -- São Paulo -- SP%
	}%
}%
%
\def\ps@PapelTimbradoDanyloJoseFernandes{%
	\renewcommand{\@oddhead}{%
	\noindent%
	\if@timbreimage%
		\hspace{-30mm}\colorbox{ColorDanyloJoseFernandes}{\parbox[c][25mm]{210mm}{%
		\hspace{20mm}\parbox[c]{30mm}{\TheDanyloJoseFernandesImage}%
		\parbox{\textwidth-30mm}{\vspace{3mm}{\centering\textcolor{white}{\TheDanyloJoseFernandesHeader}}\vspace{3mm}}%
		}}%
	\else%
		\hspace{-30mm}\colorbox{ColorDanyloJoseFernandes}{\parbox[c][25mm]{210mm}{%
			\hspace{30mm}\parbox{\textwidth}{\vspace{3mm}{\centering\textcolor{white}{\TheDanyloJoseFernandesHeader}}\vspace{3mm}}%
		}}%
	\fi%
	}%
	\renewcommand{\@oddfoot}{%
	\noindent%
	\begin{minipage}{\textwidth}%
		\begin{center}%
			\textcolor{ColorDanyloJoseFernandes}{{\fontsize{8}{1}\selectfont\thepage}\TheDanyloJoseFernandesAddress}%
		\end{center}%
	\end{minipage}%
	}%
	\let\@evenhead\@empty%
	\renewcommand{\@evenfoot}{%
	\noindent%
	\begin{minipage}{\textwidth}%
		\begin{center}%
			\textcolor{ColorDanyloJoseFernandes}{{\fontsize{8}{1}\selectfont\thepage}}%
		\end{center}%
	\end{minipage}%
	}%
}%
%

%
%   Higher Degree - Capitulo de Cavaleiros Rosa Cruz - RICARDO BLOISE
%
%------------------------------------------------------------------------------
\def\TheRicardoBloiseImage{\includegraphics[width=34mm]{ricardo-bloise.png}}%
%
\def\TheRicardoBloiseName{Sublime Capítulo de Cavaleiros Rosa Cruz \aspas{Ricardo Bloise}}%
%
\definecolor{ColorRicardoBloise}{rgb}{.67,.08,.12}% ( 170, 20, 30 )
%
\def\TheRicardoBloiseHeader{%
	\textcolor{ColorRicardoBloise}{\singlespace%
		{\fontsize{14}{1}\selectfont\TheExtraAUTOSAG}\vskip 0pt%
		{\fontsize{12}{1}\selectfont\negrito{\TheRicardoBloiseName}}\vskip 0pt%
		{\fontsize{10}{1}\selectfont Subordinado ao \TheSupremoConselhoName}\vskip 0pt%
		{\fontsize{08}{1}\selectfont Vale de São Paulo - SP}\vskip 0pt%
		{\fontsize{07}{1}\selectfont 1ª \uppercase{Região Litúrgica - São Paulo}}\vskip 0pt%
	}%
}%
%
\def\TheRicardoBloiseFoundation{%
	\textcolor{ColorRicardoBloise}{\fontsize{6}{1}\usefont{T1}{phv}{b}{n} Fundado em 06-04-1990}%
}%
%
\def\TheRicardoBloiseAddress{%
	\singlespace{\fontsize{8}{1}\selectfont%
		Rua Doutor Olavo Egídio, nº 185 - Santana\vskip -6pt São Paulo - SP - CEP 02037-000%
	}%
}%
%
\def\ps@PapelTimbradoRicardoBloise{%
	\renewcommand{\@oddhead}{%
	\noindent%
	\if@timbreimage%
	\parbox[c]{25mm}{\vskip -2mm\hskip -10mm \TheRicardoBloiseImage}%
	\parbox{\textwidth-25mm}{{\centering\TheRicardoBloiseHeader\par}}%
	\else%
	\parbox{\textwidth}{{\centering\TheRicardoBloiseHeader\par}}%
	\fi%
	}%
	\renewcommand{\@oddfoot}{%
	\begin{minipage}{\textwidth}%
		\begin{center}%
			\textcolor{ColorRicardoBloise}{\TheRicardoBloiseAddress}%
		\end{center}%
	\end{minipage}%
	}%
	\let\@evenhead\@empty%
	\let\@evenfoot\@empty%
}%
%

%
%   Higher Degree - Conselho Filosófico de Cavaleiros Kadosh - JOSÉ CACCÁOS
%
%------------------------------------------------------------------------------
\def\TheExtraAUTOSAG{\SM{A\kern 6pt .\kern 6pt U\kern 6pt .\kern 6pt T\kern 6pt .\kern 6pt O\kern 6pt .\kern 6pt S\kern 6pt .\kern 6pt A\kern 6pt .\kern 6pt G\kern 6pt .}}%

\def\TheJoseCaccaosImage{\includegraphics[width=34mm]{kadosh-jose-caccaos.png}}%
%
\def\TheJoseCaccaosTitle{Venerando Ilustre Conselho Filosófico de Cavaleiros Kadosch}%
%
\def\TheJoseCaccaosName{José Caccáos}%
%
\def\TheJoseCaccaosHeader{%
	{\singlespace%
		{\vskip -3pt\fontsize{12}{1}\selectfont\TheExtraAUTOSAG\vskip 9pt}%
		{\fontsize{10,5}{1}\selectfont%
			\negrito{\TheJoseCaccaosTitle}\vskip 3pt%
			\negrito{\aspas{\TheJoseCaccaosName}}\vskip 3pt%
		}%
		{\fontsize{8}{1}\selectfont%
			\SM{Subor.}~ao \TheSupremoConselhoName\vskip 3pt%
			\SM{Jurisd.}~ao \ThePitagorasTitle\vskip 3pt%
			Grande Delegacia da 1ª Região Litúrgica -- São Paulo\vskip 1pt%
		}%
	}%
}%
%
\def\ps@PapelTimbradoJoseCaccaos{%
	\renewcommand{\@oddhead}{%
	\noindent%
	\if@timbreimage%
	\parbox[c]{25mm}{\vskip -2mm\hskip -10mm \TheJoseCaccaosImage}%
	\parbox{\textwidth-25mm}{{\centering\TheJoseCaccaosHeader\par}}%
	\else%
	\parbox{\textwidth}{{\centering\TheJoseCaccaosHeader}}%
	\fi%
	}%
	\let\@evenhead\@empty%
	\renewcommand{\@oddfoot}{%
	\noindent%
	\begin{minipage}{\textwidth}%
		\begin{center}%
			\thepage%
		\end{center}%
	\end{minipage}%
	}%
	\let\@evenfoot\@oddfoot%
}%
%

%
%   Higher Degree - Consistório PITAGORAS de Principes do Real Segredo
%
%------------------------------------------------------------------------------
\def\ThePitagorasImage{\includegraphics[width=34mm]{consistorio-pitagoras.png}}%
%
\def\ThePitagorasName{Pitágoras}%
%
\def\ThePitagorasTitle{\SM{Mui Pod.~Consist.~\aspas{\ThePitagorasName}~de PPrínc.~do R.~S.}}%
%
\definecolor{ColorPitagoras}{rgb}{.60,.00,.20}% ( 153, 0, 51 )
%
\def\ThePitagorasHeader{%
	\textcolor{ColorPitagoras}{\singlespace%
		{\fontsize{12}{1}\selectfont\sc{\TheFullNameAUTOSAG}\vskip 3pt}%
		{\fontsize{12}{1}\selectfont\ThePitagorasTitle\vskip 3pt}%
		{\fontsize{10}{1}\selectfont%
			\SM{Subor.}~ao \TheSupremoConselhoName\vskip 3pt%
			1ª Região Litúrgica -- São Paulo\vskip 1pt%
		}%
	}%
}%
%
\def\ps@PapelTimbradoPitagoras{%
	\renewcommand{\@oddhead}{%
	\noindent%
	\if@timbreimage%
	\parbox[c]{25mm}{\vskip -2mm\hskip -10mm \ThePitagorasImage}%
	\parbox{\textwidth-25mm}{{\centering\ThePitagorasHeader\par}}%
	\else%
	\parbox{\textwidth}{{\centering\ThePitagorasHeader}}%
	\fi%
	}%
	\let\@evenhead\@empty%
	\renewcommand{\@oddfoot}{%
	\noindent%
	\begin{minipage}{\textwidth}%
		\begin{center}%
			\thepage%
		\end{center}%
	\end{minipage}%
	}%
	\let\@evenfoot\@oddfoot%
}%
%

%------------------------------------------------------------------------------
%
%   This Declaration Section will be always the last configurations line.
%
%------------------------------------------------------------------------------

%
%   Set Last parameters
%------------------------------------------------------------------------------

\def\TheDefaultSalutation{}%
%
\def\TheDefaultLocation{}%
%

%
\DeclareOption{timbre}{\@timbreimagetrue}%
%
\DeclareOption{arlsap}{%
  \setlength{\freemasonryTopMargin}{40mm}%
  \pagestyle{PapelTimbradoApostolosPaulistas}%
  \let\TheDefaultSalutation\TheSFU%
  \def\TheDefaultLocation{Oriente}%
}%
%
\DeclareOption{arlsdjf}{%
	\pagestyle{PapelTimbradoDanyloJoseFernandes}%
	\let\TheDefaultSalutation\TheSFU%
	\def\TheDefaultLocation{Oriente}%
}%
%
\DeclareOption{sccrcrb}{%
	\pagestyle{PapelTimbradoRicardoBloise}%
	\def\TheDefaultSalutation{\HigherDegreeSalutation{\TheDivisaCapitulo}}%
	\def\TheDefaultLocation{Vale}%
}%
%
\DeclareOption{kadoshjc}{%%
	\setlength{\freemasonryTopMargin}{40mm}%%%
	\pagestyle{PapelTimbradoJoseCaccaos}%%
	\def\TheDefaultSalutation{\HigherDegreeSalutation{\TheDivisaKadosch}}%
	\def\TheDefaultLocation{Clima}%%
}%%
%
\DeclareOption{consistorio}{%%
	% \setlength{\margemsuperior}{35mm}%%%
	\pagestyle{PapelTimbradoPitagoras}%%
	\def\TheDefaultSalutation{\HigherDegreeSalutation{\TheDivisaConsistorio}}%
	\def\TheDefaultLocation{Acampamento}%%
}%
%

%   This instruction is the last configuration line.
\ProcessOptions\relax%

%- Freemasonry definition - end -----------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	End of file 'freemasonry.cls'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
