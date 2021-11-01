/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import DAO.UsuarioDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Einer
 */
public class Usuario extends Conexion{
    String consulta = null;
    private PreparedStatement pst;
    private ResultSet rs;
    
    public UsuarioDAO autenticarUsuario(UsuarioDAO obj) {
        try {
           // consulta = "Select * from login a JOIN usuarios b ON a.idLogin = b.idLogin JOIN rol c ON b.idRol = c.idRol where a.usuario = ? and a.contrasenia = ? AND b.activo = 1 AND c.activo = 1";
            consulta = "{CALL loginUsuario(?,?)}";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, obj.getUsuario());
            pst.setString(2, obj.getContrasenia());
            rs = pst.executeQuery();

            if (rs.absolute(1)) {
                rs.beforeFirst();

                while (rs.next()) {
                    obj = new UsuarioDAO();
                    //Obtiene los datos de la base de datos        
                    obj.setIdUsuario(rs.getString("IdUsuarios"));
                    obj.setIdentificacion(rs.getString("Identificacion"));
                    obj.setNombre(rs.getString("Nombre"));
                    obj.setApellido(rs.getString("Apellido"));
                    obj.setEdad(rs.getString("Edad"));
                    obj.setEstatura(rs.getString("Estatura"));
                    obj.setPeso(rs.getString("Peso"));
                    obj.setCorreo(rs.getString("Correo"));
                    obj.setCelular(rs.getString("Celular"));
                    obj.setRol(rs.getString("Rol"));
                    return obj;
                }
               return null;
            }

        } catch (SQLException e) {
            System.out.println("Error autenticacionUsuario: " + e);
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
                System.out.println("Error autenticacionUsuario: " + e);
            }
        }
        return null;
    }
    
     public boolean registrarUsuario(UsuarioDAO obj) {
        try {
            //consulta = "{CALL registrarUsuarioo(?,?,?,?,?,?,?,?,?)}";
            consulta = "INSERT INTO usuarios (Identificacion, Nombre, Apellido, Correo, Celular, Edad, Estatura, Peso, IdRol)"+
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";

            pst = getConexion().prepareStatement(consulta);
            //Primer insert
            pst.setString(1, obj.getIdentificacion());
            pst.setString(2, obj.getNombre());
            pst.setString(3, obj.getApellido());
            pst.setString(4, obj.getCorreo());
            pst.setString(5, obj.getCelular());
            pst.setString(6, obj.getEdad());
            pst.setString(7, obj.getEstatura());
            pst.setString(8, obj.getPeso());
            pst.setString(9, "4");
            //Segundo insert
           // pst.setString(9, obj.getIdentificacion());
           // pst.setString(10, obj.getContrasenia());
            if (pst.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error registroUsuario: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                System.out.println("Error registroUsuario: " + e);
            }
        }
        return false;
    }
         
     public boolean crearLogin(UsuarioDAO obj) {
        try {
            //consulta = "{CALL registrarUsuarioo(?,?,?,?,?,?,?,?,?)}";
            consulta =  "INSERT INTO login (Usuario, Contrasenia)" +
                        "VALUES (?, ?);";
            pst = getConexion().prepareStatement(consulta);
            //Primer insert
            pst.setString(1, obj.getIdentificacion());
            pst.setString(2, obj.getContrasenia());

            if (pst.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error crear login: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                System.out.println("Error crear login:: " + e);
            }
        }
        return false;
    }

     public boolean actualizarUsuario(UsuarioDAO obj) {
        try {
            //consulta = "{CALL registrarUsuarioo(?,?,?,?,?,?,?,?,?)}";
            consulta = "UPDATE usuarios "+
                       "SET Correo = ?, Celular = ?, Edad = ?, Estatura = ?, Peso = ? " +
                       "WHERE IdUsuarios = ? and Identificacion = ?";
            
//                       "INSERT INTO login (Usuario, Contrasenia)" +
//                       "VALUES (?, ?);";
            pst = getConexion().prepareStatement(consulta);
            //Primer insert
            pst.setString(1, obj.getCorreo());
            pst.setString(2, obj.getCelular());
            pst.setString(3, obj.getEdad());
            pst.setString(4, obj.getEstatura());
            pst.setString(5, obj.getPeso());
            pst.setString(6, obj.getIdUsuario());
            pst.setString(7, obj.getIdentificacion());
   
            if (pst.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error Actualizar Usuario: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                System.out.println("Error Actualizar Usuario: " + e);
            }
        }
        return false;
    }
     
     public ArrayList<UsuarioDAO> listarUsuarios() {
        try {
           // consulta = "Select * from login a JOIN usuarios b ON a.idLogin = b.idLogin JOIN rol c ON b.idRol = c.idRol where a.usuario = ? and a.contrasenia = ? AND b.activo = 1 AND c.activo = 1";
            consulta = "SELECT a.*, b.Rol FROM usuarios a JOIN rol b ON a.IdRol = b.IdRol";
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();

            if (rs.absolute(1)) {
                rs.beforeFirst();
                
                ArrayList<UsuarioDAO> listar = new ArrayList();
                
                while (rs.next()) {
                    UsuarioDAO obj = new UsuarioDAO();
                    //Obtiene los datos de la base de datos        
                    obj.setIdUsuario(rs.getString("IdUsuarios"));
                    obj.setIdentificacion(rs.getString("Identificacion"));
                    obj.setNombre(rs.getString("Nombre"));
                    obj.setApellido(rs.getString("Apellido"));
                    obj.setEdad(rs.getString("Edad"));
                    obj.setEstatura(rs.getString("Estatura"));
                    obj.setPeso(rs.getString("Peso"));
                    obj.setCorreo(rs.getString("Correo"));
                    obj.setCelular(rs.getString("Celular"));
                    obj.setRol(rs.getString("Rol"));
                    obj.setActivo(rs.getString("Activo"));
                    obj.setCreate(rs.getString("Create"));
                    listar.add(obj);
                }
               return listar;
            }

        } catch (SQLException e) {
            System.out.println("Error Listar Usuario: " + e);
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
                System.out.println("Error Listar Usuario: " + e);
            }
        }
        return null;
    }
     
     public UsuarioDAO listarUsuarioIdIdentificacion(UsuarioDAO obj) {
        try {
           // consulta = "Select * from login a JOIN usuarios b ON a.idLogin = b.idLogin JOIN rol c ON b.idRol = c.idRol where a.usuario = ? and a.contrasenia = ? AND b.activo = 1 AND c.activo = 1";
            consulta = "SELECT * FROM usuarios b JOIN rol c ON b.IdRol = c.IdRol " +
                       "WHERE b.IdUsuarios = ? or b.Identificacion = ? AND b.Activo = 1 AND c.Activo = 1";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, obj.getIdUsuario());
            pst.setString(2, obj.getIdentificacion());
            rs = pst.executeQuery();

            if (rs.absolute(1)) {
                rs.beforeFirst();

                while (rs.next()) {
                    obj = new UsuarioDAO();
                    //Obtiene los datos de la base de datos        
                    obj.setIdUsuario(rs.getString("IdUsuarios"));
                    obj.setIdentificacion(rs.getString("Identificacion"));
                    obj.setNombre(rs.getString("Nombre"));
                    obj.setApellido(rs.getString("Apellido"));
                    obj.setEdad(rs.getString("Edad"));
                    obj.setEstatura(rs.getString("Estatura"));
                    obj.setPeso(rs.getString("Peso"));
                    obj.setCorreo(rs.getString("Correo"));
                    obj.setCelular(rs.getString("Celular"));
                    obj.setRol(rs.getString("Rol"));
                    return obj;
                }
               return null;
            }

        } catch (SQLException e) {
            System.out.println("Error Datos ID Identificacion Usuario: " + e);
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
                System.out.println("Error Datos ID Identificacion Usuario: " + e);
            }
        }
        return null;
    }
    
}
