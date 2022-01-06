<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties"
                xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" omit-xml-declaration="no" indent="no" encoding="UTF-8" standalone="yes"/>
  <xsl:template match="core">
    <cp:coreProperties >
      <dc:title>Presentation PowerPoint</dc:title>
      <dc:creator>
          <xsl:value-of select="@creator"/>
      </dc:creator>
      <cp:lastModifiedBy>
        <xsl:value-of select="@creator"/>
      </cp:lastModifiedBy>
      <cp:revision>1</cp:revision>
      <dcterms:modified xsi:type="dcterms:W3CDTF">
        <xsl:value-of select="@time"/>
      </dcterms:modified>
    </cp:coreProperties>
  </xsl:template>
</xsl:stylesheet>