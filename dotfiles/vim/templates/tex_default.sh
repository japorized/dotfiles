% Document Head
\documentclass[notoc,notitlepage]{tufte-book}
% \nonstopmode % uncomment to enable nonstopmode
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
\renewcommand{\baselinestretch}{1.1}

\input{latex-classnotes-preamble.tex}

\title{Title}
\author{Johnson Ng}

% Header formatting
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\makeatletter
\pagestyle{fancy}
\fancyhead{}
\fancyhead[RO]{\textsl{\@title} \enspace \thepage}
\fancyhead[LE]{\thepage \enspace \textsl{\leftmark \enspace - \enspace \rightmark}}
\makeatother

\begin{document}
\hypersetup{pageanchor=false}
\maketitle
\hypersetup{pageanchor=true}
\tableofcontents

\chapter*{List of Definitions}
\theoremlisttype{all}
\listtheorems{defn}

\chapter*{List of Theorems}
\theoremlisttype{allname}
\listtheorems{axiom,lemma,thm,crly,propo}


\nobibliography*
\bibliography{bibliography}

\printindex

\end{document}
