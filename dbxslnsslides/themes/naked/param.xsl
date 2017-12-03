<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<!-- docbook-xsl-ns slides defaults from param.xsl
    <xsl:param name="disable.collapsible">0</xsl:param>
    <xsl:param name="disable.incremental">0</xsl:param>
    <xsl:param name="generate.copyright">1</xsl:param>
    <xsl:param name="generate.foilgroup.numbered.toc">1</xsl:param>
    <xsl:param name="generate.foilgroup.toc">1</xsl:param>
    <xsl:param name="generate.handoutnotes">0</xsl:param>
    <xsl:param name="generate.pubdate">1</xsl:param>
    <xsl:param name="generate.speakernotes">0</xsl:param>
    <xsl:param name="generate.titlepage">1</xsl:param>
    <xsl:param name="mml.embedding.mode">inline</xsl:param>
    <xsl:param name="svg.embedding.mode">object</xsl:param>
    <xsl:param name="user.css">user.css</xsl:param>
    <xsl:param name="wrap.slidecontent">0</xsl:param>
    <xsl:param name="s5.controls">0</xsl:param>
    <xsl:param name="s5.defaultview">slideshow</xsl:param>
    <xsl:param name="s5.opera.css">opera.css</xsl:param>
    <xsl:param name="s5.outline.css">outline.css</xsl:param>
    <xsl:param name="s5.path.prefix">files/s5/ui/default/</xsl:param>
    <xsl:param name="s5.print.css">print.css</xsl:param>
    <xsl:param name="s5.slides.css">slides.css</xsl:param>
    <xsl:param name="s5.slides.js">slides.js</xsl:param>
    <xsl:param name="slidy.duration">0</xsl:param>
    <xsl:param name="slidy.path.prefix">files/slidy/</xsl:param>
    <xsl:param name="slidy.slidy.css">styles/slidy.css</xsl:param>
    <xsl:param name="slidy.slidy.js">scripts/slidy.js</xsl:param>
    <xsl:param name="slidy.user.css">styles/w3c-blue.css</xsl:param>
-->
<!-- override default params here -->
    <xsl:param name="generate.copyright">0</xsl:param>
    <xsl:param name="slidy.user.css"/>
    <xsl:param name="user.css">themes/naked/theme.css</xsl:param>

<!-- local params -->
<!-- user.head.logo is displayed on all non-cover slides -->
    <xsl:param name="user.head.logo"/>
<!-- user.cover.logo is displayed on cover slide only -->
    <xsl:param name="user.cover.logo"/>

</xsl:stylesheet>
