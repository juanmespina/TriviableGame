/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package juego;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Toolkit;
import javax.swing.JPanel;

/**
 *
 * @author Juan Manuel
 */
public class PanelTutorial extends JPanel{
     private  final Image bgImage= Toolkit.getDefaultToolkit().getImage(getClass()
                    .getResource("img/ventanaTutorial.jpg"));
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
