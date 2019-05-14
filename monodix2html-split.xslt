<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="5.0"/>

  <!-- name of the language (e.g. Finnish) -->
  <xsl:param name="language" required="yes"/>
  <!-- iso code (e.g. fin) -->
  <xsl:param name="langcode" required="yes"/>
  <!-- version (e.g. 0.0.1) -->
  <xsl:param name="version"/>
  <!-- prefix to show in this page (e.g. 'a') -->
  <xsl:param name="letter" required="yes"/>

  <xsl:template name="letterlink">
    <xsl:param name="l" required="yes"/>
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="'apertium-'"/>
        <xsl:value-of select="$langcode"/>
        <xsl:value-of select="'.'"/>
        <xsl:value-of select="$langcode"/>
        <xsl:value-of select="'.dix-'"/>
        <xsl:value-of select="$l"/>
        <xsl:value-of select="'.html#'"/>
        <xsl:value-of select="$l"/>
      </xsl:attribute>
      <xsl:value-of select="$l"/>
    </a>
  </xsl:template>

    <xsl:template match="dictionary">
    <!-- lot of c/p from the jekyll outp  {{{ -->
    <html>
      <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          apertium-<xsl:value-of select="$langcode"/> :
          monolingual dictionary (letter <xsl:value-of select="$letter"/>)
        </title>
        <meta name="description">
          <xsl:attribute name="content">
            <xsl:value-of select="$language"/>
            dictionary for rule-based machine translation
          </xsl:attribute>
        </meta>
        <link rel="canonical">
          <xsl:attribute name="href">
            http://apertium.github.io/apertium-<xsl:value-of select="$langcode"/>
          </xsl:attribute>
        </link>
        <link rel="stylesheet">
          <xsl:attribute name="href">
            <xsl:value-of select="'/apertium-'"/>
            <xsl:value-of select="$langcode"/>
            <xsl:value-of select="'/assets/css/style.css'"/>
          </xsl:attribute>
        </link>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"
          integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
          crossorigin="anonymous"></script>
        <script>
          <xsl:attribute name="src">/apertium-<xsl:value-of select="$langcode"/>/assets/js/respond.js</xsl:attribute>
        </script>
        <meta name="viewport" 
          content="width=device-width, initial-scale=1, user-scalable=no"/>
      </head>
      <body>
        <div id="header">
          <nav>
            <li class="fork">
              <a>
                <xsl:attribute name="href">https://github.com/apertium/apertium-<xsl:value-of select="$langcode"/></xsl:attribute>
                  View On GitHub
              </a>
            </li>
          </nav>
        </div><!-- end header -->
        <div class="wrapper">
          <section>

            <div id="title">
              <h1>apertium-<xsl:value-of select="$langcode"/></h1>
              <p>
                <xsl:value-of select="$language"/> monolingual data and
                morphological analyser-generator for apertium
              </p>
              <hr/>
              <span class="credits left">
                Project maintained by 
                <a href="https://github.com/apertium">apertium</a>
              </span>
              <span class="credits right">
                Hosted on GitHub Pages – Theme by
                <a href="https://twitter.com/michigangraham">mattgraham</a>
              </span>
            </div>
            <h1 id="dictionary">
              Apertium-<xsl:value-of select="$langcode"/>:
              <xsl:value-of select="$language"/> dictionary
              (letter <xsl:value-of select="$letter"/>)
            </h1>
            <p style="font-variant: italic">
              This page has been generated automatically from the XML
              dictionary data. It is intended for visualisation / overview. Please find
              the machine-readable source codes in <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="'https://github.com/apertium/apertium-'"/>
                  <xsl:value-of select="$langcode"/>
                </xsl:attribute>
                apertium repository for <xsl:value-of select="$language"/>
              </a>.
            </p>
            <h2>Alphabets</h2>
            <xsl:apply-templates select="alphabet"/>
            <h2>Apertium tags (for POS and MSD features)</h2>
            <xsl:apply-templates select="sdefs"/>
            <h2>Words</h2>
            <xsl:apply-templates select="section"/>
          </section>
          <div id="footer">
            Documentation for <a>
              <xsl:attribute name="href">
                <xsl:value-of select="'//github.com/apertium/apertium-'"/>
                <xsl:value-of select="$langcode"/>
                <xsl:value-of select="'/'"/>
              </xsl:attribute>
              apertium-<xsl:value-of select="$langcode"/>
            </a>.
              Generated with <a
                href="https://github.com/flammie/apevis-xslt">Flammie’s
                apevis-xslt</a>.
          </div>
        </div>
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
        <xsl:with-param name="l" select="'å'"/>
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
      <thead>
        <th>RL</th>
        <th><xsl:value-of select="$language"/></th>
        <th>Comments</th>
      </thead>
      <tbody>
        <xsl:apply-templates select="e[starts-with(p[1]/r[1], $letter)]|
          e[starts-with(p[1]/r[1], upper-case($letter))]|
          e[starts-with(i[1], upper-case($letter))]">
          <xsl:sort select="p[1]/r[1]" data-type="text"/>
        </xsl:apply-templates>
      </tbody>
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
    <td><xsl:apply-templates select="r"/></td>
  </xsl:template>

  <xsl:template match="i">
    <td><xsl:apply-templates/></td>
  </xsl:template>

  <xsl:template match="s">
    (<xsl:value-of select="@n"/>)
  </xsl:template>

  <xsl:template match="b">&#160;</xsl:template>

  <xsl:template match="j">
    <strong style="color: red">+++</strong>
  </xsl:template>

  <xsl:template match="re">
    <code><xsl:apply-templates/></code>
  </xsl:template>


</xsl:stylesheet>
