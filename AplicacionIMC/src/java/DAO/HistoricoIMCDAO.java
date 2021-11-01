package DAO;

/**
 *
 * @author Einer
 */
public class HistoricoIMCDAO {

    private int idHistoricoIMC;
    private String peso;
    private String estatura;
    private String edad;
    private String imc;
    private String idUsuario;
    private String idDescripcion;
    private String create;

    public HistoricoIMCDAO() {
    }

    public int getIdHistoricoIMC() {
        return idHistoricoIMC;
    }

    public void setIdHistoricoIMC(int idHistoricoIMC) {
        this.idHistoricoIMC = idHistoricoIMC;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public String getEstatura() {
        return estatura;
    }

    public void setEstatura(String estatura) {
        this.estatura = estatura;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public String getImc() {
        return imc;
    }

    public void setImc(String imc) {
        this.imc = imc;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getIdDescripcion() {
        return idDescripcion;
    }

    public void setIdDescripcion(String idDescripcion) {
        this.idDescripcion = idDescripcion;
    }

    public String getCreate() {
        return create;
    }

    public void setCreate(String create) {
        this.create = create;
    }

}
