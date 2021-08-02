<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="5.0"/>

  <xsl:param name="from"/>
  <xsl:param name="to"/>
  <xsl:param name="pair"/>
  <xsl:param name="antipair"/>
  <xsl:param name="version"/>
  <xsl:param name="invert"/>

  <xsl:template match="transfer|interchunk|postchunk|dictionary">
    <!-- lot of c/p from the jekyll outp  {{{ -->
    <html>
      <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <!-- Begin Jekyll SEO tag v2.5.0 -->
        <title>apertium-<xsl:value-of select="$pair"/>
             : Apertium-<xsl:value-of select="$pair"/> statistics
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
                statistics
              </h1>
              <p style="font-variant: italic">
                This statistic has been generated automatically from the XML
                dictionary data. It is intended for visualisation. Please find
                the machine-readable source codes in <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="'https://github.com/apertium/apertium-'"/>
                    <xsl:value-of select="$pair"/>
                  </xsl:attribute>
                  apertium repository for <xsl:value-of select="$pair"/>
                </a>.
              </p>
              <h2><code><xsl:value-of 
                    select="tokenize(base-uri(), '/')[last()]"/></code></h2>
              <xsl:apply-templates/>
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
              </a>
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
    <h3>Alphabet</h3>
    <p>
      There are
      <xsl:value-of select="string-length(.)"/>
      symbols in this dictionary
    </p>
  </xsl:template>
      
  <xsl:template match="sdefs">
    <h3>Tags (Multichar Symbols)</h3>
    <p>
      There are
      <xsl:value-of select="count(sdef)"/>
      symbols in this dictionary
    </p>
  </xsl:template>

  <xsl:template match="pardefs">
    <h3>Paradigms</h3>
    <p>
      There are
      <xsl:value-of select="count(pardef)"/>
      paradigms in this dictionary
    </p>
  </xsl:template>

  <xsl:template match="section">
    <h3>Dictionary <xsl:value-of select="@id"/></h3>
    <p>
      There are
      <xsl:value-of select="count(e)"/>
      words in the dictionary part <xsl:value-of select="@id"/>
    </p>
  </xsl:template>

  <xsl:template match="section-def-cats">
    <h3>Categories (parts of chunks)</h3>
    <p>
      There are
      <xsl:value-of select="count(def-cat)"/>
      cats in this ruleset
    </p>
  </xsl:template>


  <xsl:template match="section-def-attrs">
    <h3>Attributes</h3>
    <p>
      There are
      <xsl:value-of select="count(def-attr)"/>
      attrs in this ruleset
    </p>
  </xsl:template>


  <xsl:template match="section-def-macros">
    <h3>Macros</h3>
    <p>
      There are
      <xsl:value-of select="count(def-macro)"/>
      attrs in this ruleset
    </p>
  </xsl:template>

  <xsl:template match="section-rules">
    <h3>Rules</h3>
    <p>
      There are
      <xsl:value-of select="count(rule)"/>
      attrs in this ruleset
    </p>
  </xsl:template>


</xsl:stylesheet>
