function cambiarMenu() {
    var menu = document.getElementById("pills-tab").style;
    if (menu.display === "none") {
        document.getElementById("pills-tab").style.display = "flex";
    } else {
        document.getElementById("pills-tab").style.display = "none";
    }
}

function mediaQuery(x) {
    if (x.matches) { // If media query matches
        cambiarClase(0); //Min width 900px
    } else {
        cambiarClase(1);
    }
}

var x = window.matchMedia("(max-width: 900px)");
mediaQuery(x); // Call listener function at run time
x.addListener(mediaQuery); // Attach listener function on state changes

function cambiarClase(data) {

    var clase1 = 'col-3';
    var clase2 = 'card col-6';

    if (data === 0) {
        clase1 = 'col-1';
        clase2 = 'card col-10';
    }
    var claseantlog = document.getElementById('clase-ant-log');
    var containerlogin = document.getElementById('container-login');

    var claseantreg = document.getElementById('clase-ant-reg');
    var containerreg = document.getElementById('container-reg');

    var claseantpass = document.getElementById('clase-ant-pass');
    var containerpass = document.getElementById('container-pass');

    claseantlog.className = clase1;
    containerlogin.className = clase2;

    claseantreg.className = clase1;
    containerreg.className = clase2;

    claseantpass.className = clase1;
    containerpass.className = clase2;

}