$(document).ready(function() {
    $('#correspondenceTable').DataTable({
        ajax: '../data/json/manuskript_index.json',
        columns: [
            { data: 'Datum' },
            { data: 'Verfasser:in' },
            { data: 'Titel' },
            { data: 'Themen' },
            {
                data: 'Dokument',
                render: function(data, type, row) {
                    return `<a href="${data}" target="_blank" class="link">↪</a>`;
                }
            }
        ],
        language: {
            url: '../data/json/de-DE.json'
        }
    });
});