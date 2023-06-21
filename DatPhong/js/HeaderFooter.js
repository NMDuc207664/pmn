// Define the HTML code for the header
var headerHTML = '<div id="header">This is the header</div>';

// Insert the header into the page
document.body.insertAdjacentHTML('afterbegin', headerHTML);

// Define the HTML code for the footer
var footerHTML = '<div id="footer">This is the footer</div>';

// Insert the footer into the page
document.body.insertAdjacentHTML('beforeend', footerHTML);

// Load the header
var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function () {
  if (this.readyState == 4 && this.status == 200) {
    document.getElementById("header").innerHTML = this.responseText;
  }
};
xhr.open("GET", "header.html", true);
xhr.send();

// Load the footer
var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function () {
  if (this.readyState == 4 && this.status == 200) {
    document.getElementById("footer").innerHTML = this.responseText;
  }
};
xhr.open("GET", "footer.html", true);
xhr.send();

var styles = `
body {
  margin-top: 70px;
  min-height: 100vh;
  margin-bottom: -300px; /* Set this value to be equal to the height of your footer */
}

a {
  color: #000;
}

/* header */
.header {
  font-family: Helvetica, sans-serif;
  top: 0;
  left: 0;
  right: 0;
}

.header {
  background-color: #fff;
  box-shadow: 1px 1px 4px 0 rgba(0,0,0,.1);
  position: fixed;
  width: 100%;
  z-index: 3;
}

.header ul {
  margin: 0;
  padding: 0;
  list-style: none;
  overflow: hidden;
  background-color: #fff;
}

.header li a {
  display: block;
  padding: 20px 20px;
  border-right: 1px solid #f4f4f4;
  text-decoration: none;
}

.header li a:hover,
.header .menu-btn:hover {
  background-color: #f4f4f4;
}

.header .logo {
  display: block;
  float: left;
  font-size: 2em;
  padding: 10px 20px;
  text-decoration: none;
}

/* menu */

.header .menu {
  clear: both;
  max-height: 0;
  transition: max-height .2s ease-out;
}

/* menu icon */

.header .menu-icon {
  cursor: pointer;
  display: inline-block;
  float: right;
  padding: 28px 20px;
  position: relative;
  user-select: none;
}

.header .menu-icon .navicon {
  background: #333;
  display: block;
  height: 2px;
  position: relative;
  transition: background .2s ease-out;
  width: 18px;
}

.header .menu-icon .navicon:before,
.header .menu-icon .navicon:after {
  background: #333;
  content: '';
  display: block;
  height: 100%;
  position: absolute;
  transition: all .2s ease-out;
  width: 100%;
}

.header .menu-icon .navicon:before {
  top: 5px;
}

.header .menu-icon .navicon:after {
  top: -5px;
}

/* menu btn */

.header .menu-btn {
  display: none;
}

.header .menu-btn:checked ~ .menu {
  max-height: 240px;
}

.header .menu-btn:checked ~ .menu-icon .navicon {
  background: transparent;
}

.header .menu-btn:checked ~ .menu-icon .navicon:before {
  transform: rotate(-45deg);
}

.header .menu-btn:checked ~ .menu-icon .navicon:after {
  transform: rotate(45deg);
}

.header .menu-btn:checked ~ .menu-icon:not(.steps) .navicon:before,
.header .menu-btn:checked ~ .menu-icon:not(.steps) .navicon:after {
  top: 0;
}

/* 48em = 768px */

@media (min-width: 48em) {
  .header li {
    float: left;
  }
  .header li a {
    padding: 20px 30px;
  }
  .header .menu {
    clear: none;
    float: right;
    max-height: none;
  }
  .header .menu-icon {
    display: none;
  }
}


/* footer */
.footer{
  font-family: Helvetica, sans-serif;
  background-color: #000;
  color: #fff;
  text-align: center;
  width: 100%;
  height: 300px; /* Set this value to be equal to the height of your footer */
}
.footer-container{
  width: 85vw;
  margin: 0 auto;
  padding: 30px 0;
}
.footer-container p, .footer-container a, .footer-container span{
  opacity: 0.8;
}
.footer a{
  display: block;
  color: #fff;
  text-decoration: none;
}
.social-icons{
  list-style: none;
  display: flex;
  justify-content: center;
  padding: 15px 0;
}
.social-icons li{
  margin: 0 10px;
  width: 50px;
  height: 50px;
  background: #2e2e2e;
  border-radius: 50%;
  transition: var(--transition);
  cursor: pointer;
}
.social-icons li:hover{
  background: #fff;
  color: #2e2e2e;
}
.contact-item span{
  display: block;
}
@media(min-width: 900px){
  .footer-container{
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      grid-gap: 20px;
  }
}
@media(min-width: 1170px){
  .footer{
      text-align: left;
  }
  .footer-container{
      grid-template-columns: repeat(4, 1fr);
  }
  .footer-container div:nth-child(1) p{
      padding-right: 20px;
  }
  .contact-item{
      display: grid;
      grid-template-columns: 10% 90%;
      margin-bottom: 15px;
      align-items: center;
  }
}

.showModal{
  position: fixed;
  background: transparent;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 5;
}

`;
// Create a style element
var styleElement = document.createElement('style');
styleElement.innerHTML = styles;

// Append the style element to the head of the page
document.head.appendChild(styleElement);
