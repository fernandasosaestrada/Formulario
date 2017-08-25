  /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;
import java.sql.ResultSet;
/**
 *
 * @author VictoRezbeck
 */
public class claseDelUsuario {
    
    private String _nombrec = "";
    private boolean _valido = false;
    private String _error = "";
    private int _idUsr = 0;
    private String _nombre="";
    private String _app="";
    private String _apm="";
    private String _esc="";
    private int _gen=0;
  
    public claseDelUsuario()
    {
        
    }
    
  

    public claseDelUsuario(String Nombre, String ApellidoPaterno){
        
        laBaseDeDatos.claseDeLaBase sql = new laBaseDeDatos.claseDeLaBase();
       
        try {
            sql.conectar();
            ResultSet rsValidaUsuario = sql.consulta("call spValidaUsuario('" + Nombre + "','" + ApellidoPaterno + "');");
            if(rsValidaUsuario.next()){
                int idper = Integer.parseInt(rsValidaUsuario.getString("idusu"));
                if(idper> 0 ){
                    this._idUsr = idper;
                    this._valido = true;
                    this._error = rsValidaUsuario.getString("msj");
                    this._nombrec = rsValidaUsuario.getString("NombreC");
                }
            }
            sql.cierraConexion();
        }
        catch(Exception laExcepcion){
            this._error = laExcepcion.getMessage();
            this._valido = false;
            this._idUsr = 0;
        }
    }
    
    public boolean validarbien(){
        return this._valido;
    }
    
    
      
    public String ERROR() {
        return this._error;
    }

    
    public boolean validaUsr(){
        if(this._idUsr == 1){
            this._valido = true;
            this._error = "INICIO DE SESION CORRECTO";
        }
        else{
            this._error = "NO SE INICIO LA SESION CORRECTAMENTE"; 

        }   
        return this._valido;
    }
    
    public boolean RgistraUSR(String Nombre, String ApellidoPaterno, String ApellidoMaterno, String Escuela, int Genero) {

       laBaseDeDatos.claseDeLaBase conex= new laBaseDeDatos.claseDeLaBase();

        try {
            conex.conectar();

            ResultSet rsguarda = conex.consulta("call spGuardaCliente(0, '" + Nombre + "', '"+ApellidoPaterno+"', '"+ApellidoMaterno+"', '"+Escuela+"','"+Genero+"');");

            if (rsguarda.next()) {

                if (rsguarda.getString("msj").equals("Cliente guardado con exito")) {

                    int rgesoDelSP = Integer.parseInt(rsguarda.getString("idusu"));
                    this._idUsr = rgesoDelSP;
                    this._error = rsguarda.getString("msj");
                    this._nombrec = rsguarda.getString("NombreC");
                }
            }

        } catch (Exception xxxxD) {

        }
        if (this._idUsr > 0) {
            this._valido = true;
        }

        return this._valido;
    }
    public int IDUSR(){
        return this._idUsr;
    }
}
    