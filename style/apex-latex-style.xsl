<?xml version='1.0'?> <!-- As XML file -->

<!-- Created by Sean Fitzpatrick, August 2020                           -->
<!-- Borrows liberally from the style file for Sound Writing  by        -->
<!-- Cody Chun, Kieran O'Neil, Kylie Young, Julie Nelson Christoph.     -->
<!-- With additional... err... inspiration from style files from        -->
<!-- ORCCA, CLP, and the PreTeXt guide.                                 -->

<!--NB: move this file from APEXCalculusPTX/style to mathbook/user !!!  -->

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities SYSTEM "./core/entities.ent">
    %entities;
]>

<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:str="http://exslt.org/strings"
  xmlns:exsl="http://exslt.org/common"
>

<!-- import official pretext-latex style sheet -->
<xsl:import href="./core/pretext-latex.xsl"/>

<xsl:output method="text"/>

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
    <xsl:text>\setmainfont{Carlito-Regular}&#xa;</xsl:text>
</xsl:template>


<!-- define tcolorboxes for theorem and friends -->

<xsl:template match="list" mode="tcb-style">
    <xsl:text>enhanced jigsaw,middle=1ex, blockspacingstyle, opacityback=0, opacitybacktitle=0, coltitle=black, frame hidden, titlerule=-0.3pt,</xsl:text>
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
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=blue!20, colframe=blue!75!black, colback=blue!5, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="&ASIDE-LIKE;" mode="tcb-style">
    <xsl:text>enhanced, colback=white, colframe=white,&#xa;</xsl:text>
    <xsl:text>coltitle=black, fonttitle=\bfseries, attach title to upper, after title={\space},left=1pt,</xsl:text>
</xsl:template>

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
<!-- <xsl:param name="latex.geometry" select="'inner=1in,textheight=9in,textwidth=320pt,marginparwidth=150pt,marginparsep=20pt,bottom=1in,footskip=29pt'"/> -->
<!-- above is now set in the publication file -->


<!-- apply exercise geometry -->
<xsl:template match="exercises|appendix|solutions" mode="latex-division-heading">
    <!-- \newgeometry includes a \clearpage -->
    <xsl:apply-templates select="." mode="new-geometry"/>
    <xsl:text>\begin{</xsl:text>
    <xsl:apply-templates select="." mode="division-environment-name" />
    <!-- possibly numberless -->
    <xsl:apply-templates select="." mode="division-environment-name-suffix" />
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="type-name"/>
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
    <xsl:apply-templates select="." mode="internal-id" />
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
<!-- LaTeX code for margin box formatting thanks to Simon Dispa via
https://tex.stackexchange.com/questions/605955/can-i-avoid-indentation-of-margin-items-when-using-parbox-false-in-a-tcolorbox -->
<xsl:param name="latex.preamble.early" select="'
\usepackage{xcoffins}&#xa;
\NewCoffin\Framex&#xa;
\NewCoffin\Theox
  '"/>

<xsl:param name="latex.preamble.late" select="'
\newlength{\Textw} % save textwidth outside the boxes&#xa;
\setlength{\Textw}{\textwidth}&#xa;
\newlength{\Hshift}&#xa;
\newlength{\Mshift}&#xa;
\newcommand*{\calculateMshift}{%&#xa;
  \setlength{\Mshift}{\marginparsep}&#xa;
}&#xa;
&#xa;
\newcommand*{\calculateHshift}{%&#xa;
  \setlength{\Hshift}{\dimexpr\Textw/2-\tcbtextwidth/2\relax}&#xa;
}&#xa;
\newcommand{\tcbmarginbox}[2]{%&#xa;
  \par %start a new line&#xa;
  \calculateMshift&#xa;
  \calculateHshift&#xa;
  \SetHorizontalCoffin\Framex{} %clear box Framex&#xa;
  \SetVerticalCoffin\Theox{\marginparwidth}{#1}% fill box \Theox&#xa;
  \JoinCoffins*\Framex[r,vc]\Theox[l,vc](\dimexpr\Mshift+\textwidth\relax,#2)%join boxes&#xa;
  \noindent\TypesetCoffin\Framex(\Hshift,0pt)\\[-2\baselineskip] %typset assembly&#xa;
}&#xa;
\newcommand{\listmarginbox}[2]{%&#xa;
  \par %start a new line&#xa;
  \calculateMshift&#xa;
  \calculateHshift&#xa;
  \SetHorizontalCoffin\Framex{\color{black}\rule{\tcbtextwidth}{0pt}} %clear box Framex&#xa;
  \SetVerticalCoffin\Theox{\marginparwidth}{#1}% fill box \Theox&#xa;
  \JoinCoffins*\Framex[r,vc]\Theox[l,vc](\dimexpr\Mshift+\Hshift-9mm\relax,#2)%join boxes&#xa;
  \noindent\TypesetCoffin\Framex\\[-2\baselineskip] %typeset assembly&#xa;
}&#xa;
\newcommand{\parmarginbox}[2]{%&#xa;
  \par %start a new line&#xa;
  \calculateMshift&#xa;
  \SetHorizontalCoffin\Framex{}&#xa;
  \SetVerticalCoffin\Theox{\marginparwidth}{#1}&#xa;
  \JoinCoffins*\Framex[r,vc]\Theox[l,vc](\dimexpr\Mshift+\textwidth\relax,#2)&#xa;
  \noindent\TypesetCoffin\Framex(0mm,0pt)\\[-2\baselineskip]&#xa;
}'"/>


<!-- we want images in margin to be the full margin width -->
<xsl:template match="figure/image[not(ancestor::sidebyside) and (descendant::latex-image or descendant::asymptote) and not(ancestor::exercise)]">
    <xsl:text>\begin{image}</xsl:text>
    <xsl:text>{0</xsl:text>
    <xsl:text>}</xsl:text>
    <xsl:text>{1</xsl:text>
    <xsl:text>}</xsl:text>
    <xsl:text>{0</xsl:text>
    <xsl:text>}{}%&#xa;</xsl:text>
    <xsl:apply-templates select="." mode="image-inclusion" />
    <xsl:text>\end{image}%&#xa;</xsl:text>
</xsl:template>

<!-- move non-sidebyside figures to the margin -->
<xsl:template match="figure[not(ancestor::sidebyside) and not(ancestor::aside) and not(descendant::sidebyside) and (descendant::latex-image or descendant::asymptote or descendant::video) and not(ancestor::exercise)]">
    <xsl:text>&#xa;</xsl:text>
    <xsl:choose>
      <xsl:when test="ancestor::example and not(ancestor::ul or ancestor::ol)">
        <xsl:text>\tcbmarginbox{%&#xa;</xsl:text>
      </xsl:when>
      <xsl:when test="ancestor::example and (ancestor::ul or ancestor::ol)">
        <xsl:text>\listmarginbox{%&#xa;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\parmarginbox{%&#xa;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
        <xsl:text>\begin{</xsl:text>
        <xsl:apply-templates select="." mode="environment-name"/>
        <xsl:text>}{</xsl:text>
        <xsl:apply-templates select="." mode="type-name"/>
        <xsl:text>}{</xsl:text>
        <xsl:apply-templates select="." mode="caption-full"/>
        <xsl:text>}{</xsl:text>
        <xsl:apply-templates select="." mode="internal-id"/>
        <xsl:text>}{</xsl:text>
        <xsl:if test="$b-latex-hardcode-numbers">
            <xsl:apply-templates select="." mode="number"/>
        </xsl:if>
        <xsl:text>}%&#xa;</xsl:text>
        <!-- images have margins and widths, so centering not needed -->
        <!-- Eventually everything in a figure should control itself -->
        <!-- or be flush left (or so)                                -->
        <xsl:if test="self::figure and not(image or tabular)">
            <xsl:text>\centering&#xa;</xsl:text>
        </xsl:if>
        <xsl:apply-templates select="*"/>
        <!-- reserve space for the caption -->
        <xsl:text>\tcblower&#xa;</xsl:text>
        <xsl:text>\end{</xsl:text>
        <xsl:apply-templates select="." mode="environment-name"/>
        <xsl:text>}%&#xa;</xsl:text>
        <xsl:apply-templates select="." mode="pop-footnote-text"/>
        <xsl:text>}{0cm}&#xa;</xsl:text>
        <xsl:text>&#xa;</xsl:text>
</xsl:template>

<!-- move tables to the margin -->
<xsl:template match="table[not(ancestor::sidebyside) and not(ancestor::aside) and not(descendant::sidebyside) and not(ancestor::exercise)]">
    <xsl:text>&#xa;</xsl:text>
    <xsl:choose>
      <xsl:when test="ancestor::example and not(ancestor::ul or ancestor::ol)">
        <xsl:text>\tcbmarginbox{%&#xa;</xsl:text>
      </xsl:when>
      <xsl:when test="ancestor::example and (ancestor::ul or ancestor::ol)">
        <xsl:text>\listmarginbox{%&#xa;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\parmarginbox{%&#xa;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>\begin{</xsl:text>
    <xsl:apply-templates select="." mode="environment-name"/>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="type-name"/>
    <xsl:text>}{</xsl:text>
    <xsl:text>\textbf{</xsl:text>
    <xsl:apply-templates select="." mode="title-full"/>
    <xsl:text>}</xsl:text>
    <xsl:text>}{</xsl:text>
    <xsl:apply-templates select="." mode="internal-id"/>
    <xsl:text>}{</xsl:text>
    <xsl:if test="$b-latex-hardcode-numbers">
        <xsl:apply-templates select="." mode="number"/>
    </xsl:if>
    <xsl:text>}%&#xa;</xsl:text>
    <!-- A "list" has an introduction/conclusion, with a       -->
    <!-- list of some type in-between, and these will all      -->
    <!-- automatically word-wrap to fill the available width.  -->
    <!-- TODO: process meta-data, then restrict contents -->
    <!-- tabular, introduction|list|conclusion           -->
    <xsl:apply-templates select="*"/>
    <!-- subcaption always goes in lower part -->
    <xsl:if test="ancestor::*[self::figure]">
        <xsl:text>\tcblower&#xa;</xsl:text>
    </xsl:if>
    <xsl:text>\end{</xsl:text>
    <xsl:apply-templates select="." mode="environment-name"/>
    <xsl:text>}%&#xa;</xsl:text>
    <xsl:apply-templates select="." mode="pop-footnote-text"/>
    <xsl:text>}{0cm}&#xa;</xsl:text>
    <xsl:text>&#xa;</xsl:text>
</xsl:template>

<!-- asides in the margin -->
<!-- simple asides, with no styling available -->
<xsl:template match="aside">
    <xsl:text>&#xa;</xsl:text>
    <xsl:choose>
      <xsl:when test="ancestor::example and not(ancestor::ul or ancestor::ol)">
        <xsl:text>\tcbmarginbox{%&#xa;</xsl:text>
      </xsl:when>
      <xsl:when test="ancestor::example and (ancestor::ul or ancestor::ol)">
        <xsl:text>\listmarginbox{%&#xa;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\parmarginbox{%&#xa;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>\begin{</xsl:text>
    <xsl:value-of select="local-name(.)" />
    <xsl:text>}</xsl:text>
    <xsl:apply-templates select="." mode="block-options"/>
    <xsl:text>%&#xa;</xsl:text>
    <!-- Coordinate with schema, since we enforce it here -->
    <xsl:apply-templates select="p|blockquote|pre|image|video|program|console|tabular"/>
    <xsl:text>\end{</xsl:text>
    <xsl:value-of select="local-name(.)" />
    <xsl:text>}&#xa;</xsl:text>
    <xsl:apply-templates select="." mode="pop-footnote-text"/>
    <xsl:text>}{0cm}%&#xa;</xsl:text>
    <xsl:text>&#xa;</xsl:text>
</xsl:template>

<!-- make YouTube static URLs fit in the margin -->
<xsl:template match="video[@youtube|@youtubeplaylist]" mode="static-caption">
    <xsl:param name="width-scale" />
    <xsl:variable name="youtube">
        <xsl:choose>
            <xsl:when test="@youtubeplaylist">
                <xsl:value-of select="normalize-space(@youtubeplaylist)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space(str:replace(@youtube, ',', ' '))" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:choose>
        <!-- author-supplied override -->
        <xsl:when test="caption">
            <xsl:apply-templates select="caption" />
        </xsl:when>
        <!-- identification, url for typing-in -->
        <xsl:otherwise>
            <xsl:text>YouTube: </xsl:text>
            <xsl:choose>
                <xsl:when test="@youtubeplaylist">
                  <xsl:variable name="visual-url">
                    <c>
                      <xsl:text>www.youtube.com/</xsl:text>
                      <xsl:text>playlist?list=</xsl:text>
                      <xsl:value-of select="$youtube" />
                    </c>
                  </xsl:variable>
                  <xsl:apply-templates select="exsl:node-set($visual-url)/*" />
                    <xsl:text>%&#xa;</xsl:text>
                </xsl:when>
                <xsl:when test="contains($youtube, ' ')">
                  <xsl:variable name="visual-first">
                    <c>
                      <xsl:text>youtube.com/</xsl:text>
                      <xsl:text>watch_videos?</xsl:text>
                      <xsl:text>video_ids=</xsl:text>
                    </c>
                  </xsl:variable>
                  <xsl:apply-templates select="exsl:node-set($visual-first)/*" />
                  <xsl:text>&#xa;</xsl:text>
                  <xsl:variable name="visual-second">
                    <c>
                      <xsl:value-of select="str:replace($youtube, ' ', ',')" />
                    </c>
                  </xsl:variable>
                  <xsl:apply-templates select="exsl:node-set($visual-second)/*" />
                  <xsl:text>%&#xa;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:variable name="visual-url">
                    <c>
                      <xsl:text>youtu.be/</xsl:text>
                      <xsl:value-of select="$youtube" />
                    </c>
                  </xsl:variable>
                  <xsl:apply-templates select="exsl:node-set($visual-url)/*" />
                  <xsl:text>%&#xa;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

  <!-- video links in margin (skip thumbnail) -->
  <xsl:template match="video">
    <!-- scale to fit into a side-by-side -->
    <xsl:variable name="width-percentage">
        <xsl:choose>
            <xsl:when test="ancestor::sidebyside">
                <xsl:apply-templates select="." mode="get-width-percentage" />
                <xsl:text>&#xa;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>100%</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="width-scale" select="substring-before($width-percentage,'%') div 100" />
    <xsl:text>\setlength{\qrsize}{0.6\marginparwidth}</xsl:text>
    <xsl:text>\begin{tcolorbox}[qrstyle]%&#xa;</xsl:text>
    <xsl:apply-templates select="." mode="static-qr" />
    <xsl:text>\end{tcolorbox}%&#xa;</xsl:text>

    <xsl:variable name="the-caption">
        <xsl:apply-templates select="." mode="static-caption">
            <xsl:with-param name="width-scale" select="$width-scale" />
        </xsl:apply-templates>
    </xsl:variable>
    <xsl:if test="not($the-caption ='')">
        <xsl:text>\begin{tcolorbox}[captionstyle]%&#xa;</xsl:text>
        <xsl:text>\small </xsl:text>
        <xsl:value-of select="$the-caption" />
        <xsl:text>\end{tcolorbox}%&#xa;</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- video solutions go in the margin -->
  <xsl:template match="solution[descendant::video and not(descendant::figure)]">
    <xsl:param name="b-original" />
    <xsl:param name="purpose" />
    <xsl:param name="b-component-heading"/>

    <xsl:text>\tcbmarginbox{%&#xa;</xsl:text>
      <xsl:apply-templates select="." mode="solution-heading">
          <xsl:with-param name="b-original" select="$b-original" />
          <xsl:with-param name="purpose" select="$purpose" />
          <xsl:with-param name="b-component-heading" select="$b-component-heading"/>
      </xsl:apply-templates>
      <xsl:apply-templates>
          <xsl:with-param name="b-original" select="$b-original" />
      </xsl:apply-templates>
      <xsl:text>}{0cm}%&#xa;</xsl:text>
      <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="video[ancestor::solution and not(ancestor::figure)]">
    <!-- scale to fit into a side-by-side -->
    <xsl:variable name="width-percentage">
        <xsl:choose>
            <xsl:when test="ancestor::sidebyside">
                <xsl:apply-templates select="." mode="get-width-percentage" />
                <xsl:text>&#xa;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>100%</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="width-scale" select="substring-before($width-percentage,'%') div 100" />
    <xsl:text>\setlength{\qrsize}{0.6\marginparwidth}&#xa;</xsl:text>
    <xsl:text>\begin{tcolorbox}[qrstyle,left=30pt]%&#xa;</xsl:text>
    <xsl:apply-templates select="." mode="static-qr" />
    <xsl:text>\end{tcolorbox}%&#xa;</xsl:text>

    <xsl:variable name="the-caption">
        <xsl:apply-templates select="." mode="static-caption">
            <xsl:with-param name="width-scale" select="$width-scale" />
        </xsl:apply-templates>
    </xsl:variable>
    <xsl:if test="not($the-caption ='')">
        <xsl:text>\begin{tcolorbox}[captionstyle]%&#xa;</xsl:text>
        <xsl:text>\small </xsl:text>
        <xsl:value-of select="$the-caption" />
        <xsl:text>\end{tcolorbox}%&#xa;</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
