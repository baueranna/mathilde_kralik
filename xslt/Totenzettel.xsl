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
                <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,opsz,wght@0,18..144,300..900&amp;1,18..144,300..900&amp;family=Montserrat:ital,wght@0,100..900&amp;1,100..900&amp;display=swap" rel="stylesheet" />
            </head>
            
            <body>
                <!-- Navigation bar -->
                <nav class="topnav" aria-label="Main Navigation">
                    <a href="index.html">Menü</a>
                    
                    <!-- Submenu for documents -->
                    <div class="subnav">
                        <div class="nav-toggle" tabindex="0" aria-haspopup="true" aria-expanded="false" aria-label="Document Submenu">
                            <a href="Dokumente.html">Dokumente</a>
                        </div>
                        <div class="subnav-content" aria-label="Submenu">
                            <a href="Briefe.html">Briefe</a>
                            <a href="Manuskript.html">Manuskripte</a>
                            <a href="Totenzettel.html">Totenzettel</a>
                        </div>
                    </div>
                    
                    <!-- Submenu for Entities -->
                    <div class="subnav">
                        <div class="nav-toggle" tabindex="0" aria-haspopup="true" aria-expanded="false" aria-label="Entity Submenu">
                            <a href="Verzeichnis.html">Verzeichnis</a>
                        </div>
                        <div class="subnav-content" aria-label="Submenu">
                            <a href="Personen.html">Personen</a>
                            <a href="Orte.html">Orte</a>
                            <a href="Org.html">Organisationen</a>
                        </div>
                    </div>
                    
                    <!-- Submenu for Visualisations -->
                    <div class="subnav">
                        <div class="nav-toggle" tabindex="0" aria-haspopup="true" aria-expanded="false" aria-label="Entity Submenu">
                            <a href="Visualisierung.html">Visualisierungen</a>
                        </div>
                        <div class="subnav-content" aria-label="Submenu">
                            <a href="Vis_Orte.html">Orte</a>
                            <a href="Vis_Personen.html">Personennetzwerk</a>
                        </div>
                    </div>
                    
                    <!-- Submenu for Mathilde Kralik -->
                    <div class="subnav">
                        <div class="nav-toggle" tabindex="0" aria-haspopup="true" aria-expanded="false" aria-label="Mathilde Kralik Submenu">
                            Mathilde Kralik
                        </div>
                        <div class="subnav-content" aria-label="Mathilde Kralik Submenu">
                            <a href="Bio.html">Biographie</a>
                            <a href="Ressourcen.html">Ressourcen</a>
                        </div>
                    </div>
                    
                    <!-- Submenu for Edition -->
                    <div class="subnav">
                        <div class="nav-toggle" tabindex="0" aria-haspopup="true" aria-expanded="false" aria-label="Edition Submenu">
                            Über die Edition
                        </div>
                        <div class="subnav-content" aria-label="Edition Submenu">
                            <a href="Projekt.html">Projekt</a>
                            <a href="Transkription.html">Transkription</a>
                            <a href="https://github.com/baueranna/mathilde_kralik.git" target="_blank" rel="noopener noreferrer">Github</a>
                        </div>
                    </div>
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
                <section id="transcription" class="content-container">
                    <h1>Transkription</h1>
                    <div class="text-container"><xsl:apply-templates select="//tei:body"/></div>                  
                </section>
                
             <!-- Footer -->
                <footer>
                    <p class="right">Work in progress</p>
                </footer>
                
                <!-- Java script -->
                <script src="../js/totenzettel.js"></script>
                <script src="../js/menu_bar.js"></script>
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
    
    <!-- Template for persName -->
    <xsl:template match="tei:persName">
        <span class="person">
            <a href="../html/personen/{substring-after(@ref, '#')}.html">
                <xsl:value-of select="." />
            </a>
        </span>
    </xsl:template>
    
    <!-- Template for placeName -->
    <xsl:template match="tei:placeName">
        <span class="place">
            <a href="../html/orte/{substring-after(@ref, '#')}.html">
                <xsl:value-of select="." />
            </a>
        </span>
    </xsl:template>
    
    <!-- Template for orgName -->
    <xsl:template match="tei:orgName">
        <span class="org">
            <a href="../html/org/{substring-after(@ref, '#')}.html">
                <xsl:value-of select="." />
            </a>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='obituary']">
        <xsl:for-each select="tei:pb">
                <div class="text-wrapper">
                    <xsl:apply-templates select="following-sibling::*[
                        not(self::tei:pb) and 
                        generate-id(preceding-sibling::tei:pb[1]) = generate-id(current())
                        ]"/>
                </div>
            <div class="button-container">
                <label>
                    <span>Personen</span>
                    <input type="checkbox" id="person"/>
                    <span class="slider"></span>
                </label>
                <label>
                    <span>Orte</span>
                    <input type="checkbox" id="place"/>
                    <span class="slider"></span>
                </label>
                <label>
                    <span>Organisationen</span>
                    <input type="checkbox" id="org"/>
                    <span class="slider"></span>
                </label>
                <label>
                    <span>Kommentare</span>
                    <input type="checkbox" id="note"/>
                    <span class="slider"></span>
                </label>
                <label>
                    <span>Diplomatische Transkription</span>
                    <input type="checkbox" id="trans"/>
                    <span class="slider"></span>
                </label>
            </div>
                <div class="content-wrapper">
                    <xsl:apply-templates select="."/>
                </div>
        </xsl:for-each>
    </xsl:template>
    
    
</xsl:stylesheet>