// Initialize EmailJS with your public API key
emailjs.init('DbTsP_2pzP-09GtkP');

// Get the form element
var form = document.getElementById('myForm');

// Add an event listener to handle form submission
form.addEventListener('submit', function(event) {
    event.preventDefault();

    // Show a confirmation dialog before proceeding
    swal({
        title: "Xác nhận",
        text: "Bạn có muốn gửi thông tin không?",
        icon: "warning",
        buttons: ["Huỷ", "Tiếp tục"],
        dangerMode: true,
    })
    .then((willSubmit) => {
        if (willSubmit) {
            // Send the email using EmailJS
            emailjs.sendForm('service_v7xk0fa', 'template_qobsj6a', this)
                .then(function(response) {
                    swal("Gửi thông tin thành công");
                }, function(error) {
                    swal("Gửi thông tin thất bại, xin vui lòng thử lại");
                });
        } else {
            swal("Đã huỷ thành công");
        }
    });
});