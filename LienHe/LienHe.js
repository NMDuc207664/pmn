// Initialize EmailJS with your public API key
emailjs.init('DbTsP_2pzP-09GtkP');

// Get the form element
var form = document.getElementById('myForm');

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1) + min);
  }
  
// Add an event listener to handle form submission
form.addEventListener('submit', function(event) {
    event.preventDefault();

    // Get all input elements
    var inputs = form.querySelectorAll('input[type="text"], textarea');

    // Check if all input fields are not empty
    var allFilled = true;
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].value === '') {
            allFilled = false;
            break;
        }
    }

    if (allFilled) {
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
                
                    let malienhe = getRandomInt(10000, 90000);
                    let ten = document.getElementById("ten").value;
                    let email = document.getElementById("email").value;
                    let sdt = document.getElementById("sdt").value;
                    let chude = document.getElementById("chude").value;
                    let noidung = document.getElementById("noidung").value;
                
                    // Create JSON object
                    let data = {
                        MaLienHe: malienhe,
                        Ten: ten,
                        Email: email,
                        SDT: sdt,
                        ChuDe: chude,
                        NoiDung: noidung
                    };
                
                    // Output JSON object
                    console.log(data);
            } else {
                swal("Đã huỷ thành công");
            }
        });
    } else {
        // Show an alert message
        swal("Vui lòng điền đầy đủ thông tin");
    }
});

