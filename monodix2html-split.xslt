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
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta name="viewport" content="width=device-width"/>
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
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet">
          <xsl:attribute name="href">
            <xsl:value-of select="'/apertium-'"/>
            <xsl:value-of select="$langcode"/>
            <xsl:value-of select="'/css/main.css'"/>
          </xsl:attribute>
        </link>
        <link rel="stylesheet">
          <xsl:attribute name="href">
            <xsl:value-of select="'/apertium-'"/>
            <xsl:value-of select="$langcode"/>
            <xsl:value-of select="'/css/syntax.css'"/>
          </xsl:attribute>
        </link>
      </head>
      <body>
        <div class="container">
          <div class="row">
            <div id="header" class="col-sm-12">
              <h4>
                <a class="brand">
                  <xsl:attribute name="href">
                    <xsl:value-of select="'/apertium-'"/>
                    <xsl:value-of select="$langcode"/>
                    <xsl:value-of select="'/'"/>
                  </xsl:attribute>
                  <xsl:value-of select="'apertium-'"/>
                  <xsl:value-of select="$langcode"/>
                </a>
                <small>
                  <xsl:value-of select="$language"/>
                  dictionary for rule-based machine translation
                </small>
              </h4>
            </div>
          </div>
          <div class="row">
            <div id="navigation" class="col-sm-2">
              <nav>
                <ul class="nav nav-list">
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$langcode"/>
                    </xsl:attribute>
                    Home
                  </a></li>
                  <li><a class="external">
                    <xsl:attribute name="href">
                      <xsl:value-of select="'//github.com/apertium/apertium-'"/>
                      <xsl:value-of select="$langcode"/>
                      <xsl:value-of select="'/#readme'"/>
                    </xsl:attribute>
                    README
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$langcode"/>
                      <xsl:value-of select="'/statistics.html'"/>
                    </xsl:attribute>
                    Statistics
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$langcode"/>
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$langcode"/>
                      <xsl:value-of select="'.'"/>
                      <xsl:value-of select="$langcode"/>
                      <xsl:value-of select="'.dix.html'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$language"/> dictionary index
                    </a><ul>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'a'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'b'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'c'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'d'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'e'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'f'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'g'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'h'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'i'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'j'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'k'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'l'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'m'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'n'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'o'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'p'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'q'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'r'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'s'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'t'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'u'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'v'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'w'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'x'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'y'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'z'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'å'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'ä'"/>
                      </xsl:call-template></li>
                      <li><xsl:call-template name="letterlink">
                          <xsl:with-param name="l" select="'ö'"/>
                      </xsl:call-template></li>
                    </ul>
                  </li>
                </ul>
              </nav>
            </div>
            <div id="content" class="col-sm-10">
              <h1 id="dictionary">
                Apertium-<xsl:value-of select="$langcode"/>:
                <xsl:value-of select="$language"/> dictionary
                (letter <xsl:value-of select="$letter"/>)
              </h1>
              <p style="font-variant: italic">
                This dictionary has been generated automatically from the XML
                dictionary data. It is intended for visualisation. Please find
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
            </div>
          </div>
          <div class="row">
            <div id="footer" class="col-sm-12">
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
