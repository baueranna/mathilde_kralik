<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="2.0">
    
   <!-- Output HTML -->
   <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes" />
    
    <!-- General template -->
    <xsl:template match="/tei:TEI">
        <html lang="de">
            <head>
                <title>
                    <xsl:value-of select="//tei:teiHeader//tei:titleStmt//tei:title[@type='main']">
                    </xsl:value-of>
                </title>
                
                <link rel="stylesheet" type="text/css" href="../css/totenzettel.css" />
                <link rel="stylesheet" type="text/css" href="../css/menu_bar.css" />
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
                <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400..800;1,400..800&amp;family=Jost:ital,wght@0,100..900;1,100..900&amp;display=swap" rel="stylesheet" />
            </head>
            
            <body>
                <!-- Navigation bar -->
                <nav class="topnav" aria-label="Main Navigation">
                    <a href="index.html">Totenzettel</a>
                    <a href="Entitaeten.html">Entitäten</a>
                    <a href="Visualisierung.html">Visualisierung</a>
                </nav>
                
            <!-- Metadata Section -->
                <section id="metadata">
                    <button type="button" class="collapsible"><xsl:value-of select="//tei:teiHeader//tei:titleStmt//tei:title[@type='sub']"/></button>
                    <div class="content">
                    <h2>Metadaten</h2>
                    <table>
                        <tr>
                            <th>Repositorium:</th>
                            <td><xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/></td>
                        </tr>
                        <tr>
                            <th>Signatur:</th>
                            <td><xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[@type='Signatur']"/></td>
                        </tr>
                        <tr>
                            <th>Digitalisat:</th>
                            <td>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[@type='URL']"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[@type='URL']"/>
                                </a>
                            </td>
                        </tr>
                    </table>
                    </div>
                </section>
                
              <!-- Transcription Section -->
                <section id="transcription">
                    <h1>Transkription</h1>
                    <div class="text-container"><xsl:apply-templates select="//tei:body"/></div>
                </section>
                
             <!-- Footer -->
                <footer>
                    <p class="right">Work in progress</p>
                </footer>
                
                <!-- Java script -->
                <script src="../js/totenzettel.js"></script>
            </body>
         </html>
    </xsl:template>
    
    <!-- Templates for <tei:body> -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:pb">      
        <img src="{@facs}" alt="Faksimile Seite {@n}"/>
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div class="{@type}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <span class="{@rend}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:choice/*">
        <span class="{name()}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:persName">
        <a href="Entitaeten.html{@ref}"><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="tei:orgName">
        <a href="Entitaeten.html{@ref}"><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="tei:placeName">
        <a href="Entitaeten.html{@ref}"><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='obituary']">
        <xsl:for-each select="tei:pb">
            <div class="content-wrapper">
                <xsl:apply-templates select="."/>
            </div>
                <div class="text-wrapper">
                    <xsl:apply-templates select="following-sibling::*[
                        not(self::tei:pb) and 
                        generate-id(preceding-sibling::tei:pb[1]) = generate-id(current())
                        ]"/>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    
</xsl:stylesheet>