<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="2.0">
    
    <!-- Output HTML -->
    <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/tei:TEI">
        <html lang="de">
            <head>
                <title>
                    <xsl:value-of select="//tei:teiHeader//tei:titleStmt//tei:title[@type='main']"/>
                </title>
                
                <link rel="stylesheet" type="text/css" href="../css/list.css" />
                <link rel="stylesheet" type="text/css" href="../css/menu_bar.css" />
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
                <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400..800;1,400..800&amp;family=Jost:ital,wght@0,100..900;1,100..900&amp;display=swap" rel="stylesheet" />
                
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
                            Edition
                        </div>
                        <div class="subnav-content" aria-label="Edition Submenu">
                            <a href="Projekt.html">Projekt</a>
                            <a href="Transkription.html">Transkription</a>
                            <a href="https://github.com/baueranna/mathilde_kralik.git" target="_blank" rel="noopener noreferrer">Github</a>
                        </div>
                    </div>
                </nav>
                
                <!-- Entitätenliste -->  
                <section class="person">
                    <h1>Personenverzeichnis</h1>
                    <xsl:for-each select="//tei:listPerson/tei:person">
                        <xsl:sort select="tei:persName/tei:surname[1]" order="ascending"/>
                        <xsl:sort select="tei:persName/tei:forename" order="ascending" />
                            <button type="button" class="collapsible" id="{@xml:id}">
                                <xsl:value-of select="tei:persName/tei:forename"/>
                                <xsl:text> </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="tei:persName/tei:surname[@type='married']">
                                        <xsl:value-of select="tei:persName/tei:surname[@type='married']"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="tei:persName/tei:surname"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </button>
                            <div class="content">
                                <table>
                                    <tr>
                                        <th>Vorname:</th>
                                        <td><xsl:value-of select="tei:persName/tei:forename"/></td>
                                    </tr>
                                    <tr>
                                        <th>Nachname:</th>
                                        <td>
                                            <xsl:choose>
                                            <xsl:when test="tei:persName/tei:surname[@type='married']">
                                                <xsl:value-of select="tei:persName/tei:surname[@type='married']"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="tei:persName/tei:surname"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        </td>
                                    </tr>
                                    <xsl:if test="tei:persName/tei:surname[@type='maiden']">
                                        <tr>
                                            <th>Geburtsname:</th>
                                            <td><xsl:value-of select="tei:persName/tei:surname[@type='maiden']"/></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="tei:death">
                                        <tr>
                                            <th>Gestorben:</th>
                                            <td><xsl:value-of select="tei:death"/></td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="tei:occupation">
                                        <tr>
                                            <th>Beruf:</th>
                                            <td>
                                                <xsl:for-each select="tei:occupation">
                                                    <xsl:value-of select="."/>
                                                    <xsl:if test="position() != last()">
                                                        <xsl:text>,</xsl:text>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="tei:affiliation">
                                        <tr>
                                            <th>Mitgliedschaft:</th>
                                            <td>
                                                <xsl:for-each select="tei:affiliation">
                                                    <xsl:value-of select="."/>
                                                    <xsl:if test="position() != last()">
                                                        <xsl:text>, </xsl:text>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="tei:idno[@subtype='WIKIDATA']">
                                        <tr>
                                            <th>Wikidata:</th>
                                            <td>
                                                <a href="https://www.wikidata.org/wiki/{tei:idno[@subtype='WIKIDATA']}">
                                                    <xsl:value-of select="tei:idno[@subtype='WIKIDATA']"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="tei:idno[@subtype='GND']">
                                        <tr>
                                            <th>GND:</th>
                                            <td>
                                                <a href="https://d-nb.info/gnd/{tei:idno[@subtype='GND']}">
                                                    <xsl:value-of select="tei:idno[@subtype='GND']"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="tei:idno[@subtype='WGW']">
                                        <tr>
                                            <th>Wien Geschichte Wiki:</th>
                                            <td>
                                                <a href="https://www.geschichtewiki.wien.gv.at/Special:URIResolver/?curid={tei:idno[@subtype='WGW']}">
                                                    <xsl:value-of select="tei:idno[@subtype='WGW']"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="tei:idno[@subtype='ÖBL']">
                                        <tr>
                                            <th>Österreichisches Biographisches Lexikon:</th>
                                            <td>
                                                <a href="{tei:idno[@subtype='ÖBL']}">
                                                    <xsl:value-of select="tei:idno[@subtype='ÖBL']"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="tei:idno[@subtype='Wikipedia']">
                                        <tr>
                                            <th>Wikipedia:</th>
                                            <td>
                                                <a href="{tei:idno[@subtype='Wikipedia']}">
                                                    <xsl:value-of select="tei:idno[@subtype='Wikipedia']"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if> 
                                </table>
                            </div>
                    </xsl:for-each>
                </section>
                
                <section class="org">
                    <h1>Organisationsverzeichnis</h1>
                    <xsl:for-each select="//tei:listOrg/tei:org">
                        <xsl:sort select="tei:orgName" order="ascending"/>
                        <button type="button" class="collapsible" id="{@xml:id}">
                            <xsl:value-of select="tei:orgName"/>
                        </button>
                        <div class="content">
                            <table>
                                <tr>
                                    <th>Name:</th>
                                    <td><xsl:value-of select="tei:orgName"/></td>
                                </tr>
                                <xsl:if test="tei:idno[@subtype='WIKIDATA']">
                                    <tr>
                                        <th>Wikidata:</th>
                                        <td>
                                            <a href="https://www.wikidata.org/wiki/{tei:idno[@subtype='WIKIDATA']}">
                                                <xsl:value-of select="tei:idno[@subtype='WIKIDATA']"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:idno[@subtype='GND']">
                                    <tr>
                                        <th>GND:</th>
                                        <td>
                                            <a href="https://d-nb.info/gnd/{tei:idno[@subtype='GND']}">
                                                <xsl:value-of select="tei:idno[@subtype='GND']"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:idno[@subtype='WGW']">
                                    <tr>
                                        <th>Wien Geschichte Wiki:</th>
                                        <td>
                                            <a href="https://www.geschichtewiki.wien.gv.at/Special:URIResolver/?curid={tei:idno[@subtype='WGW']}">
                                                <xsl:value-of select="tei:idno[@subtype='WGW']"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:idno[@subtype='Wikipedia']">
                                    <tr>
                                        <th>Wikipedia:</th>
                                        <td>
                                            <a href="{tei:idno[@subtype='Wikipedia']}">
                                                <xsl:value-of select="tei:idno[@subtype='Wikipedia']"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if> 
                            </table>
                        </div>
                    </xsl:for-each>
                </section>
                
                <section class="place">
                    <h1>Ortsverzeichnis</h1>
                    <xsl:for-each select="//tei:listPlace/tei:place">
                        <xsl:sort select="tei:placeName[1]" order="ascending"/>
                        <button type="button" class="collapsible" id="{@xml:id}">
                            <xsl:value-of select="tei:placeName"/>
                        </button>
                        <div class="content">
                            <table>
                                <xsl:if test="tei:placeName">
                                    <tr>
                                        <th>Name:</th>
                                        <td>
                                            <xsl:for-each select="tei:placeName">
                                                <xsl:value-of select="."/>
                                                <xsl:if test="position() != last()">
                                                    <xsl:text>, </xsl:text>
                                                </xsl:if>
                                            </xsl:for-each>
                                          </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:settlement">
                                    <tr>
                                        <th>Stadt:</th>
                                        <td><xsl:value-of select="tei:settlement"/></td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:country">
                                    <tr>
                                        <th>Land:</th>
                                        <td><xsl:value-of select="tei:country"/></td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:location/tei:geo">
                                    <tr>
                                        <th>Geodaten:</th>
                                        <td><xsl:value-of select="tei:location/tei:geo"/></td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:idno[@subtype='WIKIDATA']">
                                    <tr>
                                        <th>Wikidata:</th>
                                        <td>
                                            <a href="https://www.wikidata.org/wiki/{tei:idno[@subtype='WIKIDATA']}">
                                                <xsl:value-of select="tei:idno[@subtype='WIKIDATA']"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:idno[@subtype='GND']">
                                    <tr>
                                        <th>GND:</th>
                                        <td>
                                            <a href="https://d-nb.info/gnd/{tei:idno[@subtype='GND']}">
                                                <xsl:value-of select="tei:idno[@subtype='GND']"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:idno[@subtype='WGW']">
                                    <tr>
                                        <th>Wien Geschichte Wiki:</th>
                                        <td>
                                            <a href="https://www.geschichtewiki.wien.gv.at/Special:URIResolver/?curid={tei:idno[@subtype='WGW']}">
                                                <xsl:value-of select="tei:idno[@subtype='WGW']"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="tei:idno[@subtype='Wikipedia']">
                                    <tr>
                                        <th>Wikipedia:</th>
                                        <td>
                                            <a href="{tei:idno[@subtype='Wikipedia']}">
                                                <xsl:value-of select="tei:idno[@subtype='Wikipedia']"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if> 
                            </table>
                        </div>
                    </xsl:for-each>
                </section>
                <!-- Footer -->
                <footer>
                    <p class="right">Work in progress</p>
                </footer>
                
                <!-- Java Script -->
                <script src="../js/totenzettel.js"></script>
                <script src="../js/menu_bar.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>