<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>

  <!-- name of the language (e.g. Finnish) -->
  <xsl:param name="language" required="yes"/>
  <!-- iso code (e.g. fin) -->
  <xsl:param name="langcode" required="yes"/>
  <!-- version (e.g. 0.0.1) -->
  <xsl:param name="version"/>
  <!-- prefix to show in this page (e.g. 'a') -->
  <xsl:param name="letter" required="yes"/>


  <xsl:template match="dictionary">
# apertium-<xsl:value-of select="$langcode"/>: <xsl:value-of select="$language"/> monolingual dictionary for rule-based machine translation (letter <xsl:value-of select="$letter"/>)

This dictionary has been generated automatically from the XML dictionary data.
It is intended for visualisation. Please find the machine-readable source codes
in [apertium repository for 
<xsl:value-of select="$language"/>](https://github.com/apertium/apertium-<xsl:value-of select="$langcode"/>/).

## Alphabets

<xsl:apply-templates select="alphabet"/>

## Apertium tags (for POS and MSD features)

<xsl:apply-templates select="sdefs"/>

## Words

Words below are split by apertium dictionary sections and sorted in
alphabetical order.

<xsl:apply-templates select="section"/>

- - -

Documentation for 
[apertium-<xsl:value-of select="$langcode"/>](//github.com/apertium/apertium-<xsl:value-of select="$langcode"/>/).
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

    ### <xsl:value-of select="@type"/><xsl:text> </xsl:text><xsl:value-of select="@id"/>

    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="$letter"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="dictionaryletter">
    <xsl:param name="letter"/>
    
#### <xsl:value-of select="$letter"/> or <xsl:value-of select="upper-case($letter)"/>

| RL | <xsl:value-of select="$language"/> | Paradigm | Comments |
<xsl:apply-templates select="e[starts-with(p[1]/r[1], $letter)]|
          e[starts-with(p[1]/r[1], upper-case($letter))]|
          e[starts-with(i[1], upper-case($letter))]">
          <xsl:sort select="p[1]/r[1]" data-type="text"/>
</xsl:apply-templates>
  </xsl:template>



  <xsl:template match="e">| <xsl:value-of select="@r"/><xsl:text> </xsl:text> <xsl:apply-templates/> | <xsl:value-of select="@c"/> |
</xsl:template>

  <xsl:template match="p">| <xsl:apply-templates select="r"/> |</xsl:template>

  <xsl:template match="i">| <xsl:apply-templates/> |</xsl:template>

  <xsl:template match="par"> `<xsl:value-of select="@n"/>` </xsl:template>

  <xsl:template match="s">`&lt;<xsl:value-of select="@n"/>&gt;`</xsl:template>

  <xsl:template match="b">&#160;</xsl:template>

  <xsl:template match="j">**J??**</xsl:template>

  <xsl:template match="re">| `<xsl:apply-templates/>` |</xsl:template>


</xsl:stylesheet>
