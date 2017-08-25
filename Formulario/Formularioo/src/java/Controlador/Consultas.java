/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Fernanda
 */
public class Consultas extends Conexion{
    
   
    
    public boolean registrar(int Id_Usuario, String Nombre, String ApellidoPaterno, String ApellidoMaterno, String Escuela, int Genero){
        
        PreparedStatement pst= null;
        
        try {
            String consulta="Insert into Cliente (Id_Usuario, Nombre, ApellidoPaterno, ApellidoMaterno, Escuela, Genero ) values (?, ?, ?, ?, ?, ?)";
            pst= getConexion().prepareStatement(consulta);
            pst.setInt(1, Id_Usuario);
            pst.setString(2, Nombre);
            pst.setString(3, ApellidoPaterno);
            pst.setString(4, ApellidoMaterno);
            pst.setString(9, Escuela);
            pst.setInt(10, Genero);
            
            if(pst.executeUpdate()== 1)
            {
                return true;
            }    
        } catch (Exception ex) {
            System.err.println("Error" + ex);
        }finally {
            try {
                if(getConexion()!= null) getConexion().close();
                if(pst != null) pst.close();
            } catch (Exception e) {
                System.err.println("Error" + e);
            }
        }
        
        return false;
        
    }
   
   
    
}
