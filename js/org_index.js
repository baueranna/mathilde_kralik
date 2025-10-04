$(document).ready(function() {
    $('#correspondenceTable').DataTable({
        ajax: '../data/json/org_index.json',
        columns: [
            { data: 'name' },
            { data: 'type' },
            {
                data: 'Website',
                render: function(data, type, row) {
                    return `<a href="org/${data}" target="_blank" class="link">↪</a>`;
                }
            }
        ],
        language: {
            url: '../data/json/de-DE.json'
        }
    });
});