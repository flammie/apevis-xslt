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

    <xsl:template match="dictionary">
    <!-- lot of c/p from the jekyll outp  {{{ -->
    <html>
      <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <!-- Begin Jekyll SEO tag v2.5.0 -->
        <title>
          apertium-<xsl:value-of select="$pair"/> :
          Apertium-<xsl:value-of select="$pair"/> bilingual dictionary
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
        <!-- End Jekyll SEO tag -->
        <link rel="stylesheet">
          <xsl:attribute name="href">/apertium-<xsl:value-of select="$pair"/>/assets/css/style.css?v=0553eb4429e442aa5eeaa159606840983213fbbe</xsl:attribute>
        </link>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
        <script>
          <xsl:attribute name="src">/apertium-<xsl:value-of select="$pair"/>/assets/js/respond.js</xsl:attribute>
        </script>
        <!--[if lt IE 9]>
          <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <!--[if lt IE 8]>
        <link rel="stylesheet" href="/apertium-fin-deu/assets/css/ie.css">
        <![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
      </head>
      <body>
        <div class="container">
          <div class="row">
            <div id="header" class="col-sm-12">
              <h4>
                <a class="brand">
                  <xsl:attribute name="href">
                    <xsl:value-of select="'/apertium-'"/>
                    <xsl:value-of select="$pair"/>
                    <xsl:value-of select="'/'"/>
                  </xsl:attribute>
                  <xsl:value-of select="'apertium-'"/>
                  <xsl:value-of select="$pair"/>
                </a>
                <small>
                  <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
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
                      <xsl:value-of select="$pair"/>
                    </xsl:attribute>
                    Home
                  </a></li>
                  <li><a class="external">
                    <xsl:attribute name="href">
                      <xsl:value-of select="'//github.com/apertium/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/#readme'"/>
                    </xsl:attribute>
                    README
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/statistics.html'"/>
                    </xsl:attribute>
                    Statistics
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.dix.html'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
                    dictionary
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.t1x.html'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
                    chunking rules (t1x)
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.t2x.html'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
                    re-ordering rules (t2x)
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.t3x.html'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
                    t3x rules
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.'"/>
                      <xsl:value-of select="$antipair"/>
                      <xsl:value-of select="'.dix.html'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$to"/>–<xsl:value-of select="$from"/>
                    dictionary
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.'"/>
                      <xsl:value-of select="$antipair"/>
                      <xsl:value-of select="'.t1x.html'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$to"/>–<xsl:value-of select="$from"/>
                    chunking rules (t1x)
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.'"/>
                      <xsl:value-of select="$antipair"/>
                      <xsl:value-of select="'.t2x.html'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$to"/>–<xsl:value-of select="$from"/>
                    re-ordering rules (t2x)
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'/apertium-'"/>
                      <xsl:value-of select="$pair"/>
                      <xsl:value-of select="'.'"/>
                      <xsl:value-of select="$antipair"/>
                      <xsl:value-of select="'.t3x.html'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$to"/>–<xsl:value-of select="$from"/>
                    t3x rules
                  </a></li>
                </ul>
              </nav>
            </div>
            <div id="content" class="col-sm-10">
              <h1 id="dictionary">
                Apertium-<xsl:value-of select="$pair"/>:
                <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
                bilingual dictionary
              </h1>
              <p style="font-variant: italic">
                This dictionary has been generated automatically from the XML
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
            </div>
          </div>
          <div class="row">
            <div id="footer" class="col-sm-12">
              Documentation for <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="'//github.com/apertium/apertium-'"/>
                  <xsl:value-of select="$pair"/>
                  <xsl:value-of select="'/'"/>
                </xsl:attribute>
                apertium-<xsl:value-of select="$pair"/>
                Generated with <a
                  href="https://github.com/flammie/apevis-xslt">Flammie’s
                  apevis-xslt</a>.
              </a>
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
      <a href="#a">a</a> |
      <a href="#b">b</a> |
      <a href="#c">c</a> |
      <a href="#d">d</a> |
      <a href="#e">e</a> |
      <a href="#f">f</a> |
      <a href="#g">g</a> |
      <a href="#h">h</a> |
      <a href="#i">i</a> |
      <a href="#j">j</a> |
      <a href="#k">k</a> |
      <a href="#l">l</a> |
      <a href="#m">m</a> |
      <a href="#n">n</a> |
      <a href="#o">o</a> |
      <a href="#p">p</a> |
      <a href="#q">q</a> |
      <a href="#r">r</a> |
      <a href="#s">s</a> |
      <a href="#t">t</a> |
      <a href="#u">u</a> |
      <a href="#v">v</a> |
      <a href="#w">w</a> |
      <a href="#x">x</a> |
      <a href="#y">y</a> |
      <a href="#z">z</a> |
      <a href="#ä">ä</a> |
      <a href="#ö">ö</a>
    </div>

    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'a'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'b'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'c'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'d'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'e'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'f'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'g'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'h'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'i'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'j'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'k'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'l'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'m'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'n'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'o'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'p'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'q'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'r'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'s'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'t'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'u'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'v'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'w'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'x'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'y'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'z'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ä'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ö'"/>
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
