function graficasIndividual(dataSet) {
        for (var i = 0; i < dataSet.length; i++) {
        var imcC = IMC(dataSet[i].peso, dataSet[i].estatura);
        dataSet[i].descripcion = imcC.descripcion;
        dataSet[i].clasificacion = imcC.imc;
    }
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

    document.getElementById("totalIndividual").innerHTML = "Total historico consultas individual: <strong>" + sizeData + "</strong>";

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
        borderWidth: 1 // Ancho del borde
    };

    const datosPie = {
        label: "Indice de masa corporal",
        data: [bPeso, normal, sPeso, obeso], // La data es un arreglo que debe tener la misma cantidad de valores que la cantidad de etiquetas
        backgroundColor: ["rgba(117,169,255,0.6)", "rgba(61,158,58,0.6)", "rgba(208,129,222,0.6)", "rgba(196,70,68,0.6)"],
        borderColor: 'rgba(54, 162, 235, 1)', // Color del borde
        borderWidth: 1 // Ancho del borde
    };

    const datosLine = {
        label: "Rango de edades",
        data: [edad1, edad2, edad3, edad4], // La data es un arreglo que debe tener la misma cantidad de valores que la cantidad de etiquetas
        borderColor: 'rgb(75, 192, 192)', // Color del borde
        borderWidth: 1 // Ancho del borde
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
                    }]
            }
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
                    }]
            },
            tooltips: {
                callbacks: {
                    label: function (tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //calculate the total of this data set
                        var total = dataset.data.reduce(function (previousValue, currentValue, currentIndex, array) {
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
                    }]
            }
        }
    });
}

function graficasGeneral(dataSet) {
        for (var i = 0; i < dataSet.length; i++) {
        var imcC = IMC(dataSet[i].peso, dataSet[i].estatura);
        dataSet[i].descripcion = imcC.descripcion;
        dataSet[i].clasificacion = imcC.imc;
    }
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

    document.getElementById("totalPersonas").innerHTML = "Total historico consultas general: <strong>" + sizeData + "</strong>";

    const graficaBarras = document.getElementById("graficaBarrasG");
    const graficaPie = document.getElementById("graficaPieG");
    const graficaLine = document.getElementById("graficaLineG");

    const etiquetasPeso = ["Bajo en peso", "Normal", "Sobre peso", "Obeso"];
    const etiquetasEdad = ["Menor a 20 años", "21-25 años", "26-30", "31 años en adelante"];

    const datosBarras = {
        label: "Indice de masa corporal",
        data: [bPeso, normal, sPeso, obeso], // La data es un arreglo que debe tener la misma cantidad de valores que la cantidad de etiquetas
        backgroundColor: ["rgba(117,169,255,0.6)", "rgba(61,158,58,0.6)", "rgba(208,129,222,0.6)", "rgba(196,70,68,0.6)"],
        borderColor: 'rgba(54, 162, 235, 1)', // Color del borde
        borderWidth: 1 // Ancho del borde
    };

    const datosPie = {
        label: "Indice de masa corporal",
        data: [bPeso, normal, sPeso, obeso], // La data es un arreglo que debe tener la misma cantidad de valores que la cantidad de etiquetas
        backgroundColor: ["rgba(117,169,255,0.6)", "rgba(61,158,58,0.6)", "rgba(208,129,222,0.6)", "rgba(196,70,68,0.6)"],
        borderColor: 'rgba(54, 162, 235, 1)', // Color del borde
        borderWidth: 1 // Ancho del borde
    };

    const datosLine = {
        label: "Rango de edades",
        data: [edad1, edad2, edad3, edad4], // La data es un arreglo que debe tener la misma cantidad de valores que la cantidad de etiquetas
        borderColor: 'rgb(75, 192, 192)', // Color del borde
        borderWidth: 1 // Ancho del borde
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
                    }]
            }
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
                    }]
            },
            tooltips: {
                callbacks: {
                    label: function (tooltipItem, data) {
                        //get the concerned dataset
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        //calculate the total of this data set
                        var total = dataset.data.reduce(function (previousValue, currentValue, currentIndex, array) {
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
                    }]
            }
        }
    });
}

