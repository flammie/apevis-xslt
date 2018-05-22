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
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta name="viewport" content="width=device-width"/>
        <title>
          apertium-<xsl:value-of select="$pair"/> :
          Apertium-<xsl:value-of select="$pair"/> bilingual rules and resources
        </title>
        <meta name="description">
          <xsl:attribute name="content">
            <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
            dictionary for rule-based machine translation
          </xsl:attribute>
        </meta>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet">
          <xsl:attribute name="href">
            <xsl:value-of select="'/apertium-'"/>
            <xsl:value-of select="$pair"/>
            <xsl:value-of select="'/css/main.css'"/>
          </xsl:attribute>
        </link>
        <link rel="stylesheet">
          <xsl:attribute name="href">
            <xsl:value-of select="'/apertium-'"/>
            <xsl:value-of select="$pair"/>
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
                    <xsl:value-of select="$pair"/>
                    <xsl:value-of select="'/'"/>
                  </xsl:attribute>
                  <xsl:value-of select="'apertium-'"/>
                  <xsl:value-of select="$pair"/>
                </a>
                <small>
                  <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
                  rules for machine translation
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
                      <xsl:value-of select="'statistics.html'"/>
                    </xsl:attribute>
                    Statistics
                  </a></li>
                  <li><a>
                    <xsl:attribute name="href">
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
              <h1 id="rules">
                Apertium-<xsl:value-of select="$pair"/>:
                <xsl:value-of select="$from"/>–<xsl:value-of select="$to"/>
                machine translation rules
              </h1>
              <p style="font-variant: italic">
                This is a visualisation of an apertium transfer system
              </p>
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
