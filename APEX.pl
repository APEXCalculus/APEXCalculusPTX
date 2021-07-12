#############################################################################
# This macro library supports WeBWorK problems from the PreTeXt project named
# APEX Calculus
#############################################################################


# Return a string containing the latex-image-preamble contents.
# To be used by TikZImage objects as in:
# $image->addToPreamble(latexImagePreamble())

sub latexImagePreamble {
return <<'END_LATEX_IMAGE_PREAMBLE'
\usepackage{pgfplots}

\usetikzlibrary{arrows,arrows.meta}

\colorlet{firstcolor}{blue}
\colorlet{secondcolor}{red}
\colorlet{thirdcolor}{magenta}

\pgfplotsset{firstcurvestyle/.style={color=firstcolor,mark=none,thick,{Kite}-{Kite},solid,fill=firstcolor!50,fill=none}}
\pgfplotsset{secondcurvestyle/.style={color=secondcolor,mark=none,thick,{Kite}-{Kite},dashdotted,fill=secondcolor!50,fill=none}}
\pgfplotsset{thirdcurvestyle/.style={color=thirdcolor,mark=none,thick,{Kite}-{Kite},dashdotdotted,fill=thirdcolor!50,fill=none}}
\pgfplotsset{areastyle/.style={fill,opacity=0.5,draw=none}}\pgfplotsset{tangentline/.style={color=black,mark=none,thick,{Kite}-{Kite},solid}}
\pgfplotsset{tangentline/.style={color=black,mark=none,thick,{Kite}-{Kite},solid}}
\pgfplotsset{tangentlineseg/.style={color=black,mark=none,thick,-,solid}}
\pgfplotsset{lineseg/.style={color=black,mark=none,solid}}
\pgfplotsset{normalline/.style={color=black,mark=none,thick,{Kite}-{Kite},dashed}}
\pgfplotsset{normallineseg/.style={color=black,mark=none,thick,-,dashed}}
\pgfplotsset{secantline/.style={color=black,mark=none,thin,{Kite}-{Kite},dashed}}
\pgfplotsset{secantlineseg/.style={color=black,mark=none,thin,-,dashed}}
\pgfplotsset{asymptote/.style={color=black,mark=none,thick,{Kite}-{Kite},dashed}}
\pgfplotsset{guideline/.style={color=black,mark=none,-}}
\pgfplotsset{symmetryline/.style={color=black,mark=none,-,dashed}}
\pgfplotsset{openinterval/.style={color=black,mark=none,ultra thick,{Parenthesis}-{Parenthesis}}}
\pgfplotsset{closedinterval/.style={color=black,mark=none,ultra thick,{Bracket}-{Bracket}}}

\pgfplotscreateplotcyclelist{curvestylelist}{%
  firstcurvestyle\\%
  secondcurvestyle\\%
  thirdcurvestyle\\%
}

%To disable arrows, edit these and the above lines accordingly
\pgfplotsset{leftarrow/.style={{Kite}-}}
\pgfplotsset{rightarrow/.style={-{Kite}}}

% Redefine these to be empty to turn off axis discontinuities
\pgfplotsset{xdiscontinuity/.style={axis x discontinuity=parallel}}
\pgfplotsset{ydiscontinuity/.style={axis y discontinuity=crunch}}

\pgfplotsset{hollowdot/.style={color=firstcolor,fill=white,only marks,mark=*}}
\pgfplotsset{soliddot/.style={color=firstcolor,fill=firstcolor,only marks,mark=*}}

\pgfplotsset{open/.style={firstcurvestyle,{Circle[open]}-{Circle[open]}}}
\pgfplotsset{openclosed/.style={firstcurvestyle,{Circle[open]}-{Circle}}}
\pgfplotsset{closed/.style={firstcurvestyle,{Circle}-{Circle}}}
\pgfplotsset{closedopen/.style={firstcurvestyle,{Circle}-{Circle[open]}}}
\pgfplotsset{infiniteopen/.style={firstcurvestyle,{Kite}-{Circle[open]}}}
\pgfplotsset{openinfinite/.style={firstcurvestyle,{Circle[open]}-{Kite}}}
\pgfplotsset{infiniteclosed/.style={firstcurvestyle,{Kite}-{Circle}}}
\pgfplotsset{closedinfinite/.style={firstcurvestyle,{Circle}-{Kite}}}
\pgfplotsset{infinite/.style={firstcurvestyle,{Kite}-{Kite}}}
\pgfplotsset{infiniteleft/.style={firstcurvestyle,{Kite}-}}
\pgfplotsset{infiniteright/.style={firstcurvestyle,-{Kite}}}
\pgfplotsset{openleft/.style={firstcurvestyle,{Circle[open]}-}}
\pgfplotsset{openright/.style={firstcurvestyle,-{Circle[open]}}}
\pgfplotsset{closedleft/.style={firstcurvestyle,{Circle}-}}
\pgfplotsset{closedright/.style={firstcurvestyle,-{Circle}}}

\pgfplotsset{every axis/.append style = {
  cycle list name = curvestylelist,
  %tick label style = {font = \scriptsize},
  axis x line = middle,
  axis y line = middle,
  xlabel = {$x$},
  ylabel = {$y$},
  %x label style = {font = \scriptsize},
  %y label style = {font = \scriptsize},
  minor x tick num = 1,
  minor y tick num = 1,
  %width = {ifthenelse(.9\linewidth>240pt,240pt,.9\linewidth)},
  name=myplot,
}}

\pgfplotsset{numberline/.style = {
  xmin=-10,xmax=10,
  minor xtick={-11,-10,...,11},
  xtick={-10,-5,...,10},
  axis y line=none,
  every axis x label/.style={at={(current axis.right of origin)},anchor=west},
  y=15pt,
  axis lines=middle,
  enlarge x limits,
  xlabel={},
  grid=none,
  clip=false,
  axis background/.style={},
}}
%%temporary fix to get circles working right in TexLive 2019

\makeatletter
\def\pgfplots@install@path@replacements{%
    \ifpgfplots@path@replace@ellipse
        \let\tikz@do@circle=\pgfplots@path@@tikz@do@circle
        \let\tikz@do@ellipse=\pgfplots@path@@tikz@do@circle
        \expandafter\def\expandafter\pgfinterruptpicture\expandafter{\pgfinterruptpicture
            \let\tikz@do@circle=\pgfplots@path@@tikz@do@circle@orig
            \let\tikz@do@ellipse=\pgfplots@path@@tikz@do@ellipse@orig
        }%
    \fi
}%
\let\pgfplots@path@@tikz@do@circle@orig=\tikz@do@circle
\let\pgfplots@path@@tikz@do@ellipse@orig=\tikz@do@ellipse

\let\pgfplots@path@@tikz@do@circle@oldandbroken=\pgfplots@path@@tikz@do@circle
\def\pgfplots@path@@tikz@do@circle#1{\pgfplots@path@@tikz@do@circle@oldandbroken{#1}{#1}}
\def\pgfplots@path@@tikz@do@ellipse#1#2{\pgfplots@path@@tikz@do@circle@oldandbroken{#1}{#2}}
\makeatother

END_LATEX_IMAGE_PREAMBLE
}
