$(document).ready(function() {
    $('#correspondenceTable').DataTable({
        ajax: '../data/json/place_index.json',
        columns: [
            { data: 'name' },
            { data: 'type' },
            {
                data: 'Website',
                render: function(data, type, row) {
                    return `<a href="orte/${data}" target="_blank" class="link">↪</a>`;
                }
            }
        ],
        language: {
            url: '../data/json/de-DE.json'
        }
    });
});