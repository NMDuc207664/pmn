// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function () {
  // Get all input elements
  var inputs = document.querySelectorAll('.input');

  // Check if all input fields are not empty
  var allFilled = true;
  for (var i = 0; i < inputs.length; i++) {
      if (inputs[i].name !== 'dichvu' && inputs[i].name !== 'ghichu' && inputs[i].value === '') {
          allFilled = false;
          break;
      }
  }

  if (allFilled) {
      // Open the modal
      modal.style.display = "block";
  } else {
      // Show an alert message
      swal("Xin hãy điền đầy đủ thông tin");
  }
}

// When the user clicks on <span> (x), close the modal
span.onclick = function () {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}


function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1) + min);
}


document.getElementById("myBtn").addEventListener("click", function(event) {
    event.preventDefault();
  
    // Collect data from form
    let maphieu = getRandomInt(10000, 90000);
    let hoten = document.getElementById("hoten").value;
    let email = document.getElementById("email").value;
    let sdt = document.getElementById("sdt").value;
    let diachi = document.getElementById("diachi").value;
    let checkin = document.getElementById("checkin").value;
    let checkout = document.getElementById("checkout").value;
    let soluongkhach = document.getElementById("soluongkhach").value;
    let soluongtreem = document.getElementById("soluongtreem").value;
    let kieuphong = document.getElementById("kieuphong").value;
    let ghichu = document.getElementById("ghichu").value;
  
    // Collect values of checked options
    let dichvu = [];
    let checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
    for (let checkbox of checkboxes) {
      dichvu.push(checkbox.value);
    }
  
    // Create JSON object
    let data = {
      MaPhieu: maphieu,
      TenKhachHang: hoten,
      SDT: sdt,
      Email: email,
      DiaChi: diachi,
      SoNguoiLon: soluongkhach,
      SoTreEm: soluongtreem,
      NgayDenNhan: checkin,
      NgayTra: checkout,
      MaLoaiPhong: kieuphong,
      MaDichVu: dichvu,
      GhiChu: ghichu
    };

        // Send data to API endpoint 
  fetch('http://localhost:8090/api/PhieuDatPhong', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  })
  .then(response => response.json())
  .then(result => {
    // Handle the response from the API if needed
    console.log(result);
  })
  .catch(error => {
    // Handle any errors that occur during the request
    console.error(error);
  });
  
    // Print data to console
    console.log(data);
  });
