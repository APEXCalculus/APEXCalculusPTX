<?xml version='1.0'?> <!-- As XML file -->

<!-- Created by Sean Fitzpatrick, August 2020                           -->
<!-- Borrows liberally from the style file for Sound Writing  by        -->
<!-- Cody Chun, Kieran O'Neil, Kylie Young, Julie Nelson Christoph.     -->
<!-- With additional... err... inspiration from style files from        -->
<!-- ORCCA, CLP, and the PreTeXt guide.                                 -->

<!--NB: move this file from APEXCalculusPTX/style to mathbook/user !!!  -->

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities SYSTEM "../xsl/entities.ent">
    %entities;
]>

<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- next line will fail if this file is not in mathbook/user -->
<xsl:import href="../xsl/pretext-latex.xsl" />

<xsl:output method="text" />

<!-- ########## -->
<!-- Font Setup -->
<!-- ########## -->

<!-- Old Style figures for the body, but reversed to Lining many  -->
<!-- other places. "Old Style" is a lowercase style, "Lining" is  -->
<!-- a (now traditional) uppercase style.  Ornamentation for page -->
<!-- header happens to be specific Unicode characters of the same -->
<!-- font used for the text.  Relevant font table here:           -->
<!-- http://mirrors.ctan.org/fonts/libertinus-fonts/documentation/LibertinusSerif-Regular-Table.pdf -->
<xsl:template name="font-xelatex-main">
    <xsl:text>%% XeLaTeX font configuration from PreTeXt Guide style&#xa;</xsl:text>
    <xsl:text>%% We rely on a font installed at the system level,&#xa;</xsl:text>
    <xsl:text>%% so that we can exercise specific font features&#xa;</xsl:text>
    <xsl:text>%%&#xa;</xsl:text>
    <xsl:call-template name="xelatex-font-check">
        <xsl:with-param name="font-name" select="'Carlito-Regular'"/>
    </xsl:call-template>
    <xsl:text>\setmainfont{Carlito-Regular}[Numbers=OldStyle]&#xa;</xsl:text>
</xsl:template>

<!-- <xsl:template name="font-xelatex-style">
    <xsl:call-template name="xelatex-font-check">
        <xsl:with-param name="font-name" select="'Carlito-Regular'"/>
    </xsl:call-template>
    <xsl:text>\newfontfamily{\divisionfont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\contentsfont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\pagefont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\blocktitlefont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\tabularfont}{Carlito-Regular}[Numbers={Monospaced,Lining}]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\xreffont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\titlepagefont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\ornamental}{Carlito-Regular}&#xa;</xsl:text>
</xsl:template> -->

<!-- the above additional font declarations didn't seem to work for Carlito -->

<!-- ################# -->
<!-- Division Headings -->
<!-- ################# -->

<!-- Default LaTeX style, retaining \divisionfont defined above   -->
<!-- But all division headings are in maroon color, defined above -->

<xsl:template name="titlesec-chapter-style">
    <xsl:text>\titleformat{\chapter}[display]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\huge\bfseries}{\divisionnameptx\space\thechapter}{20pt}{\Huge#1}&#xa;</xsl:text>
    <xsl:text>[{\Large\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titleformat{name=\chapter,numberless}[display]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\huge\bfseries}{}{0pt}{#1}&#xa;</xsl:text>
    <xsl:text>[{\Large\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titlespacing*{\chapter}{0pt}{50pt}{40pt}&#xa;</xsl:text>
</xsl:template>

<!-- Horizontal rule before, plus line break          -->
<!-- Section 4.1(1ex)(title)                          -->
<!-- Horizontal rule after, but lifted                -->
<!-- Spacing after is default, likely needs reduction -->
<!-- No change to unnumbered version                  -->
<!-- N.B. Protect optional argument inside optional   -->
<!-- argument with a defensive TeX group, {}          -->

<xsl:template name="titlesec-section-style">
    <xsl:text>\titleformat{\section}[block]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\Large\bfseries\hrulefill\\}{\divisionnameptx\space\thesection}{1ex}{#1}&#xa;</xsl:text>
    <xsl:text>[{\rule[0.8\baselineskip]{\textwidth}{0.5pt}}]&#xa;</xsl:text>
    <xsl:text>\titleformat{name=\section,numberless}[block]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\Large\bfseries}{}{0pt}{#1}&#xa;</xsl:text>
    <xsl:text>[{\large\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}&#xa;</xsl:text>
</xsl:template>

<!-- "subsection" are much like "section", except -->
<!--   * no rule before                           -->
<!--   * no "Subsection" string                   -->
<!--   * 90% width rule below, flush left         -->
<xsl:template name="titlesec-subsection-style">
    <xsl:text>\titleformat{\subsection}[block]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\large\bfseries}{\thesubsection}{1ex}{#1}&#xa;</xsl:text>
    <xsl:text>[{\rule[0.8\baselineskip]{0.9\textwidth}{0.5pt}}]&#xa;</xsl:text>
    <xsl:text>\titleformat{name=\subsection,numberless}[block]&#xa;</xsl:text>
    <xsl:text>{\normalfont\large\bfseries}{}{0pt}{#1}&#xa;</xsl:text>
    <xsl:text>[{\normalsize\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}&#xa;</xsl:text>
</xsl:template>

 <!-- subsubsections are not numbered, so are -->
 <!-- plain, just a font change from defaults -->

 <xsl:template name="titlesec-subsubsection-style">
    <xsl:text>\titleformat{\subsubsection}[hang]&#xa;</xsl:text>
    <xsl:text>{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{#1}&#xa;</xsl:text>
    <xsl:text>[{\small\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titleformat{name=\subsubsection,numberless}[block]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\normalsize\bfseries}{}{0pt}{#1}&#xa;</xsl:text>
    <xsl:text>[{\normalsize\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}&#xa;</xsl:text>
</xsl:template>

<!-- define tcolorboxes for theorem and friends -->

<xsl:template match="list" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=blue!60!black!20, colframe=blue!30!black!50, colback=white!95!blue, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="insight" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=red!60!black!20, colframe=red!30!black!50, colback=white!95!red, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="&DEFINITION-LIKE;" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=yellow!90!black!30, colframe=yellow!95!black!60, colback=white!95!yellow, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="&THEOREM-LIKE;" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=green!60!black!20, colframe=green!30!black!50, colback=white!95!green, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="assemblage" mode="tcb-style">
    <xsl:text>enhanced, arc=2ex, colback=blue!5, colframe=blue!75!black,&#xa;</xsl:text>
    <xsl:text>colbacktitle=blue!20, coltitle=black, boxed title style={sharp corners, frame hidden},&#xa;</xsl:text>
    <xsl:text>fonttitle=\bfseries, attach boxed title to top left={xshift=4mm,yshift=-3mm}, top=3mm,&#xa;</xsl:text>
</xsl:template>

<xsl:template match="&ASIDE-LIKE;" mode="tcb-style">
    <xsl:text>enhanced, colback=blue!3, colframe=blue!50!black,&#xa;</xsl:text>
    <xsl:text>coltitle=black, fonttitle=\bfseries, attach title to upper, after title={\space},</xsl:text>
</xsl:template>

<xsl:template match="example" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colback=white, colframe=black, colbacktitle=white, coltitle=black,
      enhanced,
      breakable,
      frame hidden,
      overlay unbroken={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west)--([xshift=4ex]frame.south west);
      },
      overlay first={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west);
      },
      overlay middle={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west);
      },
      overlay last={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west)--([xshift=4ex]frame.south west);
      },
    </xsl:text>
</xsl:template>

<!-- turn off hints, answers, and solutions for divisional exercises -->
<xsl:param name="exercise.divisional.hint" select="'no'"/>
<xsl:param name="exercise.divisional.answer" select="'no'"/>
<xsl:param name="exercise.divisional.solution" select="'no'"/>

<!-- print options -->
<xsl:param name="latex.print" select="'no'"/>
<xsl:param name="latex.pageref" select="'no'"/>
<xsl:param name="latex.sides" select="'one'"/>
<!-- ragged right text alignment for accessibility -->
<xsl:param name="text.alignment" select="'raggedright'"/>

<!-- use original APEX geometry definitions -->
<xsl:param name="latex.geometry" select="'papersize={8.5in,11in},inner=1in,textheight=9in,textwidth=320pt,marginparwidth=150pt,marginparsep=32pt'"/>

<!-- apply exercise geometry -->
<xsl:template match="exercises|solutions[not(parent::backmatter)]|reading-questions|glossary|references|worksheet" mode="latex-division-heading">
    <!-- Inspect parent (part through subsubsection)  -->
    <!-- to determine one of two models of a division -->
    <!-- NB: return values are 'true' and empty       -->
    <xsl:variable name="is-structured">
        <xsl:apply-templates select="parent::*" mode="is-structured-division"/>
    </xsl:variable>
    <xsl:variable name="b-is-structured" select="$is-structured = 'true'"/>

    <xsl:if test="self::exercises">
        <!-- \newgeometry includes a \clearpage -->
        <xsl:apply-templates select="." mode="new-geometry"/>
    </xsl:if>
    <xsl:text>\begin{</xsl:text>
    <xsl:apply-templates select="." mode="division-environment-name" />
    <xsl:if test="not($b-is-structured)">
        <xsl:text>-numberless</xsl:text>
    </xsl:if>
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="title-full"/>
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <!-- subtitle here -->
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="title-short"/>
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <!-- author here -->
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <!-- subtitle here -->
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="latex-id" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#xa;</xsl:text>
</xsl:template>


<!-- define exercise geometry -->
<xsl:template match="exercises" mode="new-geometry">
    <xsl:text>\newgeometry{</xsl:text>
    <xsl:text>inner=72pt</xsl:text>
    <xsl:text>, outer=72pt</xsl:text>
    <xsl:text>, textheight=9.25in</xsl:text>
    <xsl:text>, tmargin=.75in</xsl:text>
    <xsl:text>, marginparwidth=150pt</xsl:text>
    <xsl:text>, marginparsep=32pt</xsl:text>
    <xsl:text>}&#xa;</xsl:text>
</xsl:template>

<!-- restore geometry for next section -->


<xsl:template match="exercises" mode="latex-division-footing">
    <!-- Inspect parent (part through subsubsection)  -->
    <!-- to determine one of two models of a division -->
    <!-- NB: return values are 'true' and empty       -->
    <xsl:variable name="is-structured">
        <xsl:apply-templates select="parent::*" mode="is-structured-division"/>
    </xsl:variable>
    <xsl:variable name="b-is-structured" select="$is-structured = 'true'"/>

    <xsl:text>\end{</xsl:text>
    <xsl:apply-templates select="." mode="division-environment-name" />
    <xsl:text>}&#xa;</xsl:text>
    <xsl:if test="self::exercises">
        <!-- \restoregeometry includes a \clearpage -->
        <xsl:text>\restoregeometry&#xa;</xsl:text>
    </xsl:if>
</xsl:template>


<!-- uncommenting these will omit videos -->
    <xsl:template match="video[starts-with(@xml:id, 'vid')]" />
    <!-- use next line if videos also omitted in html -->
    <!-- <xsl:template match="figure[starts-with(@xml:id, 'vid')]" /> -->
    <!-- use this instead if videos included in html  **don't use both!!** -->
    <xsl:template match="figure[starts-with(@xml:id, 'vid')]">
      <xsl:text>\stepcounter{cthm}&#xa;&#xa;</xsl:text>
    </xsl:template>
    <xsl:template match="p[starts-with(@xml:id, 'vidint')]" />
    <xsl:template match="aside[starts-with(@xml:id, 'vidnote')]" />
</xsl:stylesheet>
