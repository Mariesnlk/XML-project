<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="cond"/>

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="count(employees/employee[@salary > $cond]) !=0">
                <xsl:element name="employees">
                    <xsl:copy-of select="/employees/employee[@salary > $cond]"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="message">
                    <xsl:text> There are no employees with salary greater than </xsl:text>
                    <xsl:value-of select="$cond"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

