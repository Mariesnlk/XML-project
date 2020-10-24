<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-->Expand<-->

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*[not(*) and not(@*)]">
        <xsl:copy>
            <xsl:attribute name="{name()}">
                <xsl:value-of select="text()"/>
            </xsl:attribute>
        </xsl:copy>
    </xsl:template>

    <!-->Collapse<-->

    <xsl:template match="node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- attributes to elements -->
    <xsl:template match="@*">
        <xsl:element name="{name()}">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <!-- avoid mixed content -->
    <xsl:template match="text()[../@*]">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>