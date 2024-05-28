%% hydrothesis.cls
%% LaTeX template for creating PhD theses.
%% This file is a modification of the Hagenberg Thesis package (https://github.com/Digital-Media/HagenbergThesis) for creating bachelors's and masters's theses
%% Author: Robin Schwemmle (robin.schwemmle@hydrology.uni-freiburg.de)
%% File encoding: ASCII

%% Package Information --------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hydrothesis}[2018/02/08]

\RequirePackage{xifthen}

\RequirePackage{ifpdf}	% for checking PDF mode
\ifpdf{}% \typeout{hydrothesis: *** LaTeX in PDF mode ***}
\else{\errmessage{hydrothesis: *** LaTeX NOT running in PDF mode ***}}
\fi


%% Commands for Title Pages (used in class options) ---------------------------

\newcommand{\hydro@MainLanguage}{english}	% also referenced in hydro.sty
\newcommand{\@mastertitlepages}{}
\newcommand{\@maketitlepages}{\@mastertitlepages}  %Default: Master's thesis


\newcommand{\@titlepagefont}{\sffamily}

%% Class options --------------------------------------------------------------

\DeclareOption{master}{
	\renewcommand{\@maketitlepages}{\@mastertitlepages}
}

\DeclareOption{english}{%
	\renewcommand{\hydro@MainLanguage}{english}
}

\DeclareOption*{%
	\ClassWarning{hydrothesis}{Unknown document option '\CurrentOption'.}
}

\ProcessOptions


%% Paper Options and Style File -----------------------------------------------

\LoadClass[a4paper,12pt,openany]{book}
\RequirePackage[top=30mm,bottom=30mm,left=30mm,right=30mm]{geometry} %showframe

\RequirePackage{hydro}	% load associated style file hydro.sty


%% Setup for Pages in the Front Matter ----------------------------------------

% General Commands

\newcommand{\@institute}{\@MissingArg{Institute not specified!}}
\newcommand{\institute}[1]{%
	\renewcommand{\@institute}{#1}
}
\newcommand{\@university}{\@MissingArg{University not specified!}}
\newcommand{\university}[1]{%
	\renewcommand{\@university}{#1}
}

\newcommand{\@place}{\@MissingArg{Place not specified!}}
\newcommand{\place}[1]{%
	\renewcommand{\@place}{#1}
}

\newcommand{\@datetitle}{\@MissingArg{Date not specified!}}
\newcommand{\datetitle}[1]{%
	\renewcommand{\@datetitle}{#1}
}

\newcommand{\@datesub}{\@MissingArg{Date of Submission not specified!}}
\newcommand{\datesub}[1]{%
	\renewcommand{\@datesub}{#1}
}

\newcommand{\@datedefense}{\@MissingArg{Date of Defense not specified!}}
\newcommand{\datedefense}[1]{%
	\renewcommand{\@datedefense}{#1}
}

\newcommand{\@dean}{\@MissingArg{Dean not specified!}}
\newcommand{\dean}[1]{%
	\renewcommand{\@dean}{#1}
}

\newcommand{\@supervisor}{\@MissingArg{Supervisor not specified!}}
\newcommand{\supervisor}[1]{%
	\renewcommand{\@supervisor}{#1}
}

\newcommand{\@cosupervisor}{\@MissingArg{Co-Supervisor not specified!}}
\newcommand{\cosupervisor}[1]{%
	\renewcommand{\@cosupervisor}{#1}
}

\newcommand{\@secondreviewer}{\@MissingArg{Second reviewer not specified!}}
\newcommand{\secondreviewer}[1]{%
	\renewcommand{\@secondreviewer}{#1}
}

\newcommand{\@titleimage}[0]{}
\newcommand{\titleimage}[1]{%
	\renewcommand{\@titleimage}{#1}
}

%% Commands for Creating the Title Pages --------------------------------------

%% adds blank space after each letter (http://stackoverflow.com/a/3951837)
\newcommand{\@addspaces}[1]{%
  \@tfor\letter:=#1\do{%
    \letter\thinspace%	%\space
  }%
}

%% First Title Page ------------------------------------

\newcommand{\@mastertitleone}{%
\begin{titlepage}%
		\rule{0mm}{1mm}
		\vspace*{0mm}
		\begin{center}%
			\@titlepagefont %\normalfont
			\setlength{\unitlength}{1cm}
			\vskip 25mm%
			\begin{spacing}{2.0}
			{\LARGE\@title}
			\end{spacing}
			\vskip 25mm%
			{Thesis submitted in partial fulfillment of the requirements of}
			\vskip 2mm%
			{the degree Doctor rer. nat. of the}
			\vskip 2mm%
			{Faculty of Environment and Natural Resources,}
			\vskip 2mm%
			{Albert-Ludwigs-University}
			\vskip 2mm%
			{Freiburg im Breisgau, Germany}%
			\vskip 25mm%
			{by}%
			\vskip 4mm%
			{\@author}%
			\vskip 4mm%
			{{\@place}, {\@datetitle}}%
		\end{center}%
		\vfil%
\end{titlepage}%
}

%% Second Title Page ------------------------------------

\newcommand{\@mastertitletwo}{%
\begin{titlepage}%
		\rule{0mm}{1mm}
		\vspace*{0mm}
		\begin{flushleft}%
			\@titlepagefont %\normalfont
			\setlength{\unitlength}{1cm}
			\vskip 160mm%
			{{Dean: }\@dean}%
			\vskip 4mm%
			{{Supervisor: }\@supervisor}%
			\vskip 4mm%
			{{Second supervisor: }\@cosupervisor}%
			\vskip 4mm%
			{{Second reviewer: }\@secondreviewer}%
			\vskip 4mm%
			{{Date of disputation: }\@datedefense}%
		\end{flushleft}%
		\vfil%
\end{titlepage}%
}

%% Declaration Page ------------------------------------

\newcommand{\leadingzero}[1]{\ifnum #1<10 0\the#1\else\the#1\fi}

\newcommand{\@declarationpage}{%
	\begin{english}
		\chapter*{Declaration of Authorship}
		\noindent
		I, xxx, hereby declare that I have written this thesis independently, 
		that I neither have used other sources than the ones mentioned in the text, 
		nor that I have used unauthorized assistance and that I have not submitted this thesis previously 
		in any form to another examination commission in Germany or another country for a doctoral degree.
		\par
		\vspace{10mm}

		\noindent
		This thesis contains no material previously published or written by another person except where 
		proper acknowledgement is made. Chapters x to x of this thesis are a series of manuscripts that 
		are published or being currently under review in peer-reviewed journals. I am the main author of Chapters x to x, 
		for which I have contributed to the development of the study concept and modelling experiments, 
		made the tables, figures, and supporting information. I have written all manuscripts. Details about 
		the contributions of all co-authors are stated under Manuscripts and authors' contributions.
		\par
		\vspace{10mm}
		\noindent
		%\@placeanddate, \the\year-\leadingzero{\month}-\leadingzero{\day} %http://de.wikibooks.org/wiki/LaTeX-W%F6rterbuch:_today
		\@place, \@datesub
		\par
		\vspace{12mm}
		\noindent
		\@author
	\end{english}
}

%% Assembly of title pages ----------------------------------------------------

\renewcommand{\@mastertitlepages}{
	\@mastertitleone
	\@mastertitletwo
	\@declarationpage
}

% Add PDF meta data and create title pages

\renewcommand{\maketitle}{	%replace standard LaTeX-command
	\hypersetup{
			pdftitle={\@title},
			pdfauthor={\@author},
			pdfsubject={Hydrology, \@place, \@datetitle},
			pdfcreator={LaTeX using class hydrothesis [\hydroDate]},
			pdfproducer={pdflatex},
			pdfkeywords={}
	}%

	\@maketitlepages
}

%% Additional packages ----------------------------------------------

\RequirePackage{hydromath}
\RequirePackage{hydroheadings}
\RequirePackage{hydroabbrev}
\RequirePackage{hydrolistings}
\RequirePackage{hydrobib}

\endinput
