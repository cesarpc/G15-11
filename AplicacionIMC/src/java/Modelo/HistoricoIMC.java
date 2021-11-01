package Modelo;

import DAO.HistoricoIMCDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Einer
 */
public class HistoricoIMC extends Conexion{
        //Variable donde se almacenará las consultas MYSQL
    String consulta;
    //varables pst y rs
    private PreparedStatement pst;
    private ResultSet rs;

    public boolean registrarHistorico(HistoricoIMCDAO obj){
         try {
            consulta = "insert into historicoimc(Peso, Estatura, Edad, IMC, IdUsuario, IdDescripcionIMC) Values(?,?,?,?,?,?);";
            pst = getConexion().prepareStatement(consulta);

            pst.setString(1, obj.getPeso());
            pst.setString(2, obj.getEstatura());
            pst.setString(3, obj.getEdad());
            pst.setString(4, obj.getImc());
            pst.setString(5, obj.getIdUsuario());
            pst.setString(6, obj.getIdDescripcion());

            if (pst.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error registro HistoricoIMC " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                System.out.println("Error registro HistoricoIMC: " + e);
            }
        }
        return false;
    }
    
    public ArrayList<HistoricoIMCDAO> listarHistoricoIMC(HistoricoIMCDAO obj) {
        try {
           //consulta = "{CALL listarHostoricoIMC(?);}";
            consulta = "SELECT * FROM historicoimc WHERE IdUsuario = ? and Activo = 1";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, obj.getIdUsuario());
            rs = pst.executeQuery();
            
            ArrayList<HistoricoIMCDAO> listar = new ArrayList();

            if (rs.absolute(1)) {
                rs.beforeFirst();

                while (rs.next()) {
                    obj = new HistoricoIMCDAO();
                    //Obtiene los datos de la base de datos 
                    obj.setIdHistoricoIMC(rs.getInt("IdHistoricoIMC"));
                    obj.setPeso(rs.getString("Peso"));
                    obj.setEstatura(rs.getString("Estatura"));
                    obj.setEdad(rs.getString("Edad"));
                    obj.setImc(rs.getString("IMC"));
                    obj.setIdUsuario(rs.getString("IdUsuario"));
                    obj.setIdDescripcion(rs.getString("IdDescripcionIMC"));
                    obj.setCreate(rs.getString("Create"));

                    listar.add(obj);
                }
               return listar;
            }

        } catch (SQLException e) {
            System.out.println("Error listar historico IMC: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("Error listar historico IMC: " + e);
            }
        }
        return null;
    }
    
    public ArrayList<HistoricoIMCDAO> listarHistoricoIMCGeneral(HistoricoIMCDAO obj) {
        try {
           //consulta = "{CALL listarHostoricoIMC(?);}";
            consulta = "SELECT * FROM historicoimc WHERE IdUsuario <> ? and Activo = 1";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, obj.getIdUsuario());
            rs = pst.executeQuery();
            
            ArrayList<HistoricoIMCDAO> listar = new ArrayList();

            if (rs.absolute(1)) {
                rs.beforeFirst();

                while (rs.next()) {
                    obj = new HistoricoIMCDAO();
                    //Obtiene los datos de la base de datos 
                    obj.setIdHistoricoIMC(rs.getInt("IdHistoricoIMC"));
                    obj.setPeso(rs.getString("Peso"));
                    obj.setEstatura(rs.getString("Estatura"));
                    obj.setEdad(rs.getString("Edad"));
                    obj.setImc(rs.getString("IMC"));
                    obj.setIdUsuario(rs.getString("IdUsuario"));
                    obj.setIdDescripcion(rs.getString("IdDescripcionIMC"));
                    obj.setCreate(rs.getString("Create"));

                    listar.add(obj);
                }
               return listar;
            }

        } catch (SQLException e) {
            System.out.println("Error listar historico IMC: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("Error listar historico IMC: " + e);
            }
        }
        return null;
    }
}
