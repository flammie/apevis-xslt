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

  <xsl:template match="transfer|interchunk|postchunk">
# apertium-<xsl:value-of select="$pair"/>: <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/> rules for rule-based machine translation

This is a visualisation of some rules in apertium transfer.

<xsl:apply-templates/>

- - -

Documentation for [apertium-<xsl:value-of select="$pair"/>](//github.com/apertium/apertium-<xsl:value-of select="$pair"/>/).
Generated with [Flammie’s apevis-xslt](https://github.com/flammie/apevis-xslt).
  </xsl:template>

  <xsl:template match="section-def-cats">
## Categories (parts of chunks)
   
These are the categories Apertium is using in order to chunk, re-order and
transfer lexemes.
    
| Category | Items |
|:---------|:------|
<xsl:apply-templates/>
  
  </xsl:template>

  <xsl:template match="def-cat">| <xsl:value-of select="@n"/> | <xsl:apply-templates/> |<xsl:text>&#xa;</xsl:text></xsl:template>

  <xsl:template match="cat-item"><xsl:value-of select="@lemma"/> `&lt;<xsl:value-of select="@tags"/>&gt;`<xsl:text> </xsl:text></xsl:template>

  <xsl:template match="section-def-attrs">
    
## Attributes

These are the morphological analysis value (tag) sets that can be processed in
the transfer.

| Attribute set name | Tags |
|:-------------------|:-----|
<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="def-attr">| <xsl:value-of select="@n"/> | <xsl:apply-templates/> |<xsl:text>&#xa;</xsl:text></xsl:template>

  <xsl:template match="attr-item">`&lt;<xsl:value-of select="@tags"/>&gt;`<xsl:text> </xsl:text></xsl:template>

  <xsl:template match="section-def-macros">
    
## Macros

Macros are helper functions in apertium transfer files.

<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="def-macro">

### <xsl:value-of select="@n"/>

Parametres: <xsl:value-of select="@npar"/>
<xsl:text>&#xa;&#xa;</xsl:text>
<xsl:apply-templates/>

  </xsl:template>

  <xsl:template match="let">1. **let** <xsl:apply-templates select="*[1]"/> ≔ <xsl:apply-templates select="*[2]"/></xsl:template>

  <xsl:template match="var">`$<xsl:value-of select="@n"/>`<xsl:apply-templates/></xsl:template>

  <xsl:template match="concat"><xsl:apply-templates/></xsl:template>

  <xsl:template match="lit">"<xsl:value-of select="@v"/>"</xsl:template>

  <xsl:template match="lit-tag">`&lt;<xsl:value-of select="@v"/>&gt;`</xsl:template>

  <xsl:template match="choose">
  <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="when[1]">
1. **if** <xsl:apply-templates select="test"/> **then**:
  <xsl:apply-templates select="let"/>
  </xsl:template>
  <xsl:template match="when[position()>1]">
1. **elseif** <xsl:apply-templates select="test"/> **then**:
  <xsl:apply-templates select="let"/>
  </xsl:template>

  <xsl:template match="otherwise">
1. **else**:
  <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="test"><xsl:apply-templates/></xsl:template>

  <xsl:template match="equal"><xsl:apply-templates select="clip|var"/> ≟ <xsl:apply-templates select="lit|lit-tag"/></xsl:template>

  <xsl:template match="clip">`<xsl:value-of select="@side"/>[<xsl:value-of
  select="@pos"/>]['<xsl:value-of select="@part"/>']`<xsl:text> </xsl:text></xsl:template>

  <xsl:template match="section-rules">

## Rules
    
The actual rules concerning stuff.

<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="rule">

### <xsl:value-of select="@comment"/>

<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="pattern">
    
#### Matching pattern:
    
<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="pattern-item">
1. <xsl:value-of select="@n"/>
  </xsl:template>

  <xsl:template match="action">

#### Action:
    
<xsl:apply-templates/>

  </xsl:template>

  <xsl:template match="call-macro">
1. <xsl:value-of select="@n"/>(<xsl:apply-templates/>)</xsl:template>

  <xsl:template match="with-param[1]"
    >$<xsl:value-of select="@pos"/></xsl:template>

  <xsl:template match="with-param[position()>1]"
    >, $<xsl:value-of select="@pos"/></xsl:template>

  <xsl:template match="out">
1. Output: 
  <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="chunk">1. <xsl:value-of select="@name"/>`<xsl:apply-templates select="tags"/>`
    <xsl:apply-templates select="b|lu"/>
  </xsl:template>

  <xsl:template match="tags">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tag">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="lu">1. <xsl:apply-templates/><xsl:text>&#xa;    </xsl:text></xsl:template>

  <xsl:template match="b">1. `blank`<xsl:value-of select="@pos"/><xsl:text>&#xa;    </xsl:text></xsl:template>

</xsl:stylesheet>
