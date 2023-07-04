// Initialize EmailJS with your public API key
emailjs.init('DbTsP_2pzP-09GtkP');

// Get the form element
var form = document.getElementById('myForm');

// Add an event listener to handle form submission
form.addEventListener('submit', function(event) {
    event.preventDefault();

    // Send the email using EmailJS
    emailjs.sendForm('service_v7xk0fa', 'template_qobsj6a', this)
        .then(function(response) {
            alert('Gửi thông tin thành công');
        }, function(error) {
            alert('Gửi thông tin thất bại, xin vui lòng thử lại');
        });
});


