<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
                xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" 
                xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <xsl:output method="xml" omit-xml-declaration="no" indent="no" encoding="UTF-8" standalone="yes"/>

  <xsl:template match="master">
    <p:sldMasterId>
    <xsl:attribute name="id">
      <xsl:value-of select="@id"/>
    </xsl:attribute>
    <xsl:attribute name="r:id">
      <xsl:value-of select="@rId"/>
    </xsl:attribute>
    </p:sldMasterId>
  </xsl:template>
  
  <xsl:template match="sld">
    <p:sldId>
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
      <xsl:attribute name="r:id">
        <xsl:value-of select="@rId"/>
      </xsl:attribute>
    </p:sldId>
  </xsl:template>
  
  <xsl:template match="font">
    <p:embeddedFont>
      <p:font>
        <xsl:attribute name="typeface">
          <xsl:value-of select="@fName"/>
        </xsl:attribute>
      </p:font>
      <p:regular>
        <xsl:attribute name="r:id">
          <xsl:value-of select="@rId"/>
        </xsl:attribute>
      </p:regular>
    </p:embeddedFont>
  </xsl:template>
  
  <xsl:template match="embeddedFonts">
    <p:embeddedFontLst>
      <xsl:apply-templates select="font"/>
    </p:embeddedFontLst>
  </xsl:template>

  <xsl:template match="slides">
    <p:presentation embedTrueTypeFonts="1" saveSubsetFonts="1">
      <p:sldMasterIdLst>
        <xsl:apply-templates select="master"/>
      </p:sldMasterIdLst>
      <p:sldIdLst>
        <xsl:apply-templates select="sld"/>
      </p:sldIdLst>
      <p:sldSz>
        <xsl:attribute name="cx">
          <xsl:value-of select="@cx"/>
        </xsl:attribute>
        <xsl:attribute name="cy">
          <xsl:value-of select="@cy"/>
        </xsl:attribute>
      </p:sldSz>
      <p:notesSz>
        <xsl:attribute name="cx">
          <xsl:value-of select="@cx"/>
        </xsl:attribute>
        <xsl:attribute name="cy">
          <xsl:value-of select="@cy"/>
        </xsl:attribute>
      </p:notesSz>
      <xsl:apply-templates select="embeddedFonts"/>
    </p:presentation>
    
  </xsl:template>
</xsl:stylesheet>
