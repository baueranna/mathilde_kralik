$(document).ready(function() {
    $('#correspondenceTable').DataTable({
        ajax: '../data/json/person_index.jsdata.json', // URL to your JSON file or API endpoint
        columns: [
            { data: 'forename' },
            { data: 'surname' },
            { data: 'affiliation' }
        ]
    });
});