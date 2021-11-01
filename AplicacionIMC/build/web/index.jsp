<%-- 
    Document   : index
    Created on : 29-oct-2021, 19:26:36
    Author     : Einer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${datosUsuario ne null}">
    <%response.sendRedirect("principal.jsp");%>
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

        <title>IMC</title>
    </head>
    <body>
        <div id="body">
            <div class="">
                <div class="logoMVdiv">
                    <img src="img/pngegg.png" id="logoMV" alt="Logo">
                </div>
                <div class="boton-menu" onclick="cambiarMenu()">
                    <i class="fa fa-bars fa-2x" aria-hidden="true"></i>
                    <a class="boton-menu-a"> YrTec_CalculoIMC</a>
                </div>
                <ul class="nav nav-pills justify-content-end" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link"  style="display: none;" id="pills-registro-tab" data-bs-toggle="pill" data-bs-target="#pills-registro" type="button" role="tab" aria-controls="pills-registro" aria-selected="true"></a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" style="display: none;" id="pills-rpass-tab" data-bs-toggle="pill" data-bs-target="#pills-rpass" type="button" role="tab" aria-controls="pills-rpass" aria-selected="false"></a>
                    </li>
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
                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Inicio</button>
                    </li>
                </ul>
                <br>
                <br>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        <br>
                        <div class="container">
                            <div class="contenedor">
                                <div class="row">
                                    <div class="col-3" id="clase-ant-log"></div>
                                    <div class="card col-6" id="container-login">
                                        <div class="card-header text-center">
                                            <h3>Inicio de sesión</h3>
                                        </div>
                                        <div class="body"><br>
                                            <form action="UsuarioSerlevlet" method="POST">
                                                <div class="mb-3">
                                                    <input type="text" name="usuario" class="form-control" placeholder="Usuario" required>
                                                </div>
                                                <div class="mb-3">
                                                    <input type="password" name="contrasenia" class="form-control" placeholder="Contraseña" required>
                                                </div>
                                                <br>
                                                <div class="mb-3">
                                                    <input type="submit" name="accionBtn" class="form-control btn btn-primary" value="Iniciar Sesion">
                                                </div>
                                            </form>
                                            <div id="alerta" class="alert alert-danger alert-dismissible fade show" style="display: none;" role="alert">
                                                <strong>
                                                    <p id="error"></p>
                                                </strong>
                                            </div>
                                            <c:if test="${error ne null and error ne ''}">
                                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                    <strong>Error - </strong> ${error}
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                            </c:if>
                                            <c:if test="${ok ne null and ok ne ''}">
                                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                    <strong>Ok - </strong> ${ok}
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="card-footer">
                                            <a onclick="document.getElementById('pills-rpass-tab').click()" href="#">Recuperar tu contraseña</a><br>
                                            Si no tienes una cuenta, registrate <a href="#" onclick="document.getElementById('pills-registro-tab').click()">aquí</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                        <div class="contenedor">
                            <iframe style="width: 100%; height: 90vh;" src="sobreIMC.html" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                        <div class="contenedor">
                            <iframe style="width: 100%; height: 90vh;" src="contacto.html" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-help" role="tabpanel" aria-labelledby="pills-help-tab">
                        <div class="contenedor">
                            <iframe style="width: 100%; height: 90vh;" src="ayuda.html" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-registro" role="tabpanel" aria-labelledby="pills-registro-tab">
                        <div class="container">
                            <div class="contenedor">
                                <div class="row">
                                    <div class="col-3" id="clase-ant-reg"></div>
                                    <div class="card col-6" id="container-reg">
                                        <div class="card-header text-center">
                                            <h3>Registro Usuario</h3>
                                        </div>
                                        <div class="card-body"><br>
                                            <form action="UsuarioSerlevlet" method="POST">
                                                <div class="row">
                                                 
                                                    <div class="mb-3 col-12">
                                                        Identificación:
                                                        <input type="number" name="identificacion" class="form-control" value="${datosUsuRegistro.getIdentificacion()}" placeholder="Identificación" required>
                                                    </div>
                                                    <div class="mb-3 col-6">
                                                        Nombre:
                                                        <input type="text" name="nombre" class="form-control" value="${datosUsuRegistro.getNombre()}" placeholder="Nombre" required>
                                                    </div>
                                                    
                                                    <div class="mb-3 col-6">
                                                        Apellido:
                                                        <input type="text" name="apellido"class="form-control" value="${datosUsuRegistro.getApellido()}" placeholder="Apellido" required>
                                                    </div>
                                                    <div class="mb-3 col-6">
                                                        Correo:
                                                        <input type="email" name="correo" class="form-control" value="${datosUsuRegistro.getCorreo()}" placeholder="Correo (name@example.com)" required>
                                                    </div>
                                                    <div class="mb-3 col-6">
                                                        No. Celular:
                                                        <input type="text" name="celular"class="form-control" value="${datosUsuRegistro.getCelular()}" placeholder="Celular" required>
                                                    </div>
                                                    <div class="mb-3 col-6">
                                                        Contraseña:
                                                        <input type="password" name="contrasenia"class="form-control" placeholder="Contraseña" required>
                                                    </div>
                                                    <div class="mb-3 col-6">
                                                        Confirmar Contraseña:
                                                        <input type="password" name="confirmarContrasenia" class="form-control" placeholder="Confirmar Contraseña" required>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="mb-3 text-center">
                                                    <a onclick="document.getElementById('pills-home-tab').click()" class="btn btn-secondary" width="80px">Cancelar</a>
                                                    <input type="submit" class="btn btn-primary" name="accionBtn" width="80" value="Registrar">
                                                </div>
                                            </form>
                                            <div id="alerta" class="alert alert-danger alert-dismissible fade show" style="display: none;" role="alert">
                                                <strong>
                                                    <p id="error"></p>
                                                </strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-rpass" role="tabpanel" aria-labelledby="pills-rpass-tab">

                        <div class="container">
                            <div class="contenedor">
                                <div class="row">
                                    <div class="col-3" id="clase-ant-pass"></div>
                                    <div class="card col-6" id="container-pass">
                                        <div class="card-header text-center">
                                            <h3>Recuperar Contraseña</h3>
                                        </div>
                                        <div class="body"><br>
                                            <form onsubmit="">
                                                <div class="mb-3">
                                                    <input type="email" class="form-control" placeholder="Correo electrónico" required>
                                                </div>
                                                <div class="mb-3">
                                                    <input type="number" class="form-control" placeholder="Identificacion" required>
                                                </div>
                                                <br>
                                                <div class="mb-3 text-center">
                                                    <a onclick="document.getElementById('pills-home-tab').click()" class="btn btn-secondary" width="80px">Cancelar</a>
                                                    <input type="submit" class="btn btn-primary" width="80" value="Solicitar">
                                                </div>
                                            </form>
                                            <div id="alerta" class="alert alert-danger alert-dismissible fade show" style="display: none;" role="alert">
                                                <strong>
                                                    <p id="errorC"></p>
                                                </strong>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            Si no tienes una cuenta, registrate <a href="#" onclick="document.getElementById('pills-registro-tab').click()">aquí</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jsMenu1.js" type="text/javascript"></script>
    </body>
</html>
