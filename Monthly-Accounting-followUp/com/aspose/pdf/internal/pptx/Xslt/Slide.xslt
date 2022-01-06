<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
                xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" 
                xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <xsl:output method="xml" omit-xml-declaration="no" indent="no" encoding="UTF-8" standalone="yes"/>
  
  <xsl:template match="section">
    <p:sld  showMasterSp="0">
      <p:cSld>
        <p:spTree>
          <p:nvGrpSpPr>
            <p:cNvPr id="1" name=""/>
            <p:cNvGrpSpPr/>
            <p:nvPr/>
          </p:nvGrpSpPr>
          <p:grpSpPr>
            <a:xfrm>
              <a:off x="0" y="0"/>
              <a:ext cx="0" cy="0"/>
              <a:chOff x="0" y="0"/>
              <a:chExt cx="0" cy="0"/>
            </a:xfrm>
          </p:grpSpPr>
          <xsl:apply-templates select="tb|img"/>
        </p:spTree>
      </p:cSld>
      <p:clrMapOvr>
        <a:masterClrMapping/>
      </p:clrMapOvr>
    </p:sld>
   
  </xsl:template>

  <xsl:template match="tb">
    <p:sp>
      <p:nvSpPr>
        <p:cNvPr>
          <xsl:attribute name="id">
            <xsl:value-of select="@id"/>
          </xsl:attribute>
          <xsl:attribute name="name">
            <xsl:value-of select="concat('object ',@id)"/>
          </xsl:attribute>
        </p:cNvPr>
        <p:cNvSpPr txBox="1"/>
        <p:nvPr/>
      </p:nvSpPr>
      <p:spPr>
        <a:xfrm>
          <a:off>
            <xsl:attribute name="x">
              <xsl:value-of select="@x"/>
            </xsl:attribute>  
            <xsl:attribute name="y">
              <xsl:value-of select="@y"/>
            </xsl:attribute>
          </a:off>
          <a:ext>
            <xsl:attribute name="cx">
              <xsl:value-of select="@cx"/>
            </xsl:attribute>
            <xsl:attribute name="cy">
              <xsl:value-of select="@cy"/>
            </xsl:attribute>
          </a:ext>
        </a:xfrm>
        <a:prstGeom prst="rect">
          <a:avLst/>
        </a:prstGeom>
      </p:spPr>
      <p:txBody> 
        <a:bodyPr wrap="square" lIns="0" tIns="0" rIns="0" bIns="0" rtlCol="0" vert="horz">
          <a:spAutoFit/>
        </a:bodyPr>
        <a:lstStyle/>
        <xsl:apply-templates select="pr"/>
      </p:txBody>
      
    </p:sp>
  </xsl:template>

  <xsl:template match="pr">
    <a:p>
      <a:pPr>
        <xsl:choose>
          <xsl:when test ="@align='r'">
            <xsl:attribute name="algn">
              <xsl:value-of select="r"/>
            </xsl:attribute>
          </xsl:when> 
          <xsl:when test ="@align='ctr'">
            <xsl:attribute name="algn">
              <xsl:value-of select="ctr"/>
            </xsl:attribute>
          </xsl:when>
        </xsl:choose>
        <xsl:if test="@leftInd">
          <xsl:attribute name="marL">
            <xsl:value-of select="@leftInd"/>
          </xsl:attribute>
        </xsl:if>  
        <xsl:if test="@rightInd">
          <xsl:attribute name="marR">
            <xsl:value-of select="@rightInd"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@lnIntrv">
          <a:lnSpc>
            <a:spcPts>
              <xsl:attribute name="val">
                <xsl:value-of select="@lnIntrv"/>
              </xsl:attribute>
            </a:spcPts>
          </a:lnSpc>
        </xsl:if> 
        <xsl:if test="@before">
          <a:spcBef>
            <a:spcPts>
              <xsl:attribute name="val">
                <xsl:value-of select="@before"/>
              </xsl:attribute>
            </a:spcPts>
          </a:spcBef>
        </xsl:if>
        <xsl:if test="@after">
          <a:spcAft>
            <a:spcPts>
              <xsl:attribute name="val">
                <xsl:value-of select="@after"/>
              </xsl:attribute>
            </a:spcPts>
          </a:spcAft>
        </xsl:if>
      </a:pPr>
      <xsl:apply-templates select="r|hyperlink"/>
    </a:p>
  </xsl:template>
  
  <xsl:template match="hyperlink">
  	<xsl:apply-templates select="r"/>
  </xsl:template>

  <xsl:template match="r">
    <a:r>
      <a:rPr dirty="0" >
        <xsl:attribute name="sz">
          <xsl:value-of select="@fSz"/>
        </xsl:attribute>
	<xsl:if test="@baseline">
          <xsl:attribute name="baseline">
            <xsl:value-of select="@baseline"/>
          </xsl:attribute>
        </xsl:if>
	<xsl:if test="@spc">
		<xsl:attribute name="spc">
			<xsl:value-of select="@spc"/>
		</xsl:attribute>
	</xsl:if>
        <xsl:if test="@b='1'">
          <xsl:attribute name="b">
            <xsl:value-of select="@b"/>
          </xsl:attribute>
        </xsl:if>  
        <xsl:if test="@u">
          <xsl:attribute name="u">
            <xsl:value-of select="@u"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@strike">
          <xsl:attribute name="strike">
            <xsl:value-of select="@strike"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@i='1'">
          <xsl:attribute name="i">
            <xsl:value-of select="@i"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@clr">
          <a:solidFill>
            <a:srgbClr>
              <xsl:attribute name="val">
                <xsl:value-of select="@clr"/>
              </xsl:attribute>
            </a:srgbClr>
          </a:solidFill>
        </xsl:if>
        <xsl:if test="@highlight">
          <a:highlight>
            <a:srgbClr>
              <xsl:attribute name="val">
                <xsl:value-of select="@highlight"/>
              </xsl:attribute>
            </a:srgbClr>
          </a:highlight>
        </xsl:if>
        <a:latin>
          <xsl:attribute name="typeface">
            <xsl:value-of select="@fName"/>
          </xsl:attribute>
        </a:latin>
        <a:cs>
          <xsl:attribute name="typeface">
            <xsl:value-of select="@fName"/>
          </xsl:attribute>
        </a:cs>
        <xsl:if test="(name(..)='hyperlink') and (../@anchor)">
        	<a:hlinkClick>
        		<xsl:attribute name="r:id">
        			<xsl:value-of select="../@anchor"/>
        	  </xsl:attribute>
        	  <xsl:if test="../@action">
        	  	<xsl:attribute name="action">
        	  		<xsl:value-of select="../@action"/>
        	  	</xsl:attribute>
        	  </xsl:if>
        	</a:hlinkClick>
        </xsl:if>
      </a:rPr>
      <a:t>
        <xsl:value-of select="t"/>
      </a:t>
    </a:r>
  </xsl:template>

  <xsl:template match="img">
    <p:sp>
      <p:nvSpPr>
        <p:cNvPr>
          <xsl:attribute name="id">
            <xsl:value-of select="@id"/>
          </xsl:attribute>
          <xsl:attribute name="name">
            <xsl:value-of select="concat('object ',@id)"/>
          </xsl:attribute>
        </p:cNvPr>
        <p:cNvSpPr/>
        <p:nvPr/>
      </p:nvSpPr>
      <p:spPr>
        <a:xfrm>
          <a:off>
            <xsl:attribute name="x">
              <xsl:value-of select="@x"/>
            </xsl:attribute>
            <xsl:attribute name="y">
              <xsl:value-of select="@y"/>
            </xsl:attribute>
          </a:off>
          <a:ext>
            <xsl:attribute name="cx">
              <xsl:value-of select="@cx"/>
            </xsl:attribute>
            <xsl:attribute name="cy">
              <xsl:value-of select="@cy"/>
            </xsl:attribute>
          </a:ext>
        </a:xfrm>
        <a:prstGeom prst="rect">
          <a:avLst/>
        </a:prstGeom>
        <a:blipFill>
          <a:blip cstate="print">
            <xsl:attribute name="r:embed">
              <xsl:value-of select="@rId"/>
            </xsl:attribute>
          </a:blip>
          <a:stretch>
            <a:fillRect/>
          </a:stretch>
        </a:blipFill>
      </p:spPr>
      <p:txBody>
        <a:bodyPr wrap="square" lIns="0" tIns="0" rIns="0" bIns="0" rtlCol="0">
          <a:spAutoFit/>
        </a:bodyPr>
        <a:lstStyle/>
        <a:p/>
      </p:txBody>
    </p:sp>
  </xsl:template>

</xsl:stylesheet>