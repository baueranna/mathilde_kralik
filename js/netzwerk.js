// Fetch the JSON data from the external file
        fetch('../data/json/relation_index.json')
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(jsonData => {
                // Prepare the data for Highcharts
                const nodes = new Set();
                const links = [];

                jsonData.data.forEach(entry => {
                    if (entry.name === "sibling" || entry.name === "spouse" || entry.name === "partner") {
                        const mutual = entry.mutual.split(", ");
                        mutual.forEach((person, index) => {
                            nodes.add(person);
                            for (let i = index + 1; i < mutual.length; i++) {
                                links.push({
                                    from: person,
                                    to: mutual[i],
                                    relationship: entry.name,
                                    color: entry.name === "sibling" ? "#ffc233" : "#d22a00" // Sibling or Spouse/Partner
                                });
                            }
                        });
                   } else if (entry.name === "parent" || entry.name === "grandparent" || entry.name === "uncle") {
                        const active = entry.active;
                        const passive = entry.passive.split(", ");
                        nodes.add(active);
                        passive.forEach(person => {
                            nodes.add(person);
                            links.push({
                                from: active,
                                to: person,
                                relationship: entry.name,
                                color: entry.name === "parent" ? "#ff7300" : // Parent-Child
                                       entry.name === "grandparent" ? "#5b004a" : // Grandparent-Grandchild
                                       "#a8984b" // Uncle
                            });
                        });
                    }
                });

                // Convert nodes to an array and set their color to black
                const nodeArray = Array.from(nodes).map(name => ({
                    id: name,
                    color: "#333" 
                }));

                // Create the Highcharts chart
                Highcharts.chart('container', {
                    chart: {
                        type: 'networkgraph',
                        plotBorderWidth: 1
                    },
                    title: {
                        text: 'Verwandtschaftsverhältnisse'
                    },
                    tooltip: {
                        formatter: function () {
                            // Only show tooltips for nodes
                            if (this.point.id) {
                                return `<b>${this.point.id}</b>`;
                            }
                            return null;
                        }
                    },
                    plotOptions: {
                        networkgraph: {
                            keys: ['from', 'to'],
                            layoutAlgorithm: {
                                enableSimulation: true
                            }
                        }
                    },
                    series: [{
                        dataLabels: {
                            enabled: true,
                            linkFormat: '' // Disable labels on links
                        },
                        nodes: nodeArray,
                        data: links
                    }]
                });
            })
            .catch(error => {
                console.error('Error fetching the JSON data:', error);
            });