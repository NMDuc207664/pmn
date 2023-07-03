// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function () {
    modal.style.display = "block";
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

  
document.getElementById("myBtn").addEventListener("click", function(event) {
    event.preventDefault();
  
    // Collect data from form
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
  
    // Print data to console
    console.log(data);
  });
  

    // // Create JSON object
    // let data = {
    //   TenKhachHang: hoten,
    //   SDT: sdt,
    //   Email: email,
    //   DiaChi: diachi,
    //   SoNguoiLon: soluongkhach,
    //   SoTreEm: soluongtreem,
    //   NgayDenNhan: checkin,
    //   NgayTra: checkout,
    //   MaLoaiPhong: kieuphong,
    //   //MaDichVu: dichvu,
    //   GhiChu: ghichu
    // };
