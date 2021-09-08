$(document).ready(function() {
    deshabilitaRetroceso();
    obtenerSesion();
});

function limpiar_colores() {
    document.getElementById("bpeso").style.backgroundColor = "#FFFFFF";
    document.getElementById("npeso").style.backgroundColor = "#FFFFFF";
    document.getElementById("speso").style.backgroundColor = "#FFFFFF";
    document.getElementById("opeso").style.backgroundColor = "#FFFFFF";
}

function calcular_Imc() {
    var estatura = document.getElementById('idestatura').value;
    var peso = document.getElementById('idpeso').value;
    estatura = estatura / 100;
    var resultado = peso / (estatura * estatura);
    resultado = (Math.round(resultado * 100) / 100).toFixed(2);
    document.getElementById("resultado").value = resultado;

    limpiar_colores();

    if (resultado < 18.5) {
        document.getElementById("bpeso").style.backgroundColor = "#FA8072";
        console.log("prueba de color");
    }
    if (resultado >= 18.5 && resultado <= 24.9) {
        document.getElementById("npeso").style.backgroundColor = "#00FF00";
        console.log("prueba de color");
    }
    if (resultado >= 25 && resultado <= 29.9) {
        document.getElementById("speso").style.backgroundColor = "#FFFF00";
        console.log("prueba de color");
    }
    if (resultado >= 30) {
        document.getElementById("opeso").style.backgroundColor = "#FF0000";
        console.log("prueba de color");
    }
    document.getElementById("divtabla").style.display = "inline-block";
}

function submitForm(event) { //Previene el submit
    event.preventDefault();
    calcular_Imc();
}

function deshabilitaRetroceso() {
    window.location.hash = "no-back-button";
    window.location.hash = "Again-No-back-button"; //chrome
    window.onhashchange = function() { window.location.hash = "no-back-button"; }
}

function obtenerSesion() {
    if (localStorage.getItem('usuarioIMC') === null) {
        location.href = "login.html";
    }else{
        document.getElementById("nombre").value = localStorage.getItem('nombreIMC');
        document.getElementById("apellido").value = localStorage.getItem('apellidoIMC');
        document.getElementById("correo").value = localStorage.getItem('correoIMC');
    }
}

function clearSesion() {
    if (localStorage.getItem('usuarioIMC') != null) {
        localStorage.clear();
        obtenerSesion();
    }
}
