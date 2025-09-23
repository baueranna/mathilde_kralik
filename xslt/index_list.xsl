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
                    <a href="index.html">Totenzettel</a>
                    <a href="Entitaeten.html">Entitäten</a>
                    <a href="Visualisierung.html">Visualisierung</a>
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
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>