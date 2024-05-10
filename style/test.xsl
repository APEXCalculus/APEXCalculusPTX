<?xml version='1.0'?> <!-- As XML file -->

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities SYSTEM "./entities.ent">
    %entities;
]>

<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
    xmlns:exsl="http://exslt.org/common"
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns:str="http://exslt.org/strings"
    xmlns:pi="http://pretextbook.org/2020/pretext/internal"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    extension-element-prefixes="exsl date str"
    exclude-result-prefixes="pi"
>

<!-- import official pretext-latex style sheet -->
<!-- <xsl:import href="./core/pretext-latex.xsl"/> -->

<xsl:output method="text"/>


</xsl:stylesheet>
