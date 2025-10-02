function createFamilyGraph(teiData) {
    // Convert TEI data into nodes and links for D3
    const nodes = new Map();
    const links = [];

    // Process each relationship in the TEI data
    teiData.forEach(relation => {
        if (relation.active) {
            // Add the active node
            nodes.set(relation.active, { id: relation.active });

            // Add passive nodes and links
            if (relation.passive && Array.isArray(relation.passive)) {
                relation.passive.forEach(passive => {
                    nodes.set(passive, { id: passive });
                    links.push({ source: relation.active, target: passive, type: relation.type });
                });
            }
        }

        // Add mutual relationships
        if (relation.mutual && Array.isArray(relation.mutual)) {
            for (let i = 0; i < relation.mutual.length; i++) {
                for (let j = i + 1; j < relation.mutual.length; j++) {
                    nodes.set(relation.mutual[i], { id: relation.mutual[i] });
                    nodes.set(relation.mutual[j], { id: relation.mutual[j] });
                    links.push({ source: relation.mutual[i], target: relation.mutual[j], type: relation.type });
                }
            }
        }
    });

    // Convert nodes map to an array
    const nodeArray = Array.from(nodes.values());

    // Set up the SVG canvas dimensions
    const width = 800;
    const height = 600;

    const svg = d3.select("#chart")
        .append("svg")
        .attr("width", width)
        .attr("height", height);

    // Add a tooltip div for displaying relationship information
    const tooltip = d3.select("body")
        .append("div")
        .attr("class", "tooltip")
        .style("opacity", 0);

    // Set up the D3 force simulation
    const simulation = d3.forceSimulation(nodeArray)
        .force("link", d3.forceLink(links).id(d => d.id).distance(100))
        .force("charge", d3.forceManyBody().strength(-300))
        .force("center", d3.forceCenter(width / 2, height / 2));

    // Create the links (lines) between nodes
    const link = svg.append("g")
        .attr("class", "links")
        .selectAll("line")
        .data(links)
        .enter()
        .append("line")
        .attr("class", "link")
        .attr("stroke-width", 2)
        .attr("stroke", d => {
            // Assign colors based on relationship type
            switch (d.type) {
                case "parent": return "blue";
                case "grandparent": return "green";
                case "sibling": return "orange";
                case "spouse": return "red";
                case "partner": return "purple";
                default: return "gray";
            }
        })
        .on("mouseover", (event, d) => {
            // Show tooltip on mouseover
            tooltip.transition()
                .duration(200)
                .style("opacity", 0.9);
            tooltip.html(`Relationship: ${d.type}`)
                .style("left", Math.min(event.pageX + 5, window.innerWidth - 150) + "px")
                .style("top", Math.min(event.pageY - 28, window.innerHeight - 50) + "px");
        })
        .on("mouseout", () => {
            // Hide tooltip on mouseout
            tooltip.transition()
                .duration(500)
                .style("opacity", 0);
        });

    // Create the nodes (circles)
    const node = svg.append("g")
        .attr("class", "nodes")
        .selectAll("circle")
        .data(nodeArray)
        .enter()
        .append("circle")
        .attr("class", "node")
        .attr("r", 10)
        .attr("fill", "lightblue")
        .call(d3.drag()
            .on("start", dragstarted)
            .on("drag", dragged)
            .on("end", dragended));

    // Add labels to the nodes
    const labels = svg.append("g")
        .attr("class", "labels")
        .selectAll("text")
        .data(nodeArray)
        .enter()
        .append("text")
        .attr("dy", -15)
        .attr("text-anchor", "middle")
        .text(d => d.id);

    // Update positions on each simulation tick
    simulation.on("tick", () => {
        link
            .attr("x1", d => d.source.x)
            .attr("y1", d => d.source.y)
            .attr("x2", d => d.target.x)
            .attr("y2", d => d.target.y);

        node
            .attr("cx", d => d.x)
            .attr("cy", d => d.y);

        labels
            .attr("x", d => d.x)
            .attr("y", d => d.y);
    });

    // Drag event handlers
    function dragstarted(event, d) {
        if (!event.active) simulation.alphaTarget(0.3).restart();
        d.fx = d.x;
        d.fy = d.y;
    }

    function dragged(event, d) {
        d.fx = event.x;
        d.fy = event.y;
    }

    function dragended(event, d) {
        if (!event.active) simulation.alphaTarget(0);
        d.fx = null;
        d.fy = null;
    }
}