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
                
                <link rel="stylesheet" type="text/css" href="../css/index.css" />
                <link rel="stylesheet" type="text/css" href="../css/menu_bar.css" />
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
                <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400..800;1,400..800&amp;family=Jost:ital,wght@0,100..900;1,100..900&amp;display=swap" rel="stylesheet" />
                
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
                
                <!-- Display of facsimile + title -->
                <h1>Totenzettel</h1>
                <div class="tile-container">
                    <xsl:for-each select="collection('../xml?select=*.xml')">
                        <div class="tile">
                            <xsl:variable name="facs" select="//tei:pb[@n='1']/@facs"/>
                            <img src="{$facs}" alt="Bild: Totenzettel" />
                            <xsl:variable name="title" select="normalize-space(/*/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='sub'])"/>
                            <a href="{translate($title, ' ', '_')}.html">
                                <xsl:value-of select="$title"/>
                            </a>
                        </div>
                    </xsl:for-each>
                </div>
                <!-- Footer -->
                <footer>
                    <p class="right">Work in progress</p>
                </footer>
               
               <!--Java script-->
                <script src="../js/menu_bar.js"></script>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>