function listaIMCIndividual(data){

    $('#tablaDatosImc').DataTable({
        data: data,
        columns: [
            { "data": "IdHistoricoIMC" },
            { "data": "Peso" },
            { "data": "Estatura" },
            { "data": "Edad" },
            { "data": "IMC" },
            { "data": "Create" }
        ],
        pageLength: 25,
        columnDefs: [{ //Centro el contenido de las n últimas columnas
            className: "text-center"
        }],
        hideEmptyCols: true,
        destroy: true,
        rowCallback: function(row, data, index) {
            if (data.IMC < 18.5) {
                //$(row).find('td:eq(4), td:eq(5)').css('background-color', '#FA8072');
                $(row).find('td:eq(4)').css('background-color', '#FA8072');
            }
            if (data.IMC >= 18.51 && data.IMC <= 24.9) {
                $(row).find('td:eq(4)').css('background-color', '#00FF00');
            }
            if (data.IMC >= 24.91 && data.IMC <= 29.9) {
                $(row).find('td:eq(4)').css('background-color', '#FFFF00');
            }
            if (data.IMC >= 29.91) {
                $(row).find('td:eq(4)').css('background-color', '#FF0000');
            }
        }
    });
  //  document.getElementById("pills-home-tab").click();
}
function listaIMCGeneral(data){

    $('#tablaDatosImcG').DataTable({
        data: data,
        columns: [
            { "data": "IdHistoricoIMC" },
            { "data": "Peso" },
            { "data": "Estatura" },
            { "data": "Edad" },
            { "data": "IMC" },
            { "data": "Create" }
        ],
        pageLength: 25,
        columnDefs: [{ //Centro el contenido de las n últimas columnas
            className: "text-center"
        }],
        hideEmptyCols: true,
        destroy: true,
        rowCallback: function(row, data, index) {
            if (data.IMC < 18.5) {
                //$(row).find('td:eq(4), td:eq(5)').css('background-color', '#FA8072');
                $(row).find('td:eq(4)').css('background-color', '#FA8072');
            }
            if (data.IMC >= 18.51 && data.IMC <= 24.9) {
                $(row).find('td:eq(4)').css('background-color', '#00FF00');
            }
            if (data.IMC >= 24.91 && data.IMC <= 29.9) {
                $(row).find('td:eq(4)').css('background-color', '#FFFF00');
            }
            if (data.IMC >= 29.91) {
                $(row).find('td:eq(4)').css('background-color', '#FF0000');
            }
        }
    });
   // document.getElementById("pills-home-tab").click();
}

function listaUsuarios(data){

    $('#tablaDatosUsu').DataTable({
        data: data,
        columns: [
            { "data": "IdUsuario" },
            { "data": "Identificacion" },
            { "data": "Nonmbre" },
            { "data": "Apellido" },
            { "data": "Edad" },
            { "data": "Estatura" },
            { "data": "Peso" },
            { "data": "Correo" },
            { "data": "Celular" },
            { "data": "Rol" },
            { "data": "Activo" },
            { "data": "Create" }
        ],
        pageLength: 25,
        columnDefs: [{ //Centro el contenido de las n últimas columnas
            className: "text-center"
        }],
        hideEmptyCols: true,
        destroy: true,
        rowCallback: function(row, data, index) {
            if (data.Activo === 0) {
                $(row).find('td:eq(10)').css('background-color', '#FF0000');
            }else{
                $(row).find('td:eq(10)').css('background-color', '#00FF00');
            }
        }
    });
   // document.getElementById("pills-home-tab").click();
}
