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


<!-- define tcolorboxes for theorem and friends -->

<xsl:template match="list" mode="tcb-style">
    <xsl:text>listptxstyle/.style={enhanced jigsaw,middle=1ex, blockspacingstyle, opacityback=0, opacitybacktitle=0, coltitle=black, frame hidden, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="insight" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=white, colframe=black, colback=white, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="&DEFINITION-LIKE;" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=white, colframe=black, colback=white, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="&THEOREM-LIKE;" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=white, colframe=black, colback=white, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="assemblage" mode="tcb-style">
    <xsl:text>enhanced, arc=2ex, colback=white, colframe=black,&#xa;</xsl:text>
    <xsl:text>colbacktitle=white, coltitle=black, boxed title style={sharp corners, frame hidden},&#xa;</xsl:text>
    <xsl:text>fonttitle=\bfseries, attach boxed title to top left={xshift=4mm,yshift=-3mm}, top=3mm,&#xa;</xsl:text>
</xsl:template>

<!-- <xsl:template match="&ASIDE-LIKE;" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=white, colframe=black, colback=black!20!white, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template> -->

<xsl:template match="example" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colback=white, colframe=black, colbacktitle=white, coltitle=black,
      enhanced,
      breakable,
      frame hidden,
      overlay unbroken={
          \draw[thick] ([yshift=-2ex]frame.north west)--([yshift=2ex]frame.south west)--([xshift=2ex,yshift=2ex]frame.south west);
      },
      overlay first={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west);
      },
      overlay middle={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west);
      },
      overlay last={
          \draw[thick] ([yshift=-2ex]frame.north west)--([yshift=2ex]frame.south west)--([xshift=2ex,yshift=2ex]frame.south west);
      },
    </xsl:text>
</xsl:template>

<!-- use original APEX geometry definitions -->
<xsl:param name="latex.geometry" select="'inner=1in,textheight=9in,textwidth=320pt,marginparwidth=150pt,marginparsep=20pt,bottom=1in,footskip=29pt'"/>

<!-- apply exercise geometry -->
<xsl:template match="exercises" mode="latex-division-heading">
    <xsl:if test="self::exercises">
        <!-- \newgeometry includes a \clearpage -->
        <xsl:apply-templates select="." mode="new-geometry"/>
    </xsl:if>
    <xsl:text>\begin{</xsl:text>
    <xsl:apply-templates select="." mode="division-environment-name" />
    <!-- possibly numberless -->
    <xsl:apply-templates select="." mode="division-environment-name-suffix" />
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

<!-- exercise geometry for backmatter appendix -->
<xsl:template match="appendix" mode="latex-division-heading">
  <xsl:if test="self::appendix">
      <!-- \newgeometry includes a \clearpage -->
      <xsl:apply-templates select="." mode="new-geometry"/>
  </xsl:if>
    <xsl:text>\begin{</xsl:text>
    <xsl:apply-templates select="." mode="division-environment-name" />
    <!-- possibly numberless -->
    <xsl:apply-templates select="." mode="division-environment-name-suffix" />
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
    <xsl:apply-templates select="author" mode="name-list"/>
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <!-- subtitle here -->
    <!-- <xsl:text>An epigraph here\\with two lines\\-Rob</xsl:text> -->
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="latex-id" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#xa;</xsl:text>
</xsl:template>

<!-- define exercise geometry -->
<xsl:template match="exercises|appendix|solutions" mode="new-geometry">
    <xsl:text>\newgeometry{</xsl:text>
    <xsl:text>inner=72pt</xsl:text>
    <xsl:text>, outer=72pt</xsl:text>
    <xsl:text>, textheight=9.25in</xsl:text>
    <xsl:text>, tmargin=.75in</xsl:text>
    <xsl:text>, marginparwidth=150pt</xsl:text>
    <xsl:text>, marginparsep=12pt</xsl:text>
    <xsl:text>}&#xa;</xsl:text>
</xsl:template>

<!-- restore geometry for next section -->
<xsl:template match="exercises|appendix|solutions" mode="latex-division-footing">
    <xsl:text>\end{</xsl:text>
    <xsl:apply-templates select="." mode="division-environment-name" />
    <!-- possibly numberless -->
    <xsl:apply-templates select="." mode="division-environment-name-suffix" />
    <xsl:text>}&#xa;</xsl:text>
      <!-- \restoregeometry includes a \clearpage -->
    <xsl:text>\restoregeometry&#xa;</xsl:text>
</xsl:template>

<!-- tabular in sidebyside without scaling -->
<xsl:template match="tabular[ancestor::sidebyside]">
    <xsl:text>{%&#xa;</xsl:text>
    <xsl:apply-templates select="." mode="tabular-inclusion"/>
    <xsl:text>}%&#xa;</xsl:text>
</xsl:template>

<!-- figures in the margin -->
<!-- load marginnote package -->
<xsl:param name="latex.preamble.early" select="'\usepackage{marginnote}'"/>

<!-- we want images in margin to be the full margin width -->
<xsl:template match="figure/image[not(ancestor::sidebyside) and (descendant::latex-image or descendant::asymptote) and not(ancestor::exercise)]">
    <xsl:text>\begin{image}</xsl:text>
    <xsl:text>{0</xsl:text>
    <xsl:text>}</xsl:text>
    <xsl:text>{1</xsl:text>
    <xsl:text>}</xsl:text>
    <xsl:text>{0</xsl:text>
    <xsl:text>}%&#xa;</xsl:text>
    <xsl:apply-templates select="." mode="image-inclusion" />
    <xsl:text>\end{image}%&#xa;</xsl:text>
</xsl:template>

<!-- latex-image, asymptote, and tabular can all go in margin -->
<xsl:template match="figure[not(ancestor::sidebyside) and not(ancestor::aside) and not(descendant::sidebyside) and (descendant::latex-image or descendant::asymptote or descendant::tabular) and not(ancestor::exercise)]">
    <xsl:text>\marginnote{%&#xa;</xsl:text>
    <xsl:text>\begin{</xsl:text>
    <xsl:apply-templates select="." mode="environment-name"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="caption-full"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="latex-id"/>
    <xsl:text>}{</xsl:text>
    <xsl:if test="$b-latex-hardcode-numbers">
        <xsl:apply-templates select="." mode="number"/>
    </xsl:if>
    <xsl:text>}%&#xa;</xsl:text>
    <!-- images have margins and widths, so centering not needed -->
    <!-- Eventually everything in a figure should control itself -->
    <!-- or be flush left (or so)                                -->
    <xsl:if test="self::figure and not(image)">
        <xsl:text>\centering&#xa;</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="*"/>
    <!-- reserve space for the caption -->
    <xsl:text>\tcblower&#xa;</xsl:text>
    <xsl:text>\end{</xsl:text>
    <xsl:apply-templates select="." mode="environment-name"/>
    <xsl:text>}%&#xa;</xsl:text>
    <xsl:apply-templates select="." mode="pop-footnote-text"/>
    <xsl:text>}%&#xa;</xsl:text>
    <xsl:text>\par&#xa;</xsl:text>
</xsl:template>


<!-- asides in the margin -->
<!-- simple asides, with no styling available -->
<xsl:template match="aside">
    <xsl:text>\marginnote{&#xa;</xsl:text>
    <xsl:apply-templates select="." mode="label"/>
    <xsl:apply-templates select="p|&FIGURE-LIKE;|sidebyside|image|tabular" />
    <xsl:text>}%&#xa;</xsl:text>
    <xsl:text>\par&#xa;</xsl:text>
</xsl:template>

<!-- puts standard tcolorbox for aside into the margin -->
<!-- <xsl:template match="aside">
    <xsl:text>\marginnote{&#xa;</xsl:text>
    <xsl:text>\begin{</xsl:text>
    <xsl:value-of select="local-name(.)" />
    <xsl:text>}</xsl:text>
    <xsl:apply-templates select="." mode="block-options"/>
    <xsl:text>%&#xa;</xsl:text>
    <xsl:apply-templates select="p|&FIGURE-LIKE;|sidebyside" />
    <xsl:text>\end{</xsl:text>
    <xsl:value-of select="local-name(.)" />
    <xsl:text>}&#xa;</xsl:text>
    <xsl:text>}&#xa;</xsl:text>
</xsl:template> -->

<!-- now come all the options -->
<!-- turn off hints, answers, and solutions for divisional exercises -->
<xsl:param name="exercise.divisional.hint" select="'no'"/>
<xsl:param name="exercise.divisional.answer" select="'no'"/>
<xsl:param name="exercise.divisional.solution" select="'no'"/>

<!-- print options -->
<!-- <xsl:param name="latex.print" select="'yes'"/> -->
<xsl:param name="latex.pageref" select="'yes'"/>
<!-- <xsl:param name="latex.sides" select="'two'"/> -->

<!-- set toc depth -->
<xsl:param name="toc.level" select="3"/>

<!-- uncommenting these will omit videos -->
<xsl:template match="video[starts-with(@xml:id, 'vid')]" />
<xsl:template match="figure[starts-with(@xml:id, 'vid')]" />
<xsl:template match="p[starts-with(@xml:id, 'vidint')]" />
<xsl:template match="aside[starts-with(@xml:id, 'vidnote')]" />
</xsl:stylesheet>
