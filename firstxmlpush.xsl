<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head><title> <xsl:text> Push processing </xsl:text> </title></head>
            <body>
                <h2>
                    <span style="color:#ff0000; font-weight:bold">ЗАРПЛАТИ СПІВРОБІТНИКІВ</span>
                </h2>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="employee">
        <table border="1">
            <tr>
                <th>
                    <xsl:apply-templates select="last_name"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="first_name"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select="second_name"/>
                </th>
                <th>
                    <xsl:apply-templates select="subsection"/>
                </th>
                <th>
                    <xsl:apply-templates select="salary"/>
                </th>
                <th>
                    <xsl:apply-templates select="e-mail"/>
                </th>
                <th>
                    <!--first way adding link-->
<!--                    <a href="{url}">-->
<!--                        <xsl:value-of select="url"/>-->
<!--                    </a>-->
                    <!--second way adding link-->
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="url"/>
                        </xsl:attribute>
                        <xsl:value-of select="url"/>
                    </xsl:element>
                </th>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="last_name">
        <span style="color:#008080; font-weight:bold">ПІБ</span>
        <span style="font-style:italic">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="subsection">
        <span style="color:#008080; font-weight:bold">Підрозділ</span>
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="salary">
        <span style="color:#008080; font-weight:bold">Зарплата</span>
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="e-mail">
        <span style="color:#008080; font-weight:bold">E-mail</span>
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="url">
        <span style="color:#008080; font-weight:bold">WWW</span>
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
