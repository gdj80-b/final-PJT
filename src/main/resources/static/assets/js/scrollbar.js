/**
 * 
 */

document.addEventListener("DOMContentLoaded", function() {
    const scrollContainers = document.querySelectorAll('.scroll-container');

    scrollContainers.forEach(function(container) {
        const ps = new PerfectScrollbar(container);

        container.addEventListener('mouseenter', function() {
            container.classList.add('ps--focus');
        });

        container.addEventListener('mouseleave', function() {
            container.classList.remove('ps--focus');
        });
    });
});