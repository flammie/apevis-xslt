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
          <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
          <meta name="viewport" content="width=device-width"/>
          <title>apertium-<xsl:value-of select="$pair"/> :
            Apertium-<xsl:value-of select="$pair"/> bilingual dictionary
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
      <a href="#а">а</a> |
      <a href="#б">б</a> |
      <a href="#в">в</a> |
      <a href="#г">г</a> |
      <a href="#д">д</a> |
      <a href="#е">е</a> |
      <a href="#ё">ё</a> |
      <a href="#ж">ж</a> |
      <a href="#з">з</a> |
      <a href="#и">и</a> |
      <a href="#і">і</a> |
      <a href="#й">й</a> |
      <a href="#к">к</a> |
      <a href="#л">л</a> |
      <a href="#м">м</a> |
      <a href="#н">н</a> |
      <a href="#о">о</a> |
      <a href="#ӧ">ӧ</a> |
      <a href="#п">п</a> |
      <a href="#р">р</a> |
      <a href="#с">с</a> |
      <a href="#т">т</a> |
      <a href="#у">у</a> |
      <a href="#ф">ф</a> |
      <a href="#х">х</a> |
      <a href="#ц">ц</a> |
      <a href="#ч">ч</a> |
      <a href="#ш">ш</a> |
      <a href="#щ">щ</a> |
      <a href="#ъ">ъ</a> |
      <a href="#ы">ы</a> |
      <a href="#ь">ь</a> |
      <a href="#э">э</a> |
      <a href="#ю">ю</a> |
      <a href="#я">я</a>
    </div>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'а'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'б'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'в'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'г'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'д'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'е'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ё'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ж'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'з'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'и'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'і'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'й'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'к'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'л'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'м'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'н'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'о'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ӧ'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'п'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'р'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'с'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'т'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'у'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ф'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'х'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ц'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ч'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ш'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'щ'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ъ'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ы'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ь'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'э'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'ю'"/>
    </xsl:call-template>
    <xsl:call-template name="dictionaryletter">
      <xsl:with-param name="letter" select="'я'"/>
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
