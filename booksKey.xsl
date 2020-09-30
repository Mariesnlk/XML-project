<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:variable name="search_topic" select="'lifehack'"/>
    <xsl:param name="tcp"/>
    <xsl:key name="name" match="book" use="@topic"/>

    <xsl:template match="/">
        <HTML>
            <head>
                <title>
                    <xsl:text> Result of search </xsl:text>
                </title>
            </head>
            <body>
                <h1>theme of search: <xsl:value-of select="$search_topic"/></h1>
                <xsl:for-each select="key('name', $search_topic)">
                    <b><xsl:value-of select="author"/></b>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="title"/>
                    <br/>
                </xsl:for-each>
            </body>
        </HTML>
    </xsl:template>
</xsl:stylesheet>
