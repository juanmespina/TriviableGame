
package juego;

import java.awt.Color;
import java.awt.Font;
import javax.swing.JButton;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;

public class Boton extends JButton {

    Boton(String texto) {
        super(texto);
        Color azul = new Color(101, 89, 156);
        setBackground(azul);
        setForeground(Color.white);
        Border line = new LineBorder(Color.BLACK);
        Border margin = new EmptyBorder(5, 15, 5, 15);
        Border compound = new CompoundBorder(line, margin);
        setBorder(compound);
        setFont(new Font("Comic Sans MS", Font.BOLD, 14));
    }
}
