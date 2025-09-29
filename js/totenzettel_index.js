$(document).ready(function() {
    $('#correspondenceTable').DataTable({
        ajax: '../data/json/toten_index.json',
        columns: [
            { data: 'Datum' },
            { data: 'Verstorbene:r' },
            {
                data: 'Dokument',
                render: function(data, type, row) {
                    return `<a href="${data}" target="_blank" class="link">↪</a>`;
                }
            }
        ],
        language: {
            url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/de-DE.json"
        }
    });
});