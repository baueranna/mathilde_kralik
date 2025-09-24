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
                    <xsl:value-of select="//tei:teiHeader//tei:titleStmt//tei:title[@type='main']"/>
                </title>
                
                <link rel="stylesheet" type="text/css" href="../css/map.css" />
                <link rel="stylesheet" type="text/css" href="../css/menu_bar.css" />
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
                <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400..800;1,400..800&amp;family=Jost:ital,wght@0,100..900;1,100..900&amp;display=swap" rel="stylesheet" />
                <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
                    integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
                    crossorigin=""/>
                <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
                    integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
                    crossorigin=""></script>
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
                            <a href="Org.html">Organisation</a>
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
                
                <!-- Map -->
                <div id="map"></div>
                <script>
                    var map = L.map('map').setView([48.233902622021546, 16.344070193512067], 13);
                    
                    var redIcon = L.icon({
                    iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png',
                    iconSize: [25, 41],
                    iconAnchor: [12, 41],
                    popupAnchor: [1, -34],
                    shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
                    shadowSize: [41, 41],
                    shadowAnchor: [12, 41]
                    });
                    
                    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    maxZoom: 19,
                    attribution: '&amp;#169; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                    }).addTo(map);
                    
                    <xsl:for-each select="//tei:place">
                        <xsl:if test="tei:location/tei:geo and contains(tei:location/tei:geo, ',')">
                            <xsl:text>L.marker([</xsl:text>
                            <xsl:value-of select="substring-before(tei:location/tei:geo, ',')"/>
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="substring-after(tei:location/tei:geo, ',')"/>
                            <xsl:text>], {icon:redIcon}).addTo(map).bindPopup("</xsl:text>
                            <xsl:value-of select="normalize-space(translate(tei:placeName[1], '&quot;', '&amp;quot;'))"/>
                            <xsl:text>");</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>