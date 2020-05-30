\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FITcover}[2019/05/06 CTU FIT standard class for borders]

% created by Ondrej Guth <ondrej.guth@fit.cvut.cz>

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% options
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
\newif\if@thesistypedefined
\DeclareOption{thesis=B}{\gdef\@thesistype{B}\@thesistypedefinedtrue}
\DeclareOption{thesis=M}{\gdef\@thesistype{M}\@thesistypedefinedtrue}

\DeclareOption{czech}{
	\AtBeginDocument{\selectlanguage{czech}}
	\PassOptionsToPackage{\CurrentOption}{babel}
	\def\@lang{1}
}
\DeclareOption{english}{
	\AtBeginDocument{\selectlanguage{english}}
	\PassOptionsToPackage{english}{babel}
	\def\@lang{0}
}

\newif\if@inverse
\DeclareOption{inverse}{
	\@inversetrue
}

\ProcessOptions

\ifx\@lang\undefined
	\ClassError{FITthesis}{Language not specified}{Add option czech for Czech language or option english for English language.}
\fi


\LoadClass[a4paper,20pt]{extarticle}[1996/10/08]
\RequirePackage[a4paper,textwidth=171mm,textheight=230mm,rmargin=20mm,tmargin=35mm]{geometry}[2002/07/08]

\RequirePackage{babel}[2008/07/06]

\if@inverse
	\RequirePackage{color}
	\pagecolor{blue}
	\color{white}
\fi

\if\@lang1
	\RequirePackage[IL2]{fontenc}
	\RequirePackage{lmodern}
\else
	\if\@lang2
		\RequirePackage[IL2]{fontenc}
		\RequirePackage{lmodern}
	\else
		\AtBeginDocument{\selectlanguage{english}}
	\fi
\fi

\RequirePackage{palatino}

\RequirePackage{graphicx}


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

\setlength\parindent{0pt}

\newif\if@titledefined
\DeclareRobustCommand{\title}[1]{
	\def\thetitle{#1}
	\@titledefinedtrue
}

\newif\if@authordefined
\DeclareRobustCommand{\author}[1]{
	\def\theauthor{#1}
	\@authordefinedtrue
}

\DeclareRobustCommand{\thesistype}{\if@thesistypedefined\if\@thesistype B\if\@lang1{BAKAL{\' A}{\v R}SK{\' A} PR{\' A}CE}\else\if\@lang2{BAKAL{\' A}RSKA PR{\' A}CA}\else{BACHELOR'S THESIS}\fi\fi\else\if\@thesistype M
\if\@lang1{DIPLOMOV{\' A} PR{\' A}CE}\else\if\@lang2{DIPLOMOV{\' A} PR{\' A}CA}\else{MASTER'S THESIS}\fi\fi\else\ClassError{FITthesis}{Thesis type not specified}{Add option thesis=B for bachelor's thesis or option thesis=M for master's thesis.}\fi\fi\else\ClassError{FITthesis}{Thesis type not specified}{Add option thesis=B for bachelor's thesis or option thesis=M for master's thesis.}\fi}





\DeclareRobustCommand{\universitytitle}{%
	\if\@lang1{%
		{\v C}ESK{\' E} VYSOK{\' E} U{\v C}EN{\' I} TECHNICK{\' E} V PRAZE%
	}\else\if\@lang2{%
		{\v C}ESK{\' E} VYSOK{\' E} U{\v C}EN{\' I} TECHNICK{\' E} V PRAZE%
	}\else{%
		CZECH TECHNICAL UNIVERSITY IN PRAGUE%
	}\fi\fi
}

\DeclareRobustCommand{\facultytitle}{%
	\if\@lang1{%
		FAKULTA INFORMA{\v C}N{\' I}CH TECHNOLOGI{\' I}
	}\else\if\@lang2{
		FAKULTA INFORMA{\v C}N{\' I}CH TECHNOLOGI{\' I}
	}\else{
		FACULTY OF INFORMATION TECHNOLOGY
	}\fi\fi
}


\AtBeginDocument{
\pagestyle{empty}

\begin{center}
	\universitytitle
	
	\vspace{10mm}
	
	\facultytitle
	
	\vspace{3cm}
	\if@inverse
		\includegraphics[height=5cm]{assets/cover/cvut-logo-w}
	\else
		\includegraphics[height=5cm]{assets/cover/cvut-logo-bw-symbol}
	\fi
	
	\vspace{3cm}
	
	\if@titledefined\thetitle\else\ClassError{FITboards}{Thesis' title unspecified}{Specify title of this thesis using the \protect\title\space command.}\fi

	\vfill
	
	\thesistype
	
	\vspace{10mm}
	
	\the\year{} \hfill \if@authordefined\theauthor\else\ClassError{FITboards}{Thesis' author unspecified}{Specify author of this thesis (i.e. your name) using the \protect\author\space command.}\fi{}
\end{center}
}
