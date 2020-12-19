
package juego;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GestionBaseDeDatos {
  
    private  Connection conexion=null;
    private Statement stmt=null;

 

    public String consultaPregunta(int i) throws SQLException {

        conexion = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/juego",
                "root", "");
        stmt = conexion.createStatement();
        String strSelect = "select pregunta.pregunta from pregunta where pregunta.idPregunta =" + i;    
        ResultSet rset = stmt.executeQuery(strSelect);
        rset.next();
        return rset.getString(1);
    }

    public ResultSet consultaRespuesta(int i) throws SQLException {

        conexion = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/juego",
                "root", "");
        stmt = conexion.createStatement();
       
        return stmt.executeQuery("select respuesta.respuesta from respuesta where respuesta.pregunta_idPregunta =" + i);

    }
    
    

            
    public ResultSet consultaRespuestaCorrecta(String textoBoton,int idpregunta) throws SQLException {
       
            conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/juego",
                    "root", "");
            stmt = conexion.createStatement();
            return stmt.executeQuery(" SELECT respuesta.verdadera FROM respuesta WHERE "
                    + "respuesta.respuesta="+ "'"+textoBoton+"'"
                    +"AND respuesta.pregunta_idPregunta ="+ idpregunta);
      

    }
    public ResultSet consultaPuntuaciones(int dificil) throws SQLException{
     conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/juego",
                    "root", "");
            stmt = conexion.createStatement();
            return stmt.executeQuery(" SELECT puntuacion.puntuacion, puntuacion.nombre"
                    + " FROM puntuacion WHERE puntuacion.dificil ="+dificil+ " ORDER BY puntuacion.puntuacion DESC");
  
    }

    public ResultSet consultarPuntuacinesPorRango(int puntuacion, int dificil) throws SQLException {
        conexion = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/juego",
                "root", "");
        stmt = conexion.createStatement();
        return stmt.executeQuery("  SELECT puntuacion.nombre, puntuacion.puntuacion FROM puntuacion WHERE puntuacion.puntuacion >= " + puntuacion
                + " AND puntuacion.dificil= " + dificil);

    }
   
    
    
            
    public void insertarPuntuaciones(String nombre, int dificil, int puntuacion) throws SQLException {
        conexion = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/juego",
                "root", "");
        stmt = conexion.createStatement();
        stmt.executeUpdate("INSERT INTO puntuacion ( puntuacion.idPuntuacion, puntuacion.puntuacion, puntuacion.nombre, puntuacion.dificil) VALUES (NULL, '" + puntuacion + "', '" + nombre + "', '" + dificil + "')");

    }
                
    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }
    public Connection getConexion() {
        return conexion;
    }

    public Statement getStmt() {
        return stmt;
    }

    public void setStmt(Statement stmt) {
        this.stmt = stmt;
    }
    
}
