document.addEventListener("turbolinks:load", function () {
    changeTextColor('#priority', {
        'high': 'red',
        'medium': 'orange',
        'low': 'yellow'
    });

    changeTextColor('#status', {
        'active': 'red',
        'in_progress': '#08f7fe',
        'solved': 'green'
    });
});

function changeTextColor(selector, colorMap) {
    var elements = document.querySelectorAll(selector);

    elements.forEach(function (element) {
        var textContent = element.textContent.trim().toLowerCase();
        element.style.color = colorMap[textContent] || ''; // Default to empty string if not found
    });
}
