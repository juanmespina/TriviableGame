
package juego;


public class Juego {

    public static void main(String[] args) {
        VentanaInicio ventanaInicio= new VentanaInicio("Triviable");//Ventana Principal del juego
      
        ventanaInicio.setVisible(true);
        ventanaInicio.setSize(1500, 575);
        ventanaInicio.setResizable(true);
        ventanaInicio.setDefaultCloseOperation(VentanaInicio.EXIT_ON_CLOSE);
        ventanaInicio.agregarComponentes();
        
        
       
        
       
     
    }
    
}
