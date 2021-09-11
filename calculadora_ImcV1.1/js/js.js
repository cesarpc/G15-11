$(document).ready(function() {
    obtenerSesion();

    var dataSet = datosImc();

    for (var i = 0; i < dataSet.length; i++) {
        var imcC = IMC(dataSet[i].peso, dataSet[i].estatura);
        dataSet[i].imc = imcC.resultado;
        dataSet[i].descripcion = imcC.descripcion;
        dataSet[i].clasificacion = imcC.imc;
    }

    graficas(dataSet);

    $('#tablaDatosImc').DataTable({
        data: dataSet,
        columns: [
            { "data": "identificacion" },
            { "data": "nombres" },
            { "data": "correo" },
            { "data": "edad" },
            { "data": "estatura" },
            { "data": "peso" },
            { "data": "imc" },
            { "data": "descripcion" }
        ],
        pageLength: 25,
        columnDefs: [{ //Centro el contenido de las n últimas columnas
            className: "text-center",
        }],
        hideEmptyCols: true,
        destroy: true,
        rowCallback: function(row, data, index) {
            if (data.imc < 18.5) {
                $(row).find('td:eq(6), td:eq(7)').css('background-color', '#FA8072');
            }
            if (data.imc >= 18.51 && data.imc <= 24.9) {
                $(row).find('td:eq(6), td:eq(7)').css('background-color', '#00FF00');
            }
            if (data.imc >= 24.91 && data.imc <= 29.9) {
                $(row).find('td:eq(6), td:eq(7)').css('background-color', '#FFFF00');
            }
            if (data.imc >= 29.91) {
                $(row).find('td:eq(6), td:eq(7)').css('background-color', '#FF0000');
            }
        }
    });
    document.getElementById("pills-home-tab").click();
});

function graficas(dataSet) {
    var bPeso = 0;
    var normal = 0;
    var sPeso = 0;
    var obeso = 0;

    var edad1 = 0;
    var edad2 = 0;
    var edad3 = 0;
    var edad4 = 0;

    var sizeData = dataSet.length;

    for (var i = 0; i < dataSet.length; i++) {
        if (dataSet[i].clasificacion === 1) {
            bPeso += 1;
        }
        if (dataSet[i].clasificacion === 2) {
            normal += 1;
        }
        if (dataSet[i].clasificacion === 3) {
            sPeso += 1;
        }
        if (dataSet[i].clasificacion === 4) {
            obeso += 1;
        }

        if (dataSet[i].edad <= 20) {
            edad1 += 1;
        }
        if (dataSet[i].edad > 20 && dataSet[i].edad <= 25) {
            edad2 += 1;
        }
        if (dataSet[i].edad > 25 && dataSet[i].edad <= 30) {
            edad3 += 1;
        }
        if (dataSet[i].edad > 30) {
            edad4 += 1;
        }
    }

    document.getElementById("totalPersonas").innerHTML = "Total de personas registradas: <strong>" + sizeData +"</strong>";


    const graficaBarras = document.getElementById("graficaBarras");
    const graficaPie = document.getElementById("graficaPie");
    const graficaLine = document.getElementById("graficaLine");

    const etiquetasPeso = ["Bajo en peso", "Normal", "Sobre peso", "Obeso"];
    const etiquetasEdad = ["Menor a 20 años", "21-25 años", "26-30", "31 años en adelante"];

    const datosBarras = {
        label: "Indice de masa corporal",
        data: [bPeso, normal, sPeso, obeso], // La data es un arreglo que debe tener la misma cantidad de valores que la cantidad de etiquetas
        backgroundColor: ["rgba(117,169,255,0.6)", "rgba(61,158,58,0.6)", "rgba(208,129,222,0.6)", "rgba(196,70,68,0.6)"],
        borderColor: 'rgba(54, 162, 235, 1)', // Color del borde
        borderWidth: 1, // Ancho del borde
    };

    const datosPie = {
        label: "Indice de masa corporal",
        data: [bPeso, normal, sPeso, obeso], // La data es un arreglo que debe tener la misma cantidad de valores que la cantidad de etiquetas
        backgroundColor: ["rgba(117,169,255,0.6)", "rgba(61,158,58,0.6)", "rgba(208,129,222,0.6)", "rgba(196,70,68,0.6)"],
        borderColor: 'rgba(54, 162, 235, 1)', // Color del borde
        borderWidth: 1, // Ancho del borde
    };

    const datosLine = {
        label: "Rango de edades",
        data: [edad1, edad2, edad3, edad4], // La data es un arreglo que debe tener la misma cantidad de valores que la cantidad de etiquetas
        borderColor: 'rgb(75, 192, 192)', // Color del borde
        borderWidth: 1, // Ancho del borde
    };

    new Chart(graficaBarras, {
        type: 'bar', // Tipo de gráfica
        data: {
            labels: etiquetasPeso,
            datasets: [
                datosBarras
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }],
            },
        }
    });

    new Chart(graficaPie, {
        type: 'pie', // Tipo de gráfica
        data: {
            labels: etiquetasPeso,
            datasets: [
                datosPie
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }],
            },
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //calculate the total of this data set
                        var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
                            return previousValue + currentValue;
                        });
                        //get the current items value
                        var currentValue = dataset.data[tooltipItem.index];
                        //calculate the precentage based on the total and current item, also this does a rough rounding to give a whole number
                        var percentage = Math.floor(((currentValue / total) * 100) + 0.5);

                        return percentage + "%";
                    }
                }
            }
        }
    });

    new Chart(graficaLine, {
        type: 'line', // Tipo de gráfica
        data: {
            labels: etiquetasEdad,
            datasets: [
                datosLine
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }],
            },
        }
    });
}

function limpiar_colores() {
    document.getElementById("bpeso").style.backgroundColor = "#FFFFFF";
    document.getElementById("npeso").style.backgroundColor = "#FFFFFF";
    document.getElementById("speso").style.backgroundColor = "#FFFFFF";
    document.getElementById("opeso").style.backgroundColor = "#FFFFFF";
}

function calcular_Imc() {
    var estatura = document.getElementById('idestatura').value;
    var peso = document.getElementById('idpeso').value;

    limpiar_colores();

    var imc = IMC(peso, estatura); //Ejecuta la funcion IMC
    document.getElementById("resultado").value = imc.resultado;

    if (imc.imc === 1) {
        document.getElementById("bpeso").style.backgroundColor = "#FA8072";
    }
    if (imc.imc === 2) {
        document.getElementById("npeso").style.backgroundColor = "#00FF00";
    }
    if (imc.imc === 3) {
        document.getElementById("speso").style.backgroundColor = "#FFFF00";
    }
    if (imc.imc === 4) {
        document.getElementById("opeso").style.backgroundColor = "#FF0000";
    }
    document.getElementById("divtabla").style.display = "inline-block";
}

function IMC(peso, estatura) {
    estatura = estatura / 100;

    var resultado = peso / (estatura * estatura);
    resultado = (Math.round(resultado * 100) / 100).toFixed(2);
    if (resultado < 18.5) {
        return { imc: 1, descripcion: "Bajo peso", resultado: resultado };
    }
    if (resultado >= 18.51 && resultado <= 24.9) {
        return { imc: 2, descripcion: "Normal", resultado: resultado };
    }
    if (resultado >= 24.91 && resultado <= 29.9) {
        return { imc: 3, descripcion: "Sobre Peso", resultado: resultado };
    }
    if (resultado >= 29.91) {
        return { imc: 4, descripcion: "Obeso", resultado: resultado };
    }
}

function submitForm(event) { //Previene el submit
    event.preventDefault();
    calcular_Imc();
}
/*
function deshabilitaRetroceso() {
    window.location.hash = "no-back-button";
    window.location.hash = "Again-No-back-button"; //chrome
    window.onhashchange = function() { window.location.hash = "no-back-button"; }
}*/

function obtenerSesion() {
    if (localStorage.getItem('usuarioIMC') === null) {
        location.href = "home.html";
    } else {
        document.getElementById("nombre").innerHTML = localStorage.getItem('nombreIMC');
        document.getElementById("apellido").innerHTML = localStorage.getItem('apellidoIMC');
        document.getElementById("correo").innerHTML = localStorage.getItem('correoIMC');
    }
}

function clearSesion() {
    if (localStorage.getItem('usuarioIMC') != null) {
        localStorage.clear();
        obtenerSesion();
    }
}