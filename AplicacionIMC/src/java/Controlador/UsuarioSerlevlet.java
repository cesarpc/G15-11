/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.HistoricoIMCDAO;
import DAO.UsuarioDAO;
import Modelo.HistoricoIMC;
import Modelo.Usuario;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Einer
 */
@WebServlet(name = "UsuarioSerlevlet", urlPatterns = {"/UsuarioSerlevlet"})
public class UsuarioSerlevlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //Objetos almacenados en la sesion
        HttpSession objSesion = request.getSession(true);

        String error = null;
        String ok = null;
        String modalConfirmacionError = null;
        String modalConfirmacionOk = null;
        boolean actualizarDatos = false;

        String url = "index.jsp";
        //Datos login
        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");

        //Datos Registro
        String idUsuario = request.getParameter("IdUsuario");
        String identificacion = request.getParameter("identificacion");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String celular = request.getParameter("celular");
        String confirmarContrasenia = request.getParameter("confirmarContrasenia");
        String edad = request.getParameter("edad");
        String estatura = request.getParameter("estatura");
        String peso = request.getParameter("peso");

        //Datos boton
        String accionBtn = request.getParameter("accionBtn");

        UsuarioDAO usu = new UsuarioDAO();
        Usuario usuc = new Usuario();
        HistoricoIMCDAO datosIMC = new HistoricoIMCDAO();
        HistoricoIMC datosIMCC = new HistoricoIMC();

        //Login
        usu.setUsuario(usuario);
        usu.setContrasenia(contrasenia);

        //Registro
        usu.setIdUsuario(idUsuario);
        usu.setIdentificacion(identificacion);
        usu.setNombre(nombre);
        usu.setApellido(apellido);
        usu.setCorreo(correo);
        usu.setCelular(celular);
        usu.setEdad(edad);
        usu.setEstatura(estatura);
        usu.setPeso(peso);

        if (accionBtn.equals("Iniciar Sesion")) {
            UsuarioDAO datosUsu = usuc.autenticarUsuario(usu);
            if (datosUsu != null) {
                url = "principal.jsp";
                datosIMC.setIdUsuario(datosUsu.getIdUsuario());

                objSesion.setAttribute("datosHistoricoIndividaul", datosIMCC.listarHistoricoIMC(datosIMC));
                objSesion.setAttribute("datosHistoricoGeneral", datosIMCC.listarHistoricoIMCGeneral(datosIMC));
                objSesion.setAttribute("datosListarUsuarios", usuc.listarUsuarios());
                objSesion.setAttribute("datosUsuario", datosUsu);

                if (datosUsu.getEdad() == null || datosUsu.getEstatura() == null || datosUsu.getPeso() == null) {
                    actualizarDatos = true;
                }
            } else {
                error = "Usuario invalido";
            }
        }
        if (accionBtn.equals("Registrar")) {
            if (contrasenia.equals(confirmarContrasenia)) {
                if (usuc.listarUsuarioIdIdentificacion(usu) == null) {
                    if (usuc.registrarUsuario(usu)) {
                        if (usuc.crearLogin(usu)) {
                            ok = "Usuario Registrado";
                        } else {
                            error = "Usuario Registrado, Login No Registrado";
                        }
                    } else {
                        error = "Usuario No Registrado";
                    }
                } else {
                    error = "El usuario ya existe";
                }
            } else {
                error = "Contraseñas no coinciden";
            }
            objSesion.setAttribute("datosUsuRegistro", usu);
        }

        if (accionBtn.equals("Actualizar")) {
            if (usuc.actualizarUsuario(usu)) {
                url = "principal.jsp";
                UsuarioDAO datosUsuA = usuc.listarUsuarioIdIdentificacion(usu);
                if (datosUsuA != null) {
                    objSesion.setAttribute("datosUsuario", datosUsuA);
                    modalConfirmacionOk = "Datos actualizados correctamente";
                } else {
                    modalConfirmacionError = "Datos actualizados, Error al cargar los datos, por favor inicie sesión nuevamente";
                }
            } else {
                objSesion.setAttribute("modalConfirmacionError", "Error al actualizar los datos");
            }
        }
        objSesion.setAttribute("actualizarDatos", actualizarDatos);
        objSesion.setAttribute("modalConfirmacionOk", modalConfirmacionOk);
        objSesion.setAttribute("modalConfirmacionError", modalConfirmacionError);
        objSesion.setAttribute("ok", ok);
        objSesion.setAttribute("error", error);

        if (accionBtn.equals("cerrarSesion")) {
            objSesion.invalidate();
        }

        response.sendRedirect(url);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
