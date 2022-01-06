<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" 
                xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" 
                xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <xsl:output method="xml" omit-xml-declaration="no" indent="no" encoding="UTF-8" standalone="yes"/>
  
  <xsl:template match="slydeLayout">
    <p:sldLayoutId>
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
      <xsl:attribute name="r:id">
        <xsl:value-of select="@rId"/>
      </xsl:attribute>
    </p:sldLayoutId>
  </xsl:template>

  <xsl:template match="master">
    <p:sldMaster >
      <p:cSld>
        <p:bg>
          <p:bgPr>
            <a:solidFill>
              <a:schemeClr val="bg1"/>
            </a:solidFill>
            <a:effectLst/>
          </p:bgPr>
        </p:bg>
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
          <p:sp>
            <p:nvSpPr>
              <p:cNvPr id="2" name="Holder 2"/>
              <p:cNvSpPr>
                <a:spLocks noGrp="1"/>
              </p:cNvSpPr>
              <p:nvPr>
                <p:ph type="title"/>
              </p:nvPr>
            </p:nvSpPr>
            <p:spPr>
              <a:xfrm>
                <a:off x="377666" y="427735"/>
                <a:ext cx="6797992" cy="1710943"/>
              </a:xfrm>
              <a:prstGeom prst="rect">
                <a:avLst/>
              </a:prstGeom>
            </p:spPr>
            <p:txBody>
              <a:bodyPr wrap="square" lIns="0" tIns="0" rIns="0" bIns="0">
                <a:spAutoFit/>
              </a:bodyPr>
              <a:lstStyle>
                <a:lvl1pPr>
                  <a:defRPr/>
                </a:lvl1pPr>
              </a:lstStyle>
              <a:p/>
            </p:txBody>
          </p:sp>
          <p:sp>
            <p:nvSpPr>
              <p:cNvPr id="3" name="Holder 3"/>
              <p:cNvSpPr>
                <a:spLocks noGrp="1"/>
              </p:cNvSpPr>
              <p:nvPr>
                <p:ph type="body" idx="1"/>
              </p:nvPr>
            </p:nvSpPr>
            <p:spPr>
              <a:xfrm>
                <a:off x="377666" y="2459482"/>
                <a:ext cx="6797992" cy="7057644"/>
              </a:xfrm>
              <a:prstGeom prst="rect">
                <a:avLst/>
              </a:prstGeom>
            </p:spPr>
            <p:txBody>
              <a:bodyPr wrap="square" lIns="0" tIns="0" rIns="0" bIns="0">
                <a:spAutoFit/>
              </a:bodyPr>
              <a:lstStyle>
                <a:lvl1pPr>
                  <a:defRPr/>
                </a:lvl1pPr>
              </a:lstStyle>
              <a:p/>
            </p:txBody>
          </p:sp>
          <p:sp>
            <p:nvSpPr>
              <p:cNvPr id="4" name="Holder 4"/>
              <p:cNvSpPr>
                <a:spLocks noGrp="1"/>
              </p:cNvSpPr>
              <p:nvPr>
                <p:ph type="ftr" idx="5" sz="quarter"/>
              </p:nvPr>
            </p:nvSpPr>
            <p:spPr>
              <a:xfrm>
                <a:off x="2568130" y="9944862"/>
                <a:ext cx="2417063" cy="534670"/>
              </a:xfrm>
              <a:prstGeom prst="rect">
                <a:avLst/>
              </a:prstGeom>
            </p:spPr>
            <p:txBody>
              <a:bodyPr wrap="square" lIns="0" tIns="0" rIns="0" bIns="0">
                <a:spAutoFit/>
              </a:bodyPr>
              <a:lstStyle>
                <a:lvl1pPr algn="ctr">
                  <a:defRPr>
                    <a:solidFill>
                      <a:schemeClr val="tx1">
                        <a:tint val="75000"/>
                      </a:schemeClr>
                    </a:solidFill>
                  </a:defRPr>
                </a:lvl1pPr>
              </a:lstStyle>
              <a:p/>
            </p:txBody>
          </p:sp>
          <p:sp>
            <p:nvSpPr>
              <p:cNvPr id="5" name="Holder 5"/>
              <p:cNvSpPr>
                <a:spLocks noGrp="1"/>
              </p:cNvSpPr>
              <p:nvPr>
                <p:ph type="dt" idx="6" sz="half"/>
              </p:nvPr>
            </p:nvSpPr>
            <p:spPr>
              <a:xfrm>
                <a:off x="377666" y="9944862"/>
                <a:ext cx="1737264" cy="534670"/>
              </a:xfrm>
              <a:prstGeom prst="rect">
                <a:avLst/>
              </a:prstGeom>
            </p:spPr>
            <p:txBody>
              <a:bodyPr wrap="square" lIns="0" tIns="0" rIns="0" bIns="0">
                <a:spAutoFit/>
              </a:bodyPr>
              <a:lstStyle>
                <a:lvl1pPr algn="l">
                  <a:defRPr>
                    <a:solidFill>
                      <a:schemeClr val="tx1">
                        <a:tint val="75000"/>
                      </a:schemeClr>
                    </a:solidFill>
                  </a:defRPr>
                </a:lvl1pPr>
              </a:lstStyle>
              <a:p>
                <a:fld id="{{1D8BD707-D9CF-40AE-B4C6-C98DA3205C09}}" type="datetimeFigureOut">
                  <a:rPr lang="en-US"/>
                </a:fld>
              </a:p>
            </p:txBody>
          </p:sp>
          <p:sp>
            <p:nvSpPr>
              <p:cNvPr id="6" name="Holder 6"/>
              <p:cNvSpPr>
                <a:spLocks noGrp="1"/>
              </p:cNvSpPr>
              <p:nvPr>
                <p:ph type="sldNum" idx="7" sz="quarter"/>
              </p:nvPr>
            </p:nvSpPr>
            <p:spPr>
              <a:xfrm>
                <a:off x="5438394" y="9944862"/>
                <a:ext cx="1737264" cy="534670"/>
              </a:xfrm>
              <a:prstGeom prst="rect">
                <a:avLst/>
              </a:prstGeom>
            </p:spPr>
            <p:txBody>
              <a:bodyPr wrap="square" lIns="0" tIns="0" rIns="0" bIns="0">
                <a:spAutoFit/>
              </a:bodyPr>
              <a:lstStyle>
                <a:lvl1pPr algn="r">
                  <a:defRPr>
                    <a:solidFill>
                      <a:schemeClr val="tx1">
                        <a:tint val="75000"/>
                      </a:schemeClr>
                    </a:solidFill>
                  </a:defRPr>
                </a:lvl1pPr>
              </a:lstStyle>
              <a:p>
                <a:fld id="{{B6F15528-21DE-4FAA-801E-634DDDAF4B2B}}" type="slidenum">
                  <a:t>В‹#В›</a:t>
                </a:fld>
              </a:p>
            </p:txBody>
          </p:sp>
        </p:spTree>
      </p:cSld>
      <p:clrMap folHlink="folHlink" hlink="hlink" accent1="accent1" accent2="accent2" accent3="accent3" accent4="accent4" accent5="accent5" accent6="accent6" tx2="dk2" bg2="lt2" tx1="dk1" bg1="lt1"/>
      <p:sldLayoutIdLst>
        <xsl:apply-templates select="slydeLayout"/>
      </p:sldLayoutIdLst>
      <p:txStyles>
        <p:titleStyle>
          <a:lvl1pPr>
            <a:defRPr>
              <a:latin typeface="+mj-lt"/>
              <a:ea typeface="+mj-ea"/>
              <a:cs typeface="+mj-cs"/>
            </a:defRPr>
          </a:lvl1pPr>
        </p:titleStyle>
        <p:bodyStyle>
          <a:lvl1pPr marL="0">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl1pPr>
          <a:lvl2pPr marL="457200">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl2pPr>
          <a:lvl3pPr marL="914400">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl3pPr>
          <a:lvl4pPr marL="1371600">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl4pPr>
          <a:lvl5pPr marL="1828800">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl5pPr>
          <a:lvl6pPr marL="2286000">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl6pPr>
          <a:lvl7pPr marL="2743200">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl7pPr>
          <a:lvl8pPr marL="3200400">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl8pPr>
          <a:lvl9pPr marL="3657600">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl9pPr>
        </p:bodyStyle>
        <p:otherStyle>
          <a:lvl1pPr marL="0">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl1pPr>
          <a:lvl2pPr marL="457200">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl2pPr>
          <a:lvl3pPr marL="914400">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl3pPr>
          <a:lvl4pPr marL="1371600">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl4pPr>
          <a:lvl5pPr marL="1828800">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl5pPr>
          <a:lvl6pPr marL="2286000">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl6pPr>
          <a:lvl7pPr marL="2743200">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl7pPr>
          <a:lvl8pPr marL="3200400">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl8pPr>
          <a:lvl9pPr marL="3657600">
            <a:defRPr>
              <a:latin typeface="+mn-lt"/>
              <a:ea typeface="+mn-ea"/>
              <a:cs typeface="+mn-cs"/>
            </a:defRPr>
          </a:lvl9pPr>
        </p:otherStyle>
      </p:txStyles>
    </p:sldMaster>
  </xsl:template>

</xsl:stylesheet>