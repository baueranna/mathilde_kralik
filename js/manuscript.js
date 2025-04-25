//Collapsible metadaten
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}


        // JavaScript for navigation
        const wrappers = document.querySelectorAll('.content-wrapper');
        const prevBtn = document.getElementById('prev-page');
        const nextBtn = document.getElementById('next-page');
        let currentIndex = 0;

        function updateView() {
            // Hide all wrappers
            wrappers.forEach(wrapper => wrapper.classList.remove('active'));
            // Show the current wrapper
            wrappers[currentIndex].classList.add('active');
            // Update button states
            prevBtn.disabled = currentIndex === 0;
            nextBtn.disabled = currentIndex === wrappers.length - 1;
        }

        prevBtn.addEventListener('click', () => {
            if (currentIndex > 0) {
                currentIndex--;
                updateView();
            }
        });

        nextBtn.addEventListener('click', () => {
            if (currentIndex < wrappers.length - 1) {
                currentIndex++;
                updateView();
            }
        });

        // Initialize the view
        updateView();
		
// Wait for the DOM to load
document.addEventListener("DOMContentLoaded", () => {
    // Get all the buttons and elements
    const personButton = document.getElementById("person");
    const placeButton = document.getElementById("place");
    const orgButton = document.getElementById("org");

    const personSpans = document.querySelectorAll(".person");
    const placeSpans = document.querySelectorAll(".place");
    const orgSpans = document.querySelectorAll(".org");


    // Helper function to toggle highlighting
    function toggleHighlight(elements, isActive, color) {
        elements.forEach(el => {
            el.style.backgroundColor = isActive ? color : "transparent";
        });
    }

    // Event listener for the "Person" button
    personButton.addEventListener("change", () => {
        const isActive = personButton.checked;
        toggleHighlight(personSpans, isActive, "#ff5c33"); // Highlight in red
    });

    // Event listener for the "Place" button
    placeButton.addEventListener("change", () => {
        const isActive = placeButton.checked;
        toggleHighlight(placeSpans, isActive, "#ffc847"); // Highlight in yellow
    });

    // Event listener for the "Org" button
    orgButton.addEventListener("change", () => {
        const isActive = orgButton.checked;
        toggleHighlight(orgSpans, isActive, "brown"); // Highlight in brown
    });
});

// Wait for the DOM to fully load
document.addEventListener("DOMContentLoaded", function () {
    // Get the "Kommentare" checkbox
    const noteCheckbox = document.getElementById("note");

    // Add an event listener to the checkbox
    noteCheckbox.addEventListener("change", function () {
        // Get all elements with the class "note"
        const notes = document.querySelectorAll(".note");

        // Toggle visibility based on the checkbox state
        notes.forEach(note => {
            if (noteCheckbox.checked) {
                note.style.display = "block"; // Show the notes
            } else {
                note.style.display = "none"; // Hide the notes
            }
        });
    });

    // Initially hide all notes
    const notes = document.querySelectorAll(".note");
    notes.forEach(note => {
        note.style.display = "none";
    });
});


// Wait for the DOM to fully load
document.addEventListener("DOMContentLoaded", function () {
    // Get the "trans" checkbox
    const transCheckbox = document.getElementById("trans");

    // Function to toggle visibility and styles
    const toggleTranscription = () => {
        // Get all relevant elements
        const abbrElements = document.querySelectorAll(".abbr");
        const expanElements = document.querySelectorAll(".expan");
        const sicElements = document.querySelectorAll(".sic");
        const corrElements = document.querySelectorAll(".corr");
        const superscriptElements = document.querySelectorAll(".superscript");
        const underlinedElements = document.querySelectorAll(".underlined");
        const strikethroughElements = document.querySelectorAll(".strikethrough");
		const rotateElements = document.querySelectorAll(".rotate");

        if (transCheckbox.checked) {
            // Show abbr and sic, hide expan and corr
            abbrElements.forEach(abbr => abbr.style.display = "inline");
            sicElements.forEach(sic => sic.style.display = "inline");
            expanElements.forEach(expan => expan.style.display = "none");
            corrElements.forEach(corr => corr.style.display = "none");
			strikethroughElements.forEach(strike => strike.style.display = "inline");
			rotateElements.forEach(rotate => rotate.style.display="inline");

            // Show superscript, underlined, and strikethrough
            superscriptElements.forEach(sup => sup.style.display = "inline");
            underlinedElements.forEach(underlined => underlined.style.textDecoration = "underline");
            strikethroughElements.forEach(strike => strike.style.textDecoration = "line-through");
        } else {
            // Show expan and corr, hide abbr and sic
            abbrElements.forEach(abbr => abbr.style.display = "none");
            sicElements.forEach(sic => sic.style.display = "none");
            expanElements.forEach(expan => expan.style.display = "inline");
            corrElements.forEach(corr => corr.style.display = "inline");
			strikethroughElements.forEach(strike => strike.style.display = "none");
			rotateElements.forEach(rotate => rotate.style.display="none");

            // Hide superscript, underlined, and strikethrough
            superscriptElements.forEach(sup => sup.style.display = "none");
            underlinedElements.forEach(underlined => underlined.style.textDecoration = "none");
            strikethroughElements.forEach(strike => strike.style.textDecoration = "none");
        }
    };

    // Add an event listener to the checkbox
    transCheckbox.addEventListener("change", toggleTranscription);

    // Initialize the visibility and styles on page load
    toggleTranscription();
});