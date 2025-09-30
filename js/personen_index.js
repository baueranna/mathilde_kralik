$(document).ready(function() {
    $('#correspondenceTable').DataTable({
        ajax: '../data/json/person_index.json',
        columns: [
            { data: 'forename' },
            { data: 'surname' },
            { data: 'occupations' },
            {
                data: 'Website',
                render: function(data, type, row) {
                    return `<a href="personen/${data}" target="_blank" class="link">↪</a>`;
                }
            }
        ],
        language: {
            url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/de-DE.json"
        }
    });
});