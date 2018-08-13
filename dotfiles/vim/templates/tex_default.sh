\documentclass[notoc,notitlepage]{tufte-book}
% \nonstopmode % uncomment to enable nonstopmode

\usepackage{classnotetitle}

\title{Title}
\author{Johnson Ng}
\subtitle{Subtitle}
\credentials{BMath (Hons), Pure Mathematics major, Actuarial Science Minor}
\institution{University of Waterloo}

\input{latex-classnotes-preamble.tex}

\begin{document}
\hypersetup{pageanchor=false}
\maketitle
\hypersetup{pageanchor=true}
\tableofcontents

\chapter*{\faBook \enspace List of Definitions}
\addcontentsline{toc}{chapter}{List of Definitions}
\theoremlisttype{all}
\listtheorems{defn}

\chapter*{\faCoffee \enspace List of Theorems}
\addcontentsline{toc}{chapter}{List of Theorems}
\theoremlisttype{allname}
\listtheorems{axiom,lemma,thm,crly,propo}



\appendix

\backmatter

\pagestyle{plain}

\nobibliography*
\bibliography{references}

\printindex

\end{document}
