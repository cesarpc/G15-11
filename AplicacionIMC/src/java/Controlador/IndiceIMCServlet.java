package Controlador;

import DAO.HistoricoIMCDAO;
import Modelo.HistoricoIMC;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "IndiceIMCServlet", urlPatterns = {"/IndiceIMCServlet"})
public class IndiceIMCServlet extends HttpServlet {

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
        //Objetos almacenados en la sesion
        HttpSession objSesion = request.getSession(true);
        
        ArrayList<HistoricoIMCDAO> datosHistorico;
        ArrayList<HistoricoIMCDAO> datosHistoricoGeneral;
        String error = null;
        String ok = null;
        String url = "principal.jsp";
        //Datos login
        String idUsuario = request.getParameter("idUsuario");
        String edad = request.getParameter("edad");
        String peso = request.getParameter("peso");
        String estatura = request.getParameter("estatura");
        String idIMC = request.getParameter("idIMC");
        String IMC = request.getParameter("IMC");
        String colorIMC = request.getParameter("colorIMC");
        String accionBtn = request.getParameter("accionBtn");

        HistoricoIMCDAO datosIMC = new HistoricoIMCDAO();
        HistoricoIMC datosIMCC = new HistoricoIMC();

        datosIMC.setIdUsuario(idUsuario);
        datosIMC.setEdad(edad);
        datosIMC.setPeso(peso);
        datosIMC.setEstatura(estatura);
        datosIMC.setImc(IMC);

        if (accionBtn.equals("Calcular IMC")) {
            if (datosIMCC.registrarHistorico(datosIMC)) {
                datosHistorico = datosIMCC.listarHistoricoIMC(datosIMC);
                datosHistoricoGeneral = datosIMCC.listarHistoricoIMCGeneral(datosIMC);
                
                objSesion.setAttribute("datosHistoricoIndividaul", datosIMCC.listarHistoricoIMC(datosIMC));
                objSesion.setAttribute("datosHistoricoGeneral", datosIMCC.listarHistoricoIMCGeneral(datosIMC));
               
                if(datosHistorico != null){
                    objSesion.setAttribute("idIMC", idIMC);
                    objSesion.setAttribute("IMC", IMC);
                    objSesion.setAttribute("colorIMC", colorIMC);
                }else{
                     error = "No se registraron los datos ingresados";
                }
            }else{
                error = "No se registraron los datos ingresados";
            }
            objSesion.setAttribute("datosIMC", datosIMC);
        }
        objSesion.setAttribute("okH", ok);
        objSesion.setAttribute("errorH", error);
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
