<%-- 
    Document   : principal
    Created on : 29-oct-2021, 21:47:33
    Author     : Einer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${datosUsuario eq null}">
    <%response.sendRedirect("index.jsp");%>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-5.1.3/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap-5.1.3/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="bootstrap-5.1.3/popper/popper.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--CDN para crar graficas-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@latest/dist/Chart.min.js"></script>
        <!--tabla-->
        <link href="dataTable/datatables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <script src="dataTable/datatables.min.js" type="text/javascript"></script>
        <script src="dataTable/datatables.bootstrap4.min.js" type="text/javascript"></script>

        <title>IMC</title>
    </head>
    <body>
        <script type="text/javascript">
            $(document).ready(function () {
            <c:if test="${modalConfirmacionOk ne null or modalConfirmacionError ne null}">
                document.getElementById("btnModalConfirmacionOk").click();
            </c:if>

            <c:if test="${actualizarDatos}">
                document.getElementById("btnActualizarDatos").click();
            </c:if>

                var dataLista = [];
                var dataListaG = [];
                var dataGrafica = [];
                var dataGraficaG = [];
                var dataUsuarios = [];

            <c:set var="i" value="0"/>
            <c:forEach var="d" items="${datosHistoricoIndividaul}">
                dataLista.push(
                        {
                            IdHistoricoIMC: "${d.getIdHistoricoIMC()}",
                            Peso: "${d.getPeso()}" + " - KG",
                            Estatura: "${d.getEstatura()}" + " - CM",
                            Edad: "${d.getEdad()}" + " - AÑOS",
                            IMC: "${d.getImc()}",
                            Create: "${d.getCreate()}"
                        }
                );
                dataGrafica.push(
                        {
                            imc: "${d.getImc()}",
                            peso: ${d.getPeso()},
                            estatura: "${d.getEstatura()}",
                            edad: "${d.getEdad()}",
                            descripcion: "",
                            clasificacion: 22
                        }
                );
                <c:set var="i" value="${i + 1}"/>
            </c:forEach>

            <c:forEach var="d" items="${datosHistoricoGeneral}">
                dataListaG.push(
                        {
                            IdHistoricoIMC: "${d.getIdHistoricoIMC()}",
                            Peso: "${d.getPeso()}" + " - KG",
                            Estatura: "${d.getEstatura()}" + " - CM",
                            Edad: "${d.getEdad()}" + " - AÑOS",
                            IMC: "${d.getImc()}",
                            Create: "${d.getCreate()}"
                        }
                );
                dataGraficaG.push(
                        {
                            imc: "${d.getImc()}",
                            peso: ${d.getPeso()},
                            estatura: "${d.getEstatura()}",
                            edad: "${d.getEdad()}",
                            descripcion: "",
                            clasificacion: 22
                        }
                );
                <c:set var="i" value="${i + 1}"/>
            </c:forEach>
            <c:forEach var="d" items="${datosListarUsuarios}">
                dataUsuarios.push(
                        {
                            IdUsuario: "${d.getIdUsuario()}",
                            Identificacion: "${d.getIdentificacion()}",
                            Nonmbre: "${d.getNombre()}",
                            Apellido: "${d.getApellido()}",
                            Edad: "${d.getEdad()}",
                            Estatura: "${d.getEstatura()}",
                            Peso: "${d.getPeso()}",
                            Correo: "${d.getCorreo()}",
                            Celular: "${d.getCelular()}",
                            Rol: "${d.getRol()}",
                            Activo: "${d.getActivo()}",
                            Create: "${d.getCreate()}"
                        }
                );

                <c:set var="i" value="${i + 1}"/>
            </c:forEach>

                listaIMCIndividual(dataLista);
                listaIMCGeneral(dataListaG);
                graficasIndividual(dataGrafica);
                graficasGeneral(dataGraficaG);
                listaUsuarios(dataUsuarios);
            });


        </script>
        <div id="body">
            <div class="logoMVdiv">
                <img src="img/pngegg.png" id="logoMV" alt="Logo">
            </div>
            <div class="boton-menu" onclick="cambiarMenu()">
                <i class="fa fa-bars fa-2x" aria-hidden="true"></i>
                <a class="boton-menu-a"> YrTec_CalculoIMC</a>
            </div>
            <ul class="nav nav-pills justify-content-end" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-help" type="button" role="tab" aria-controls="pills-help" aria-selected="false">Ayuda</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Contacto</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Más sobre Imc</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Inicio</button>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" href="UsuarioSerlevlet?accionBtn=cerrarSesion"><i class="fa fa-sign-in fa-1x" style="color: #FFFFFF;" aria-hidden="true"></i></a>
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                    <!---->
                    <div class="contenido">
                        <div class="menu-vertical">
                            <div class="boton-menu2" onclick="cambiarMenu2()">
                                <div class="row">
                                    <div class="col-12">
                                        <i class="fa fa-chevron-circle-down fa-2x" id="btnMenu2" style=" transform: rotate(-90deg);" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex align-items-start">
                            <div class="nav flex-column nav-pills col-3" id="v-pills-tab" onclick="" role="tablist" aria-orientation="vertical">
                                <div class="container text-center" id="datosUsuario">
                                    <br>
                                    <button style="border: none; background: none;" id="btnActualizarDatos" type="button" data-bs-toggle="modal" data-bs-target="#modaldatosUser">
                                        <i class="fa fa-user-circle-o fa-5x" aria-hidden="true"></i>
                                    </button>
                                    <br><br>
                                    <a id="rol">${datosUsuario.getRol()}</a><br>
                                    <a id="nombre">${datosUsuario.getNombre()}</a><br>
                                    <a id="apellido">${datosUsuario.getApellido()}</a><br>
                                    <a id="correo">${datosUsuario.getCorreo()}</a><br><br>
                                </div>
                                <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Calcular su IMC</button>
                                <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Lista IMC</button>
                                <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Gráficas IMC</button>
                                <c:if test="${datosUsuario.getRol() eq 'Super Administrador' or datosUsuario.getRol() eq 'Administrador'}">
                                    <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-users" type="button" role="tab" aria-controls="v-pills-users" aria-selected="false">Administrar Usuarios</button>
                                    <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">Configuración</button>
                                </c:if>
                            </div>
                            <div class="tab-content col-9" id="v-pills-tabContent">
                                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                    <div class="titulos">
                                        <h3>Calcular índice de masa corporal - IMC</h3>
                                    </div>
                                    <div class="container" id="contenedor">
                                        <br>
                                        <div class="row">
                                            <div class="col-3" id="clase-ant-imc"></div>
                                            <div class="card col-6" id="contenedor-imc">
                                                <div class="card-body">
                                                    <p>Ingrese sus datos</p>
                                                    <form action="IndiceIMCServlet" method="post">
                                                        <input type="hidden" name="idUsuario" value="${datosUsuario.getIdUsuario()}">
                                                        Edad:
                                                        <input class="form-control" type="number" step="any" name="edad" id="idEdad" value="${datosUsuario.getEdad()}" placeholder="Edad (en años)" required=""><br>
                                                        Estatura:
                                                        <input class="form-control" type="number" step="any" name="estatura" id="idestatura" value="${datosUsuario.getEstatura()}" placeholder="Estatura (en centímetros)" required=""><br>
                                                        Peso:
                                                        <input class="form-control" type="number" step="any" name="peso" id="idpeso" value="${datosUsuario.getPeso()}" placeholder="Peso (en kilogramos)" required=""><br>

                                                        <input type="hidden" id="idIMC" name="idIMC">
                                                        <input type="hidden" id="IMC" name="IMC">
                                                        <input type="hidden" id="colorIMC" name="colorIMC">
                                                        <div class="form-group text-center">
                                                            <a class="btn btn-primary" onclick="calcular_Imc()">Calcular IMC</a>
                                                            <input style="display: none;" id="btnCalcularIMC" class="btn btn-primary" name="accionBtn" type="submit" value="Calcular IMC">
                                                        </div>
                                                    </form>
                                                </div>
                                                <c:if test="${errorH ne null and errorH ne ''}">
                                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                        <strong>Error - </strong> ${errorH}
                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <c:if test="${datosIMC ne null}">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="form-group col-8" id="divtabla">
                                                    <br><label>Resutado:</label><br>
                                                    <input class="form-control" type="text" id="resultado" value="${IMC}" disabled="true"><br>
                                                    <table class="" id="tabla">
                                                        <header>
                                                            <tr>
                                                                <th>Imc</th>
                                                                <th>Peso</th>
                                                            </tr>
                                                        </header>

                                                        <body>
                                                        <tr id="bpeso" <c:if test="${idIMC eq 'bpeso'}"> style="background-color:${colorIMC};"</c:if>> 
                                                                <td>Por debajo de 18.5</td>
                                                                <td>Bajo peso</td>
                                                            </tr>
                                                            <tr id="npeso" <c:if test="${idIMC eq 'npeso'}"> style="background-color:${colorIMC};"</c:if>>
                                                                <td>18.5—24.9</td>
                                                                <td>Normal</td>
                                                            </tr>
                                                            <tr id="speso" <c:if test="${idIMC eq 'speso'}"> style="background-color:${colorIMC};"</c:if>>
                                                                <td>24.9—29.9</td>
                                                                <td>Sobrepeso</td>
                                                            </tr>
                                                            <tr id="opeso" <c:if test="${idIMC eq 'opeso'}"> style="background-color:${colorIMC};"</c:if>>
                                                                <td>29.9 o más</td>
                                                                <td>Obeso</td>
                                                            </tr>
                                                            </body>
                                                        </table>
                                                        <br>
                                                    </div>
                                                </div> 
                                        </c:if>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                    <div class="titulos">
                                        <h3>Listado índice de masa corporal - IMC</h3>
                                    </div>
                                    <div class="container" id="contenedor">
                                        <div cass="row">
                                            <div class="col-12 text-center">
                                                <h4 id="">Lista consultas individual</h4>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <table id="tablaDatosImc" class="table table-striped table-bordered" style="width:100%;">
                                                <thead>
                                                    <tr>
                                                        <th>Id Hstorico IMC</th>
                                                        <th>Peso</th>
                                                        <th>Estatura</th>
                                                        <th>Edad</th>
                                                        <th>IMC</th>
                                                        <th>Fecha</th>
                                                    </tr>
                                                </thead>
                                            </table><br><br>
                                        </div>
                                        <hr>
                                        <div cass="row">
                                            <div class="col-12 text-center">
                                                <h4 id="">Lista consultas general</h4>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <table id="tablaDatosImcG" class="table table-striped table-bordered" style="width:100%;">
                                                <thead>
                                                    <tr>
                                                        <th>Id Hstorico IMC</th>
                                                        <th>Peso</th>
                                                        <th>Estatura</th>
                                                        <th>Edad</th>
                                                        <th>IMC</th>
                                                        <th>Fecha</th>
                                                    </tr>
                                                </thead>
                                            </table><br><br>
                                        </div>

                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                    <div class="titulos">
                                        <h3>Reportes índice de masa corporal - IMC</h3>
                                    </div>
                                    <div class="container" id="contenedor">
                                        <div class="row">
                                            <div class="col-12 text-center">
                                                <h4 id="totalIndividual"></h4>
                                            </div>
                                            <div class="col-6" id="barras">
                                                <canvas id="graficaBarras"></canvas>
                                            </div>
                                            <div class="col-6" id="pie">
                                                <canvas id="graficaPie"></canvas>
                                            </div>
                                            <div class="col-6" id="line">
                                                <canvas id="graficaLine"></canvas><br><br>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-12 text-center">
                                                <h4 id="totalPersonas"></h4>
                                            </div>
                                            <div class="col-6" id="barras">
                                                <canvas id="graficaBarrasG"></canvas>
                                            </div>
                                            <div class="col-6" id="pie">
                                                <canvas id="graficaPieG"></canvas>
                                            </div>
                                            <div class="col-6" id="line">
                                                <canvas id="graficaLineG"></canvas><br><br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${datosUsuario.getRol() eq 'Super Administrador' or datosUsuario.getRol() eq 'Administrador'}">
                                    <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                        <div class="titulos">
                                            <h3>Configuraciones</h3>
                                        </div>
                                        <div class="container" id="contenedor">
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-users" role="tabpanel" aria-labelledby="v-pills-users-tab">
                                        <div class="titulos">
                                            <h3>Administrar Usuarios</h3>
                                        </div>
                                        <div class="container" id="contenedor">
                                            <table id="tablaDatosUsu" class="table table-striped table-bordered" style="width:100%;">
                                                <thead>
                                                    <tr>
                                                        <th>Id Usuario</th>
                                                        <th>Identificación</th>
                                                        <th>Nombre</th>
                                                        <th>Apellido</th>
                                                        <th>Edad</th>
                                                        <th>Estatura</th>
                                                        <th>Peso</th>
                                                        <th>Correo</th>
                                                        <th>Celular</th>
                                                        <th>Rol</th>
                                                        <th>Estado</th>
                                                        <th>Creación</th>
                                                    </tr>
                                                </thead>
                                            </table><br><br>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                    <iframe style="width: 100%; height: 90vh;" src="sobreIMC.html" frameborder="0" allowfullscreen></iframe>
                </div>
                <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                    <iframe style="width: 100%; height: 90vh;" src="contacto.html" frameborder="0" allowfullscreen></iframe>
                </div>
                <div class="tab-pane fade" id="pills-help" role="tabpanel" aria-labelledby="pills-help-tab">
                    <iframe style="width: 100%; height: 90vh;" src="ayuda.html" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>


            <!--Modals-->

            <div class="modal" tabindex="-1" id="modaldatosUser">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Actualizar Datos</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="UsuarioSerlevlet" method="POST">
                            <div class="modal-body">
                                <input type="hidden" name="IdUsuario" value="${datosUsuario.getIdUsuario()}">
                                <input type="hidden" name="identificacion" value="${datosUsuario.getIdentificacion()}">

                                <div class="mb-3">
                                    Edad:
                                    <input type="number" name="edad" id="usu" class="form-control" value="${datosUsuario.getEdad()}" placeholder="Edad" required>
                                </div>
                                <div class="mb-3">
                                    Estatura:
                                    <input type="number" name="estatura" id="pass" class="form-control" value="${datosUsuario.getEstatura()}" placeholder="Estatura" required>
                                </div>
                                <div class="mb-3">
                                    Peso:
                                    <input type="text" name="peso" id="usu" class="form-control" value="${datosUsuario.getPeso()}" placeholder="Peso" required>
                                </div>
                                <div class="mb-3">
                                    Correo:
                                    <input type="Email" name="correo" id="pass" class="form-control" value="${datosUsuario.getCorreo()}" placeholder="Correo" required>
                                </div>
                                <div class="mb-3">
                                    Celular:
                                    <input type="text" name="celular" id="usu" class="form-control" value="${datosUsuario.getCelular()}" placeholder="Celular" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="mb-3">
                                    <input type="submit" name="accionBtn" class="form-control btn btn-primary" value="Actualizar">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <button type="button" style="display:none;" id="btnModalConfirmacionOk" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalConfirmacionOk">            </button>
            <div class="modal" tabindex="-1" id="modalConfirmacionOk">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Información</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ${modalConfirmacionOk}
                            ${modalConfirmacionError}
                            <br>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/js.js" type="text/javascript"></script>
        <script src="js/jsMenu2.js" type="text/javascript"></script>
        <script src="js/tablas.js" type="text/javascript"></script>
        <script src="js/graficas.js" type="text/javascript"></script>
    </body>
</html>
