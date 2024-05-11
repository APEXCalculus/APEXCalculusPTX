<?xml version='1.0'?> <!-- As XML file -->

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities SYSTEM "./entities.ent">
    %entities;
]>

<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
>

<xsl:output method="xml"/>

<xsl:template match="node()|@*">
    <xsl:copy>
        <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="image[latex-image|asymptote]/@xml:id"/>

<xsl:template match="latex-image|asymptote">
  <!-- <xsl:if test="not(../@xml:id)">
    <xsl:message>Oops</xsl:message>
    <xsl:if test="ancestor::webwork">
      <xsl:message>webwork</xsl:message>
    </xsl:if>
    <xsl:value-of select="."/>
  </xsl:if> -->
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:if test="../@xml:id">
      <xsl:attribute name="label">
        <xsl:value-of select="../@xml:id"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select="node()"/>
  </xsl:copy>
</xsl:template>
</xsl:stylesheet>
