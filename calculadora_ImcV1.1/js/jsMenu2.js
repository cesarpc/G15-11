function cambiarMenu() {
    var menu = document.getElementById("pills-tab").style;
    if (menu.display === "none") {
        document.getElementById("pills-tab").style.display = "flex";
    } else {
        document.getElementById("pills-tab").style.display = "none";
    }
}
function cambiarMenu2() {
    var menu = document.getElementById("v-pills-tab").getBoundingClientRect();
    var btnMenu2 = document.getElementById("btnMenu2").style;
    //menu.transform="translateX(720px)";
    if (menu.x === -800 || menu.x === -1600) {
        document.getElementById("v-pills-tab").style.transform = "translateX(800px)";
        btnMenu2.transform = "rotate(90deg)";
    } else {
        document.getElementById("v-pills-tab").style.transform = "translateX(-800px)";
        btnMenu2.transform = "rotate(-90deg)";
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
    var clase3 = 'tab-content col-9';
    var clase4 = 'col-6';

    if (data === 0) {
        clase1 = 'col-1';
        clase2 = 'card col-10';
        clase3 = 'tab-content col-12';
        clase4 = 'col-12';
        document.getElementById("v-pills-tab").setAttribute("onclick","cambiarMenu2()");

    } else {
        document.getElementById("v-pills-tab").setAttribute( "onclick","");
        document.getElementById("v-pills-tab").style.transform = "translateX(0)";
        document.getElementById("btnMenu2").style.transform = "rotate(-90deg)";
    }

    var tabContent = document.getElementById('v-pills-tabContent');
    var claseantpimc = document.getElementById('clase-ant-imc');
    var containerimc = document.getElementById('contenedor-imc');

    var barras = document.getElementById('barras');
    var pie = document.getElementById('pie');
    var line = document.getElementById('line');

    tabContent.className = clase3;
    claseantpimc.className = clase1;
    containerimc.className = clase2;

    barras.className = clase4;
    pie.className = clase4;
    line.className = clase4;
}