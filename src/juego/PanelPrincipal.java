
package juego;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Toolkit;



import javax.swing.JPanel;


public class PanelPrincipal extends JPanel {

   private  final Image bgImage= Toolkit.getDefaultToolkit().getImage(getClass()
                    .getResource("img/pantallaPrincipal.jpg"));
   //1280x540 pixeles

    
    @Override
    public void paintComponent(Graphics g) {
        try{
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;  
        g2.drawImage(bgImage, 0, 0,getWidth() ,getHeight(),this);
        }catch(Exception ex){
        System.out.print(ex);
        }

            }
      
    
    


}
