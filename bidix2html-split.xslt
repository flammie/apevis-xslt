<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="5.0"/>

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
  <!-- prefix to show in this page (e.g. 'a') -->
  <xsl:param name="letter" required="yes"/>

  <xsl:template name="letterlink">
    <xsl:param name="l" required="yes"/>
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="'apertium-'"/>
        <xsl:value-of select="$pair"/>
        <xsl:value-of select="'.'"/>
        <xsl:value-of select="$pair"/>
        <xsl:value-of select="'.dix-'"/>
        <xsl:value-of select="$l"/>
        <xsl:value-of select="'.html#'"/>
        <xsl:value-of select="$l"/>
      </xsl:attribute>
      <xsl:value-of select="$l"/>
    </a>
  </xsl:template>

  <xsl:template name="letterlinkrev">
    <xsl:param name="l" required="yes"/>
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="'apertium-'"/>
        <xsl:value-of select="$pair"/>
        <xsl:value-of select="'.'"/>
        <xsl:value-of select="$antipair"/>
        <xsl:value-of select="'.dix-'"/>
        <xsl:value-of select="$l"/>
        <xsl:value-of select="'.html#'"/>
        <xsl:value-of select="$l"/>
      </xsl:attribute>
      <xsl:value-of select="$l"/>
    </a>
  </xsl:template>


  <xsl:template match="dictionary">
    <html>
      <head>
        <meta charset="utf-8"/>
        <title>
          apertium-<xsl:value-of select="$pair"/> :
          Apertium-<xsl:value-of select="$pair"/> bilingual dictionary
          (letter <xsl:value-of select="$letter"/>)
        </title>
        <meta name="generator" content="apevis-xslt"/>
        <meta property="og:title">
          <xsl:attribute name="content">
            apertium-<xsl:value-of select="$pair"/>
          </xsl:attribute>
        </meta>
        <meta property="og:locale" content="en"/>
        <meta name="description">
          <xsl:attribute name="content">
            <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
            dictionary for rule-based machine translation
          </xsl:attribute>
        </meta>
        <link rel="canonical">
          <xsl:attribute name="href">
            https://apertium.github.io/apertium-<xsl:value-of select="$pair"/>/
          </xsl:attribute>
        </link>
        <meta property="og:url">
          <xsl:attribute name="content">
            https://apertium.github.io/apertium-<xsl:value-of select="$pair"/>/
          </xsl:attribute>
        </meta>
        <meta property="og:site_name">
          <xsl:attribute name="content">
            apertium-<xsl:value-of select="$pair"/>
          </xsl:attribute>
        </meta>
        <script type="application/ld+json">
          {"headline":"Apertium-<xsl:value-of select="$pair"/>",
          "@type":"WebSite",
          "url":"http://apertium.github.io/apertium-<xsl:value-of select="$pair"/>/",
          "name":"apertium-<xsl:value-of select="$pair"/>",
          "description":"Apertium bilingual data for <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/> machine translation",
          "@context":"http://schema.org"}
        </script>
      </head>
      <body>
        <nav>
          <li class="fork">
            <a>
              <xsl:attribute name="href">https://github.com/apertium/apertium-<xsl:value-of select="$pair"/></xsl:attribute>
                View On GitHub
            </a>
          </li>
        </nav>
        <h1 id="dictionary">
          Apertium-<xsl:value-of select="$pair"/>:
          <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
          bilingual dictionary (letter <xsl:value-of select="$letter"/>)
        </h1>
        <p style="font-variant: italic">
          This page has been generated automatically from the XML
          dictionary data. It is intended for visualisation. Please find
          the machine-readable source codes in <a>
            <xsl:attribute name="href">
              <xsl:value-of select="'https://github.com/apertium/apertium-'"/>
              <xsl:value-of select="$pair"/>
            </xsl:attribute>
            apertium repository for <xsl:value-of select="$pair"/>
          </a>.
        </p>
        <h2>Alphabets</h2>
        <xsl:apply-templates select="alphabet"/>
        <h2>Apertium tags (for POS and MSD features)</h2>
        <xsl:apply-templates select="sdefs"/>
        <h2>Words</h2>
        <xsl:apply-templates select="section"/>
        <hr title="metadata starts"/>
        Documentation for <a>
          <xsl:attribute name="href">
            <xsl:value-of select="'//github.com/apertium/apertium-'"/>
            <xsl:value-of select="$pair"/>
            <xsl:value-of select="'/'"/>
          </xsl:attribute>
          apertium-<xsl:value-of select="$pair"/>
        </a>
        Generated with <a
            href="https://github.com/flammie/apevis-xslt">Flammie’s
            apevis-xslt</a>.
      </body>
    </html>
  </xsl:template>

  <xsl:template match="alphabet">
    <p>Apertium will use following letters as alphabets in its tokenisation:</p>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="sdefs">
    <table>
      <thead>
        <tr>
          <th>Symbol</th>
          <th>Comment</th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates/>
      </tbody>
    </table>
  </xsl:template>

  <xsl:template match="sdef">
    <tr>
      <td><code>&lt;<xsl:value-of select="@n"/>&gt;</code></td>
      <td><xsl:value-of select="@c"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="section">
    <h3>
      <xsl:attribute name="id">
        <xsl:value-of select="@type"/>
      </xsl:attribute>
      <xsl:value-of select="@type"/>
    </h3>
    <div id="letternavi">
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'a'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'b'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'c'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'d'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'e'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'f'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'g'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'h'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'i'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'j'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'k'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'l'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'m'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'n'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'o'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'p'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'q'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'r'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'s'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'t'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'u'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'v'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'w'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'x'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'y'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'z'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'ä'"/>
      </xsl:call-template> |
      <xsl:call-template name="letterlink">
        <xsl:with-param name="l" select="'ö'"/>
      </xsl:call-template>

    </div>

    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="$letter"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="dictionaryletter">
    <xsl:param name="letter"/>
    <h4>
      <xsl:attribute name="id">
        <xsl:value-of select="$letter"/>
      </xsl:attribute>
      <xsl:value-of select="$letter"/> or
      <xsl:value-of select="upper-case($letter)"/>
    </h4>
    <table>
      <xsl:choose>
        <xsl:when test="$invert='true'">
          <thead>
            <th>RL</th>
            <th><xsl:value-of select="$to"/></th>
            <th>C</th>
            <th><xsl:value-of select="$from"/></th>
            <th>C</th>
            <th>Comments</th>
          </thead>
          <tbody>
            <xsl:apply-templates select="e[starts-with(p[1]/r[1], $letter)]|
              e[starts-with(p[1]/r[1], upper-case($letter))]|
              e[starts-with(i[1], upper-case($letter))]">
              <xsl:sort select="p[1]/r[1]" data-type="text"/>
            </xsl:apply-templates>
          </tbody>
        </xsl:when>
        <xsl:otherwise>
          <thead>
            <th>RL</th>
            <th><xsl:value-of select="$from"/></th>
            <th>C</th>
            <th><xsl:value-of select="$to"/></th>
            <th>C</th>
            <th>Comments</th>
          </thead>
          <tbody>
            <xsl:apply-templates select="e[starts-with(p[1]/l[1], $letter)]|
                e[starts-with(p[1]/l[1], upper-case($letter))]|
                e[starts-with(i[1], upper-case($letter))]">
              <xsl:sort select="p[1]/l[1]" data-type="text"/>
            </xsl:apply-templates>
          </tbody>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:template>



  <xsl:template match="e">
    <tr>
      <td><em><xsl:value-of select="@r"/></em></td>
      <xsl:apply-templates/>
      <td><xsl:value-of select="@c"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="p">
    <xsl:choose>
      <xsl:when test="$invert='true'">
        <td><xsl:apply-templates select="r"/></td>
        <td><xsl:apply-templates select="r/@c"/></td>
        <td><xsl:apply-templates select="l"/></td>
        <td><xsl:apply-templates select="l/@c"/></td>
      </xsl:when>
      <xsl:otherwise>
        <td><xsl:apply-templates select="l"/></td>
        <td><xsl:apply-templates select="l/@c"/></td>
        <td><xsl:apply-templates select="r"/></td>
        <td><xsl:apply-templates select="r/@c"/></td>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="i">
    <td colspan="4"><xsl:apply-templates/></td>
  </xsl:template>

  <xsl:template match="s">
    (<xsl:value-of select="@n"/>)
  </xsl:template>

  <xsl:template match="b">&#160;</xsl:template>

  <xsl:template match="j">
    <strong style="color: red">+++</strong>
  </xsl:template>

  <xsl:template match="re">
    <!-- XXX: this would generate before td
         Reg.Ex: <xsl:apply-templates/>
         -->
  </xsl:template>


</xsl:stylesheet>
