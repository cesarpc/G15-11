
function calcular_Imc() {
    var estatura = document.getElementById('idestatura').value;
    var peso = document.getElementById('idpeso').value;

    var imc = IMC(peso, estatura); //Ejecuta la funcion IMC
    document.getElementById("IMC").value = imc.resultado;

    if (imc.imc === 1) {
        document.getElementById("idIMC").value = "bpeso";
        document.getElementById("colorIMC").value = "#FA8072";
    }
    if (imc.imc === 2) {
        document.getElementById("idIMC").value = "npeso";
        document.getElementById("colorIMC").value = "#00FF00";
    }
    if (imc.imc === 3) {
        document.getElementById("idIMC").value = "speso";
        document.getElementById("colorIMC").value = "#FFFF00";
    }
    if (imc.imc === 4) {
        document.getElementById("idIMC").value = "opeso";
        document.getElementById("colorIMC").value = "#FF0000";
    }
    document.getElementById("btnCalcularIMC").click();
}

function IMC(peso, estatura) {
    estatura = estatura / 100;

    var resultado = peso / (estatura * estatura);
    resultado = (Math.round(resultado * 100) / 100).toFixed(2);
    if (resultado < 18.5) {
        return {imc: 1, descripcion: "Bajo peso", resultado: resultado};
    }
    if (resultado >= 18.51 && resultado <= 24.9) {
        return {imc: 2, descripcion: "Normal", resultado: resultado};
    }
    if (resultado >= 24.91 && resultado <= 29.9) {
        return {imc: 3, descripcion: "Sobre Peso", resultado: resultado};
    }
    if (resultado >= 29.91) {
        return {imc: 4, descripcion: "Obeso", resultado: resultado};
    }
}

/*
 function deshabilitaRetroceso() {
 window.location.hash = "no-back-button";
 window.location.hash = "Again-No-back-button"; //chrome
 window.onhashchange = function() { window.location.hash = "no-back-button"; }
 }*/
