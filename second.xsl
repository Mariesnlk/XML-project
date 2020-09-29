<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <HTML>
            <body>
                <h2>
                    <span style="color:#ff0000">ЗАРПЛАТИ СПІВРОБІТНИКІВ</span>
                </h2>
                <table border="1">
                    <tr>
                        <th>
                            <span style="color:#008080">ПІБ</span>
                        </th>
                        <th>
                            <span style="color:#008080">Підрозділ</span>
                        </th>
                        <th>
                            <span style="color:#008080">Зарплата</span>
                        </th>
                    </tr>
                    <xsl:for-each select="employees/employee">
                        <xsl:if test="salary>15000">
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
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>

            </body>
        </HTML>

    </xsl:template>

</xsl:stylesheet>

