document.querySelectorAll('.nav-toggle').forEach(toggle => {
    const subnavContent = toggle.nextElementSibling;

    // Toggle submenu on click
    toggle.addEventListener('click', (event) => {
        const isExpanded = toggle.getAttribute('aria-expanded') === 'true';

        // Close all other submenus
        closeAllSubmenus();

        // Toggle the current submenu
        toggle.setAttribute('aria-expanded', !isExpanded);
        subnavContent.style.display = isExpanded ? 'none' : 'block';

        // Prevent the click from propagating to the document
        event.stopPropagation();
    });

    // Add keyboard accessibility
    toggle.addEventListener('keydown', (event) => {
        if (event.key === 'Enter' || event.key === ' ') {
            event.preventDefault(); // Prevent scrolling on Space key
            toggle.click(); // Trigger the click event
        }
    });
});

// Close all submenus when clicking outside
document.addEventListener('click', () => {
    closeAllSubmenus();
});

// Function to close all submenus
function closeAllSubmenus() {
    document.querySelectorAll('.nav-toggle').forEach(toggle => {
        toggle.setAttribute('aria-expanded', 'false');
        const subnavContent = toggle.nextElementSibling;
        subnavContent.style.display = 'none';
    });
}