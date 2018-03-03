<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:db="http://docbook.org/ns/docbook"
		xmlns="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="db"
		version="1.0">

<!-- customize the imported stylesheets -->

<xsl:template name="slides.titlepage.recto">
  <xsl:comment> slides.titlepage.recto </xsl:comment>
  <xsl:comment> context: <xsl:value-of select="local-name()"/> </xsl:comment>
  <div class="blanktop"/>
  <div class="titles">
    <h1 class="slideshowtitle">
      <xsl:call-template name="get.title"/>
    </h1>
    <!--
    <h2 class="slideshowsubtitle">
      <xsl:call-template name="get.subtitle"/>
      </h2>
    -->
  </div>
</xsl:template>

<xsl:template name="slides.titlepage.verso">
  <xsl:comment> slides.titlepage.verso </xsl:comment>
  <xsl:comment> context: <xsl:value-of select="local-name()"/> </xsl:comment>
  <div class="attribution">
    <h3 class="author">
      <xsl:value-of select="db:info/db:author/db:personname/db:firstname"/>
      <xsl:call-template name="gentext.space"/>
      <xsl:value-of select="db:info/db:author/db:personname/db:surname"/>
      <xsl:call-template name="gentext.space"/>
      <xsl:value-of select="db:info/db:author/db:affiliation/db:orgname"/>
    </h3>
  </div>
  <div class="publication"/>
  <div class="conference">
    <h4>
      <xsl:value-of select="db:info/db:confgroup/db:confsponsor"/>
      <br/>
      <xsl:value-of select="db:info/db:confgroup/db:conftitle"/>
      <br/>
      <xsl:value-of select="db:info/db:confgroup/db:confdates"/>
    </h4>
  </div>
</xsl:template>

<xsl:template name="slides.titlepage.before.recto">
  <xsl:comment> slides.titlepage.before.recto </xsl:comment>
  <xsl:if test="$user.cover.logo">
    <div class="cover-logo">
      <img id="cover-logo" alt="cover image">
	<xsl:attribute name="src">
	  <xsl:value-of select="$user.cover.logo"/>
	</xsl:attribute>
      </img>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template name="slides.titlepage.before.verso">
  <xsl:comment> slides.titlepage.before.verso </xsl:comment>
  <div class="publication"/>
</xsl:template>

<xsl:template name="slideshow.head">
  <div class="background">
    <xsl:if test="$user.head.logo">
      <img id="head-logo" alt="logo">
	<xsl:attribute name="src">
	  <xsl:value-of select="$user.head.logo"/>
	</xsl:attribute>
      </img>
    </xsl:if>
  </div>
</xsl:template>

</xsl:stylesheet>
