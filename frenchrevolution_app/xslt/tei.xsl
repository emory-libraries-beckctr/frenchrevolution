<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:tei="http://www.tei-c.org/ns/1.0"
                version="1.0">

  <xsl:variable name="figure-path">http://beck.library.emory.edu/frenchrevolution/image-content/</xsl:variable>
  <xsl:variable name="figure-suffix">.jpg</xsl:variable>
  <xsl:variable name="thumbnail-path">http://beck.library.emory.edu/frenchrevolution/image-content/thumbnails/</xsl:variable>
  <xsl:variable name="thumbnail-suffix">.gif</xsl:variable>


  <!-- ignore teiheader for now -->
  <xsl:template match="tei:teiHeader"/>

  <xsl:template match="tei:div">
    <div>
      <xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
     <xsl:apply-templates/>
    </div>    
  </xsl:template>

  <xsl:template match="tei:head">
    <p class="head"><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="tei:byline">
    <p class="byline"><xsl:apply-templates/></p>   
  </xsl:template>

  <xsl:template match="tei:dateline">
    <p class="dateline"><xsl:apply-templates/></p>   
  </xsl:template>

  <xsl:template match="tei:p|tei:sp">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="tei:lb">
    <br/>
  </xsl:template>

  <xsl:template match="tei:quote">
    <div class="quote"><xsl:apply-templates/></div>
  </xsl:template>

  <xsl:template match="tei:lg">
    <p class="lg"><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="tei:l">
    <xsl:apply-templates/><br/>
  </xsl:template>
  
  <xsl:template match="tei:title">
    <i><xsl:apply-templates/></i>
  </xsl:template>

  <xsl:template match="tei:list">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="tei:item">
    <li><xsl:apply-templates/></li>
  </xsl:template>

  <xsl:template match="tei:listBibl">
    <ul class="bibl">
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  
  <xsl:template match="tei:listBibl/tei:bibl">
    <li><xsl:apply-templates/></li>
  </xsl:template>

  <xsl:template match="tei:foreign">
    <i><xsl:apply-templates/></i>
  </xsl:template>

  <xsl:template match="tei:speaker">
    <b><xsl:apply-templates/></b>
  </xsl:template>

  <xsl:template match="tei:hi">
    <span>
      <xsl:choose>
        <xsl:when test="@rend">
          <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="class">hi</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates/>
    </span>
  </xsl:template>


<xsl:template match="tei:figure">
  <img>
    <xsl:attribute name="src"><xsl:value-of select="concat($figure-path, @entity, $figure-suffix)"/></xsl:attribute>
    <xsl:attribute name="alt"><xsl:value-of select="normalize-space(tei:figDesc)"/></xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="normalize-space(tei:figDesc)"/></xsl:attribute>
  </img>
</xsl:template>

</xsl:stylesheet>
