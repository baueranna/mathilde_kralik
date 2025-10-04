$(document).ready(function() {
    $('#correspondenceTable').DataTable({
        ajax: '../data/json/briefe_index.json',
        columns: [
            { data: 'Datum' },
            { data: 'Sender:in' },
            { data: 'Empfänger:in' },
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