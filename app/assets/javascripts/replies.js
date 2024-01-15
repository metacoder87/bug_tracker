document.addEventListener("turbolinks:load", function () {
    var replyButtons = document.querySelectorAll('.reply-button');
    replyButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            var replyForm = button.nextElementSibling;

            // Toggle the display property directly
            replyForm.style.display = (replyForm.style.display === 'none' || replyForm.style.display === 'block') ? 'block' : 'none';
            button.style.display = 'none';
        });
    });
});