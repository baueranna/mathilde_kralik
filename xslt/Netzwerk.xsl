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
                
                <style>
                    .node {
                    stroke: #fff;
                    stroke-width: 1.5px;
                    }
                    
                    .link {
                    stroke-opacity: 0.6;
                    }
                    
                    text {
                    font-size: 12px;
                    pointer-events: none;
                    }
                    
                    .tooltip {
                    position: absolute;
                    text-align: center;
                    width: auto;
                    height: auto;
                    padding: 5px;
                    font: 12px sans-serif;
                    background: lightgray;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                    pointer-events: none;
                    }
                </style>
            </head>
            <body>
                <h1>Family Relationships Visualization</h1>
                <div id="chart"></div>
                
                <script>
                    // Data extracted from TEI-XML
                    const teiData = [
                    <xsl:for-each select="//tei:relation">
                        {
                        "type": "<xsl:value-of select="@name" />",
                        <xsl:if test="@active">
                            "active": "<xsl:value-of select="@active" />",
                        </xsl:if>
                        <xsl:if test="@passive">
                            "passive": [
                            <xsl:for-each select="tokenize(@passive, ' ')">
                                "<xsl:value-of select='.' />"<xsl:if test="position() != last()">, </xsl:if>
                            </xsl:for-each>
                            ],
                        </xsl:if>
                        <xsl:if test="@mutual">
                            "mutual": [
                            <xsl:for-each select="tokenize(@mutual, ' ')">
                                "<xsl:value-of select='.' />"<xsl:if test="position() != last()">, </xsl:if>
                            </xsl:for-each>
                            ]
                        </xsl:if>
                        }<xsl:if test="position() != last()">,</xsl:if>
                    </xsl:for-each>
                    ];
                </script>
                <script src="../js/netzwerk.js"></script>
                <script src="https://d3js.org/d3.v7.min.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>