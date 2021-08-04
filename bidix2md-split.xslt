<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>

  <!-- language 1 name (e.g. Finnish)-->
  <xsl:param name="from" required="yes"/>
  <!-- language 2 name (e.g. German) -->
  <xsl:param name="to" required="yes"/>
  <!-- iso code pair (e.g. fin-deu) -->
  <xsl:param name="pair" required="yes"/>
  <!-- iso code pair reversed (e.g. deu-fin) -->
  <xsl:param name="antipair" required="yes"/>
  <!-- vesion (e.g. 0.0.1) -->
  <xsl:param name="version"/>
  <!-- to generate dictionary right to left -->
  <xsl:param name="invert"/>
  <!-- prefix to show on this page (e.g. 'a') -->
  <xsl:param name="letter"/>

    <xsl:template match="dictionary">
# apertium-<xsl:value-of select="$pair"/>: Apertium-<xsl:value-of select="$pair"/> bilingual dictionary for rule-based machine translation (for letter <xsl:value-of select="$letter"/>)
  
This dictionary has been generated automatically from the XML dictionary data.
It is intended for visualisation. Please find the machine-readable source codes
in [apertium repository for
<xsl:value-of select="$pair"/>](https://github.com/apertium/apertium-<xsl:value-of select="$pair"/>)

## Alphabets

<xsl:apply-templates select="alphabet"/>

##Apertium tags (for POS and MSD features)

<xsl:apply-templates select="sdefs"/>

## Words

Words below are split by apertium dictionary sections and sorted by
alphabetical order.

<xsl:apply-templates select="section"/>

- - -

Documentation for
[apertium-<xsl:value-of select="$pair"/>](//github.com/apertium/apertium-<xsl:value-of select="$pair"/>/
Generated with [Flammie’s apevis-xslt](https://github.com/flammie/apevis-xslt/).
  </xsl:template>

  <xsl:template match="alphabet">
Apertium will use following letters as alphabets in its tokenisation:

<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="sdefs">

| Symbol | Comment |
|:------:|:--------|
<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="sdef">| `&lt;<xsl:value-of select="@n"/>&gt;` | <xsl:value-of select="@c"/> |<xsl:text>&#xa;</xsl:text></xsl:template>

  <xsl:template match="section">

### <xsl:value-of select="@type"/>

    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="$letter"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="dictionaryletter">
    <xsl:param name="letter"/>

#### <xsl:value-of select="$letter"/> or <xsl:value-of select="upper-case($letter)"/>

<xsl:text>&#xa;</xsl:text>

      <xsl:choose>
        <xsl:when test="$invert='true'">
| RL  | <xsl:value-of select="$to"/> | C | <xsl:value-of select="$from"/> | C | Comments |
|:---:|:-------|:-----|:-----|:-----|:-------|
<xsl:apply-templates select="e[starts-with(p[1]/r[1], $letter)]|
              e[starts-with(p[1]/r[1], upper-case($letter))]|
              e[starts-with(i[1], upper-case($letter))]">
              <xsl:sort select="p[1]/r[1]" data-type="text"/>
</xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
| RL  | <xsl:value-of select="$from"/> | C | <xsl:value-of select="$to"/> | C | Comments |
|:---:|:-------|:-----|:-----|:-----|:-------|
<xsl:apply-templates select="e[starts-with(p[1]/l[1], $letter)]|
                e[starts-with(p[1]/l[1], upper-case($letter))]|
                e[starts-with(i[1], upper-case($letter))]">
              <xsl:sort select="p[1]/l[1]" data-type="text"/>
</xsl:apply-templates>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:template>



  <xsl:template match="e">| <xsl:value-of select="@r"/> <xsl:value-of select="@vr"/> <xsl:value-of select="@vl"/><xsl:text> </xsl:text> <xsl:apply-templates/> <xsl:value-of select="@c"/> |
</xsl:template>

  <xsl:template match="p"><xsl:choose>
      <xsl:when test="$invert='true'">| <xsl:apply-templates select="r"/> | <xsl:apply-templates select="r/@c"/> | <xsl:apply-templates select="l"/> | <xsl:apply-templates select="l/@c"/> |</xsl:when>
      <xsl:otherwise>| <xsl:apply-templates select="l"/> | <xsl:apply-templates select="l/@c"/> | <xsl:apply-templates select="r"/> | <xsl:apply-templates select="r/@c"/> |</xsl:otherwise>
    </xsl:choose></xsl:template>

  <xsl:template match="i">| <xsl:apply-templates/> | ... | <xsl:apply-templates/> | ... |</xsl:template>

  <xsl:template match="s">`&lt;<xsl:value-of select="@n"/>&gt;`</xsl:template>

  <xsl:template match="b">&#160;</xsl:template>

  <xsl:template match="j">**J??**</xsl:template>

  <xsl:template match="re">| `<xsl:apply-templates/>` |</xsl:template>


</xsl:stylesheet>
