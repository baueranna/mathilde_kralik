<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="1.0">
    <!-- Output HTML -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="tei:body tei:note tei:p tei:table"/>
    
    <!-- Template for the root element -->
    <xsl:template match="/tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//tei:teiHeader//tei:titleStmt//tei:title[@type='main']"/>
                </title>
                <link rel="stylesheet" type="text/css" href="../css/menu_bar.css" />
                <link rel="stylesheet" type="text/css" href="../css/manuscript.css" />
                <link rel="preconnect" href="https://fonts.googleapis.com" />
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
                <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,opsz,wght@0,18..144,300..900&amp;1,18..144,300..900&amp;family=Montserrat:ital,wght@0,100..900&amp;1,100..900&amp;display=swap" rel="stylesheet" /> 
            </head>
             <body>
                 <!-- Navigation bar -->
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
                    <div id="msDesc">
                        <h1>Metadaten</h1>
                        <table>
                        <tr><th>Bibliothek:</th><td><xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:repository"/></td></tr>
                        <tr><th>Sammlung:</th><td><xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:collection"/></td></tr>
                        <tr><th>Signatur:</th><td><xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:idno[@type='Signatur']"/></td></tr>
                        <tr><th>Online-Ressource:</th> 
                        <td><a href="{//tei:msDesc/tei:msIdentifier/tei:idno[@type='PURL']}"><xsl:value-of select="//tei:teiHeader//tei:titleStmt//tei:title[@type='s']"/></a></td></tr>
                        </table>
                    </div>
                    </div>
                </section>
                
                <!-- Transcription Section -->
                <section id="transcription">
                    <article><xsl:apply-templates select="//tei:body"/></article>
                
                    <!-- Buttons -->
                    <div class="page-skip">
                        <button class="nav-button" id="prev-page">˂</button>
                        <button class="nav-button" id="next-page">˃</button>
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
                </section>
               
                <!-- Footer -->
                <footer>
                    <p class="right">Work in progress</p>
                </footer>
                
                <!-- Java script -->
                 <script src="../js/menu_bar.js"></script>
                 <script src="../js/manuscript.js"></script>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template for <tei:body> -->
    <xsl:template match="tei:body">
        <xsl:apply-templates select="tei:div"/>
    </xsl:template>
    
    <!-- Template for wrapping <pb> and following elements in a content-wrapper -->
    <xsl:template match="tei:div">
        <xsl:for-each select="tei:pb">
            <div class="content-wrapper">
                <!-- Render the <pb> as an <img> -->
                <xsl:apply-templates select="."/>
                
                <!-- Wrap the following elements in a text-wrapper -->
                <div class="text-wrapper">
                    <xsl:apply-templates select="following-sibling::*[
                        not(self::tei:pb) and 
                        generate-id(preceding-sibling::tei:pb[1]) = generate-id(current())
                        ]"/>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

        
     <!-- Template for pb -->
     <xsl:template match="tei:pb">      
                <img src="{@facs}" alt="Faksimile Seite {@n}"/>
     </xsl:template>
      
    
    <xsl:template match="tei:note">
        <div class="note"><xsl:apply-templates/></div>
    </xsl:template>
    
    <!-- Template for highlights (style-tags) -->
    <xsl:template match="tei:hi">
        <span class="{@rend}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Template for choice sub-elements -->
    <xsl:template match="tei:choice/*">
        <span class="{name()}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    <!-- Template for line breaks -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <!-- Template for p -->
    <xsl:template match="tei:p">
        <div class="paragraph">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Template for <list> -->
        <xsl:template match="tei:list">
            <ol>
                <!-- Apply templates to all <item> children -->
                <xsl:apply-templates select="tei:item" />
            </ol>
        </xsl:template>
        
    <xsl:template match="tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <!-- Template for listPerson -->
    <xsl:template match="tei:listPerson">
        <ul class="list-person">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <!-- Template for person -->
    <xsl:template match="tei:person">
        <li>
            <xsl:value-of select="tei:persName/tei:forename"/>&#160; 
            <xsl:value-of select="tei:persName/tei:surname"/>
        </li>
    </xsl:template>
    
    <!-- Template for listPlace -->
    <xsl:template match="tei:listPlace">
        <ul class="list-place">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <!-- Template for place -->
    <xsl:template match="tei:place">
        <li>
            <xsl:value-of select="tei:placeName"/>
        </li>
    </xsl:template>
    
    <!-- Template for listOrg -->
    <xsl:template match="tei:listOrg">
        <ul class="list-org">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <!-- Template for org -->
    <xsl:template match="tei:org">
        <li>
            <xsl:value-of select="tei:orgName"/>
        </li>
    </xsl:template>
    
    <!-- Template for persName -->
    <xsl:template match="tei:persName">
        <xsl:variable name="refId" select="substring-after(@ref, '#')"/>
        <xsl:variable name="entity" select="//tei:back/tei:listPerson/tei:person[@xml:id=$refId]"/>
        <xsl:variable name="wikidata" select="$entity/tei:idno[@type='ID' and @subtype='WIKIDATA']"/>
        <xsl:variable name="otherId" select="$entity/tei:idno[@type='URI' or @type='URL']"/>
        <span class="person">
            <xsl:choose>
                <xsl:when test="$wikidata">
                    <a href="https://www.wikidata.org/wiki/{$wikidata}">
                        <xsl:value-of select="."/>
                    </a>
                </xsl:when>
                <xsl:when test="$otherId">
                    <a href="{$otherId}">
                        <xsl:value-of select="."/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </span>
    </xsl:template>
    
    <!-- Template for placeName -->
    <xsl:template match="tei:placeName">
        <xsl:variable name="refId" select="substring-after(@ref, '#')"/>
        <xsl:variable name="entity" select="//tei:back/tei:listPlace/tei:place[@xml:id=$refId]"/>
        <xsl:variable name="wikidata" select="$entity/tei:idno[@type='ID' and @subtype='WIKIDATA']"/>
        <xsl:variable name="otherId" select="$entity/tei:idno[@type='URI' or @type='URL']"/>
        <span class="place">
            <xsl:choose>
                <xsl:when test="$wikidata">
                    <a href="https://www.wikidata.org/wiki/{$wikidata}">
                        <xsl:value-of select="."/>
                    </a>
                </xsl:when>
                <xsl:when test="$otherId">
                    <a href="{$otherId}">
                        <xsl:value-of select="."/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </span>
    </xsl:template>
    
    <!-- Template for orgName -->
    <xsl:template match="tei:orgName">
        <xsl:variable name="refId" select="substring-after(@ref, '#')"/>
        <xsl:variable name="entity" select="//tei:back/tei:listOrg/tei:org[@xml:id=$refId]"/>
        <xsl:variable name="wikidata" select="$entity/tei:idno[@type='ID' and @subtype='WIKIDATA']"/>
        <xsl:variable name="otherId" select="$entity/tei:idno[@type='URI' or @type='URL']"/>
        <span class="org">
            <xsl:choose>
                <xsl:when test="$wikidata">
                    <a href="https://www.wikidata.org/wiki/{$wikidata}">
                        <xsl:value-of select="."/>
                    </a>
                </xsl:when>
                <xsl:when test="$otherId">
                    <a href="{$otherId}">
                        <xsl:value-of select="."/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </span>
    </xsl:template>
</xsl:stylesheet>