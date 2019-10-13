<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" version="1.0">
    
    <xsl:output method="text"/>
    <xsl:decimal-format name="pop" grouping-separator=" " decimal-separator=","></xsl:decimal-format>
    <xsl:template match="/">
        <html>
            <head>  </head>
            <body>
                <h1>paye du monde</h1>
                <ul>
                    <xsl:for-each select="mondial/country">
                        <xsl:sort select="population[last()]" data-type="number" />
                        <xsl:variable name="color">red</xsl:variable>
                        <xsl:choose>
                            <xsl:when test="encompassed/@continent='europe'">#888</xsl:when>
                            <xsl:when test="encompassed/@continent='africa'">#000</xsl:when>
                            <xsl:when test="encompassed/@continent='america'">#800</xsl:when>
                            <xsl:when test="encompassed/@continent='asia'">#880</xsl:when>
                            <xsl:otherwise>#080</xsl:otherwise>
                        </xsl:choose>
                        
                        <li style="color:$color">
                            <xsl:value-of select="name"/> - 
                            <xsl:value-of select="population[last()]"/>
                            <xsl:value-of select="format-number(population[last()],'# 000','pop')"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
    

