// Get the button element
var button = document.querySelector('.btn');

// Add an event listener to handle button click
button.addEventListener('click', function(event) {
    event.preventDefault();

    // Show a success message
    swal("Thành công!", "Đặt phòng thành công!", "success");
});