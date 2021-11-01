
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Einer
 */
public class Conexion {

    //Creacion de variables para la Conexion
    private final String USERNAME = "root";
    private final String PASSWORD = "root";
    private final String HOST = "localhost:";
    private final String PORT = "3306/";
    private final String NOMBREDATABASE = "base_imc";
    //Sirve para el error de hora:  ?useTimezone=true&serverTimezone=UTC
    private final String TIMEZONE = "?useTimezone=true&serverTimezone=UTC";
    //Sirve para el error de SSL: &useSSL=false
    private final String SSL = "&useSSL=false";
    private final String DATABASE = NOMBREDATABASE + TIMEZONE + SSL;
    private final String CLASSNAME = "com.mysql.jdbc.Driver";
    private Connection con;

    //Constructor de la clase Conexion
    public Connection getConexion() {
        con = null;

        String URL = "jdbc:mysql://" + HOST + PORT + DATABASE;
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            if (con != null) {
                //System.out.println("Conexion establecida");
            }
        } catch (ClassNotFoundException e) {
            //Errores de Conexion
            System.out.println("Error Conexion: " + e);
            return null;
        } catch (SQLException e) {
            //Errores de ingresar buscar actualizar.... BD
            System.out.println("Error Sentencias MYSQL: " + e);
            return null;
        }
        return con;
    }
   /*
    public static void main(String[] args) {
        Conexion con = new Conexion();
        con.getConexion();
    }
   */
}
