%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para
%% a Faculdade de Tecnologia - FTEC
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is SEU_NOME, SEU_EMAIL
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ftex}[2016/06/25 v1.0 Modelo da Faculdade de Tecnologia - FTEC baseado em abnTeX2]

%
% Repassa todos os parametros a classe abntex2, 
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax
\LoadClass{abntex2}

\makeatother
% ---
% Margens
%---
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout
% ---
% Espaçamentos entre linhas e parágrafos
% ---

\renewcommand{\baselinestretch}{1.5}

% ---
% O tamanho do parágrafo é dado por:
\setlength{\parindent}{1.5cm}

% Controle do espaçamento entre um parágrafo e outro:
%\setlength{\parskip}{0.2cm}  % tente também \onelineskip
% ---

% ---
% Fontes padroes de part, chapter, section, subsection e subsubsection
% Alterado do abntex para fontes tamanho normal
\renewcommand{\ABNTEXchapterfont}{\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}
\renewcommand{\ABNTEXsectionfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\ABNTEXchapterfontsize}
\renewcommand{\ABNTEXsubsectionfont}{\bfseries}
\renewcommand{\ABNTEXsubsectionfontsize}{\ABNTEXchapterfontsize}
\renewcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsectionfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\itshape}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}
% ---

% ---
% Normalização de espaçamento entre o título e o texto
\setlength{\afterchapskip}{\baselineskip}
% ---

% -----
% Configuracoes do TOC
% -----
% nivel de profundidade (permite apenas 5 níves)
\setsecnumdepth{paragraph}
\settocdepth{paragraph}
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}
\maxsecnumdepth{paragraph}

% sumário

% No caso de Sumario (TOC) tradicional
\makeatletter
\ifthenelse{\boolean{ABNTEXsumario-tradicional}}{
	\settocpreprocessor{chapter}{%
	\let\tempf@rtoc\f@rtoc%
	\def\f@rtoc{%
	\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
	}
	\settocpreprocessor{part}{%
	\let\tempf@rtoc\f@rtoc%
	\def\f@rtoc{%
	\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
	}

% sections em maiúsculo
	\let\oldcontentsline\contentsline
	\def\contentsline#1#2{%
	  \expandafter\ifx\csname l@#1\endcsname\l@section
		\expandafter\@firstoftwo
	  \else
		\expandafter\@secondoftwo
	  \fi
	  {%
		\oldcontentsline{#1}{\MakeTextUppercase{#2}}%
	  }{%
		\oldcontentsline{#1}{#2}%
	  }%
	}
}{}
\makeatother
\ifthenelse{\boolean{ABNTEXsumario-tradicional}}{

	% ---
	% Identação do sumário para os três níveis
	\cftsetindents{part}{0em}{\cftlastnumwidth}
	\cftsetindents{chapter}{0em}{\cftlastnumwidth}
    \cftsetindents{section}{0em}{2em}{\cftlastnumwidth}
	\cftsetindents{subsection}{0em}{2.8em}{\cftlastnumwidth}
	\cftsetindents{subsubsection}{0em}{3.8em}{\cftlastnumwidth}
	\cftsetindents{paragraph}{0em}{4.5em}{\cftlastnumwidth}
%	\cftsetindents{part}{0em}{\cftlastnumwidth}
%	\cftsetindents{chapter}{0em}{2em}
%	\cftsetindents{section}{1em}{2.5em}
%	\cftsetindents{subsection}{3.5em}{3.5em}
	% ---
	\renewcommand{\tocprintchapter}{%
	\addtocontents{toc}{\cftsetindents{chapter}{0em}{1em}}}
	%
	\renewcommand{\tocinnonumchapter}{%
	\addtocontents{toc}{\cftsetindents{chapter}{0em}{1em}}%
	\cftinserthook{toc}{A}}
	%
	\renewcommand{\tocprintchapternonum}{%
	\addtocontents{toc}{\cftsetindents{chapter}{0em}{1em}}}
	%
	\renewcommand{\tocpartapendices}{%
	\addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
	\cftinserthook{toc}{A}}
	%
	\renewcommand{\tocpartanexos}{%
	\addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
	\cftinserthook{toc}{A}}
	%
	\setlength{\cftbeforechapterskip}{1em}
	%
	% Fontes das entradas do sumario
	%
	\renewcommand{\cftpartfont}{\bfseries\larger}
	%
	\renewcommand{\cftchapterfont}{\bfseries}
	\renewcommand{\cftchapterpagefont}{\normalsize\cftchapterfont}
	%
	\renewcommand{\cftsectionfont}{\normalfont}
	\renewcommand{\cftsectionpagefont}{\cftsectionfont}
	%
	\renewcommand{\cftsubsectionfont}{\bfseries}
	\renewcommand{\cftsubsectionpagefont}{\cftsubsectionfont}
	
	\renewcommand{\cftsubsubsectionfont}{\normalfont}
	\renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}
}{}

% -----
% Declaracoes de cabecalhos 
% -----
% Removido linha e o nome do capítulo do cabeçalho
% Cabecalho padrao
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}

% Altera os comandos \configurecaptions e \configureseparator para trabalhar com 
% o pacote caption e amigos.
\AtEndPackage{caption}{
  \AtBeginDocument{%
    \DeclareCaptionLabelSeparator{barr}{~\textendash~}
    \DeclareCaptionFont{ABNTEXfontereduzida}{\ABNTEXfontereduzida}
      \captionsetup{format=hang,
                    labelseparator=barr,
                    %labelfont=ABNTEXfontereduzida,
                    %font=ABNTEXfontereduzida
                    }
      \renewcommand{\configurecaptions}{%
                  \captionsetup{justification=centering,%
                                singlelinecheck=false}}
      \renewcommand{\configureseparator}{\captionsetup{labelsep=colon}}
  }
}
% ---

\newlist{lista}{enumerate}{2}
\setlist[lista,1]{label={},topsep=-3.5pt,itemsep=-1.5mm,leftmargin=\parindent+\labelwidth-\labelsep}%
\setlist[lista,2]{label={},topsep=-3.5pt,itemsep=-1.5mm,leftmargin=*}
\setlist[itemize,1]{topsep=0pt,itemsep=-1.5mm}%
\setlist[itemize,2]{topsep=0pt,itemsep=-1.5mm}
\setlist[enumerate,1]{topsep=0pt,itemsep=-1.5mm}%
\setlist[enumerate,2]{topsep=0pt,itemsep=-1.5mm}

% alterando a capa
\renewcommand{\imprimircapa}{%
  \begin{capa}%
    \vspace*{-2cm}
    \center
    \ABNTEXchapterfont\bfseries\large\imprimirinstituicao

    % \vspace*{4cm}
    \vfill

    {\ABNTEXchapterfont\textbf{\large\imprimirautor}}

    \vfill
    \begin{center}
    \ABNTEXchapterfont\bfseries\large\imprimirtitulo
    \end{center}
    \vfill

    \large\imprimirlocal

    \large\imprimirdata

    % \vspace*{1cm}
  \end{capa}
}

% folha de rosto 

\makeatletter

\renewcommand{\folhaderostocontent}{
\begin{center}
% \vspace*{2cm}
{\ABNTEXchapterfont\bfseries\normalsize\imprimirautor}

% \vspace*{\fill}\vspace*{\fill}
\vfill

\begin{center}
\ABNTEXchapterfont\bfseries\large\imprimirtitulo
\end{center}

% \vspace*{\fill}
\vfill

\abntex@ifnotempty{\imprimirpreambulo}{%
  \hspace{.45\textwidth}
  \begin{minipage}{.5\textwidth}
  \ABNTEXchapterfont\bfseries\normalsize\imprimirpreambulo
  \end{minipage}%
%   \vspace*{\fill}
  \vfill
}%

{\bfseries\normalsize\imprimirorientadorRotulo~\imprimirorientador\par}

\abntex@ifnotempty{\imprimircoorientador}{%
  {\bfseries\normalsize\imprimircoorientadorRotulo~\imprimircoorientador}%
}%

\vspace*{\fill}

{\bfseries\normalsize\imprimirlocal}

\par

{\bfseries\normalsize\imprimirdata}
% \vspace*{1cm}
\end{center}
}

\makeatother

