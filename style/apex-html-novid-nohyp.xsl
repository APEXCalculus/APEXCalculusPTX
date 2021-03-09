<?xml version='1.0'?> <!-- As XML file -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Thin layer on MathBook XML -->
<xsl:import href="../../mathbook/xsl/pretext-html.xsl" />

<!-- String parameters -->

<!-- html layout options -->
<xsl:param name="webwork.divisional.static" select="'no'"/>
<!-- <xsl:param name="html.knowl.exercise.sectional" select="'no'"/> -->
<!-- <xsl:param name="html.knowl.example" select="'no'"/> -->
<!-- uncomment next line to enable hypothesis annotation -->
<!-- <xsl:param name="html.annotation" select="'hypothesis'"/> -->

<!-- uncomment to turn off hints, answers, and solutions for divisional exercises -->
<xsl:param name="exercise.divisional.hint" select="'no'"/>
<xsl:param name="exercise.divisional.answer" select="'no'"/>
<xsl:param name="exercise.divisional.solution" select="'no'"/>

<!-- if answers and solutions are inline, don't need solutions at the end -->
<!-- <xsl:template match="solutions"/> -->

<!-- uncommenting these will omit videos -->
    <xsl:template match="video[starts-with(@xml:id, 'vid')]" />
    <xsl:template match="figure[starts-with(@xml:id, 'vid')]" />
    <xsl:template match="p[starts-with(@xml:id, 'vidint')]" />
    <xsl:template match="aside[starts-with(@xml:id, 'vidnote')]" />
</xsl:stylesheet>
