<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
   <html>
      <head>
        <title>XML Visualiser</title>
      </head>
      <body>
        <h2>Результат обработки:</h2>
          <xsl:for-each select="mains/main">
            <table>
              <tr>
                <td>id</td>
                <td><xsl:value-of select="id"/></td>
              </tr>
              <tr>
                <td>query_number</td>
                <td><xsl:value-of select="query-number"/></td>
              </tr>
              <tr>
                <td>query_sequence</td>
                <td><xsl:value-of select="query-sequence"/></td>
              </tr>
              <tr>
                <td>sequences</td>
                <td><xsl:value-of select="sequences"/></td>
              </tr>
              <tr>
                <td>maxsequence</td>
                <td><xsl:value-of select="maxsequence"/></td>
              </tr>
              <tr>
                <td>sequence_number</td>
                <td><xsl:value-of select="sequences-number"/></td>
              </tr>
              <tr>
                <td>created_at</td>
                <td><xsl:value-of select="created-at"/></td>
              </tr>
              <tr>
                <td>updated_at</td>
                <td><xsl:value-of select="updated-at"/></td>
              </tr>
            </table>
          </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
