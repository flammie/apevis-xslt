<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>

  <xsl:param name="from"/>
  <xsl:param name="to"/>
  <xsl:param name="pair"/>
  <xsl:param name="antipair"/>
  <xsl:param name="version"/>
  <xsl:param name="invert"/>

  <xsl:template match="transfer|interchunk|postchunk|dictionary">
# Apertium-<xsl:value-of select="$pair"/>: <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/> statistics
  
This statistic has been generated automatically from the XML dictionary data. 
It is intended for visualisation. Please find the machine-readable source codes
in [apertium repository for <xsl:value-of select="$pair"/>](https://github.com/apertium/apertium-<xsl:value-of select="$pair"/>/).

## `<xsl:value-of select="tokenize(base-uri(), '/')[last()]"/>`

<xsl:apply-templates/>

- - -

Documentation for [apertium-<xsl:value-of select="$pair"/>](//github.com/apertium/apertium-<xsl:value-of select="$pair"/>/).
Generated with [Flammie’s apevis-xslt](https://github.com/flammie/apevis-xslt).
  </xsl:template>

  <xsl:template match="alphabet">
### Alphabet
    
There are <xsl:value-of select="string-length(.)"/> symbols in this dictionary.
  </xsl:template>
      
  <xsl:template match="sdefs">
### Tags (Multichar Symbols)
    
There are <xsl:value-of select="count(sdef)"/> symbols in this dictionary.
  </xsl:template>

  <xsl:template match="pardefs">
### Paradigms

There are <xsl:value-of select="count(pardef)"/> paradigms in this dictionary.
  </xsl:template>

  <xsl:template match="section">
### Dictionary <xsl:value-of select="@id"/> <xsl:value-of select="@type"/>

There are <xsl:value-of select="count(e)"/> words in the dictionary part
<xsl:value-of select="@id"/>.
  </xsl:template>

  <xsl:template match="section-def-cats">
### Categories (parts of chunks)

There are <xsl:value-of select="count(def-cat)"/> cats in this ruleset.
  </xsl:template>


  <xsl:template match="section-def-attrs">
### Attributes

There are <xsl:value-of select="count(def-attr)"/>  attrs in this ruleset.
  </xsl:template>


  <xsl:template match="section-def-macros">
### Macros

There are <xsl:value-of select="count(def-macro)"/> attrs in this ruleset.
  </xsl:template>

  <xsl:template match="section-rules">
### Rules

There are <xsl:value-of select="count(rule)"/> attrs in this ruleset.
  </xsl:template>


</xsl:stylesheet>
