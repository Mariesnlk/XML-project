<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:text> Push processing </xsl:text>
                </title>
            </head>
            <body>
                <h1 style="color:#ff0000">
                    ЗАРПЛАТИ СПІВРОБІТНИКІВ
                </h1>
                <table border="1">
                    <tr style="color:#008080; font-weight:bold">
                        <th>ПІБ</th>
                        <th>Підрозділ</th>
                        <th>Зарплата</th>
                        <th>E-mail</th>
                        <th>WWW</th>
                    </tr>
                    <xsl:apply-templates/>
                    <xsl:apply-templates select="employee/employee">
                        <xsl:sort select="last_name" order="ascending"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="employee">
        <tr>
            <td>
                <span style="font-style:italic">
                <xsl:value-of select="last_name"/>
                </span>
                <xsl:text> </xsl:text>
                <xsl:value-of select="first_name"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="second_name"/>
                <xsl:text> </xsl:text>
            </td>
            <td>
                <xsl:value-of select="subsection"/>
            </td>
            <td>
                <xsl:value-of select="salary"/>
            </td>
            <td>
                <xsl:value-of select="e-mail"/>
            </td>
            <td>
<!--                <xsl:value-of select="url"/>-->
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
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
