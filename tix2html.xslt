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

  <xsl:template match="transfer|interchunk|postchunk">
    <!-- lot of c/p from the jekyll outp  {{{ -->
    <html>
      <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <!-- Begin Jekyll SEO tag v2.5.0 -->
        <title>
          apertium-<xsl:value-of select="$pair"/> :
          Apertium-<xsl:value-of select="$pair"/> bilingual rules and resources
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
        <script src="/apertium-fin-deu/assets/js/respond.js"></script>
        <!--[if lt IE 9]>
          <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <!--[if lt IE 8]>
        <link rel="stylesheet" href="/apertium-fin-deu/assets/css/ie.css">
        <![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
      </head>
      <body>
        <div id="header">
          <nav>
            <li class="fork">
              <a>
                <xsl:attribute name="href">https://github.com/apertium/apertium-<xsl:value-of select="$pair"/></xsl:attribute>
                  View On GitHub
              </a>
            </li>
          </nav>
        </div><!-- end header -->
        <div class="wrapper">
          <section>
            <div id="title">
              <h1>apertium-<xsl:value-of select="$pair"/></h1>
              <p>
                <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
                dictionary for rule-based machine translation
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
            <h1 id="rules">
              Apertium-<xsl:value-of select="$pair"/>:
              <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
              machine translation rules
            </h1>
            <p style="font-variant: italic">
              This is a visualisation of some rules in apertium transfer.
            </p>
            <xsl:apply-templates/>
          </section>
          <div id="footer">
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
      </body>
    </html>
  </xsl:template>

  <xsl:template match="section-def-cats">
    <h2>Categories (parts of chunks)</h2>
    <p>
      These are the categories Apertium is using in order to chunk, re-order
      and transfer lexemes.
    </p>
    <table>
      <thead>
        <tr>
          <th>Category</th>
          <th>Items</th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates/>
      </tbody>
    </table>
  </xsl:template>

  <xsl:template match="def-cat">
    <tr>
      <td><xsl:value-of select="@n"/></td>
      <td><ul><xsl:apply-templates/></ul></td>
    </tr>
  </xsl:template>

  <xsl:template match="cat-item">
    <li>
      <xsl:value-of select="@lemma"/>
      <code>&lt;<xsl:value-of select="@tags"/>&gt;</code>
    </li>
  </xsl:template>

  <xsl:template match="section-def-attrs">
    <h2>Attributes</h2>
    <p>
      These are the morphological analysis value (tag) sets that can be
      processed in the transfer.
    </p>
    <table>
      <thead>
        <tr>
          <th>Attribute set name</th>
          <th>Tags</th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates/>
      </tbody>
    </table>
  </xsl:template>

  <xsl:template match="def-attr">
    <tr>
      <td><xsl:value-of select="@n"/></td>
      <td><ul><xsl:apply-templates/></ul></td>
    </tr>
  </xsl:template>

  <xsl:template match="attr-item">
    <li>
      <code>&lt;<xsl:value-of select="@tags"/>&gt;</code>
    </li>
  </xsl:template>

  <xsl:template match="section-def-macros">
    <h2>Macros</h2>
    <p>Macros are helper functions in apertium transfer files.</p>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="def-macro">
    <h3><xsl:value-of select="@n"/></h3>
    <div>Parametres: <xsl:value-of select="@npar"/></div>
    <code><ol>
      <xsl:apply-templates/>
    </ol></code>
  </xsl:template>

  <xsl:template match="let">
    <li>
      let <xsl:apply-templates select="*[1]"/> ≔ <xsl:apply-templates
        select="*[2]"/>
    </li>
  </xsl:template>

  <xsl:template match="var">
    $<em><xsl:value-of select="@n"/></em><xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="concat">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="lit">
    "<xsl:value-of select="@v"/>"
  </xsl:template>

  <xsl:template match="lit-tag"
    >&lt;<xsl:value-of select="@v"/>&gt;</xsl:template>

  <xsl:template match="choose">
    <li><ol>
      <xsl:apply-templates/>
    </ol></li>
  </xsl:template>

  <xsl:template match="when[1]">
    <li>if <xsl:apply-templates select="test"/> then:<ol>
        <xsl:apply-templates select="let"/>
    </ol></li>
  </xsl:template>
  <xsl:template match="when[position()>1]">
    <li>elseif <xsl:apply-templates select="test"/> then:<ol>
        <xsl:apply-templates select="let"/>
    </ol></li>
  </xsl:template>

  <xsl:template match="otherwise">
    <li>else:<ol>
        <xsl:apply-templates/>
    </ol></li>
  </xsl:template>

  <xsl:template match="test">
    <li><ol>
        <xsl:apply-templates/>
    </ol></li>
  </xsl:template>

  <xsl:template match="equal">
    <li>
      <xsl:apply-templates select="clip|var"/> ≟ <xsl:apply-templates
        select="lit|lit-tag"/>
    </li>
  </xsl:template>

  <xsl:template match="clip">
    <em><xsl:value-of select="@side"/>[<xsl:value-of
        select="@pos"/>]['<xsl:value-of select="@part"/>']</em>
  </xsl:template>

  <xsl:template match="section-rules">
    <h2>Rules</h2>
    <p>The actual rules concerning stuff.</p>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="rule">
    <h3><xsl:value-of select="@comment"/></h3>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="pattern">
    <h4>Matching pattern:</h4>
    <ol>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>

  <xsl:template match="pattern-item">
    <li><xsl:value-of select="@n"/></li>
  </xsl:template>

  <xsl:template match="action">
    <h4>Action:</h4>
    <code><ol>
      <xsl:apply-templates/>
    </ol></code>
  </xsl:template>

  <xsl:template match="call-macro">
    <li><xsl:value-of select="@n"/>(<xsl:apply-templates/>)</li>
  </xsl:template>

  <xsl:template match="with-param[1]"
    >$<xsl:value-of select="@pos"/>
  </xsl:template>

  <xsl:template match="with-param[position()>1]"
    >$<xsl:value-of select="@pos"/>
  </xsl:template>

  <xsl:template match="out">
    <li>Output: <ol>
        <xsl:apply-templates/>
    </ol></li>
  </xsl:template>

  <xsl:template match="chunk">
    <li>
      [<ol><xsl:apply-templates select="b|lu"/></ol>]<sub><xsl:value-of
          select="@name"/><xsl:apply-templates select="tags"/></sub>
    </li>
  </xsl:template>

  <xsl:template match="tags">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tag">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="lu">
    <li><xsl:apply-templates/></li>
  </xsl:template>

  <xsl:template match="b">
    <li><sub>b<xsl:value-of select="@pos"/></sub><br/></li>
  </xsl:template>

</xsl:stylesheet>
