<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <HTML>
            <head>
                <title>
                    <xsl:text> Employees </xsl:text>
                </title>
            </head>
            <body>
                <h2 color="#ff0000" font-weight="bold">ЗАРПЛАТИ СПІВРОБІТНИКІВ</h2>
                <table border="1">
                    <tr color="#008080" font-weight="bold">
                        <th>ПІБ</th>
                        <th>Підрозділ</th>
                        <th>Зарплата</th>
                        <th>E-mail</th>
                        <th>WWW</th>
                    </tr>
                    <xsl:for-each select="employees/employee">
                        <xsl:sort select="last_name"/>
                        <tr>
                            <td>
                                <xsl:value-of select="last_name"/>
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
                                <xsl:value-of select="web_address"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

            </body>
        </HTML>

    </xsl:template>

</xsl:stylesheet>