package juego;

import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.Timer;

public class Motor {

    private GestionBaseDeDatos gbd;
    private int vidas;
    private int puntos;
    private int tiempo;
    private Timer timer, timer2;
    private Boton[] btnVentanaJuego;
    private VentanaJuego ventanaJuego;
    private int idpregunta;
    private Ventana ventanaPuntuaciones;
    private final ArrayList<Integer> idUsados;

    public Motor(VentanaJuego ventanaJuego) {
        gbd = new GestionBaseDeDatos();
        this.idpregunta = 0;
        this.btnVentanaJuego = new Boton[]{ventanaJuego.getR1(), ventanaJuego.getR2(), ventanaJuego.getR3(), ventanaJuego.getR4()};
        this.tiempo = 0;
        this.puntos = 0;
        this.vidas = 3;
        this.ventanaJuego = ventanaJuego;
        this.idUsados = new ArrayList();

        idUsados.add(0);
    }

    public void cargarDatos() {//Verifica dificultad para saber cuales preguntas cargar
        limpiar();
        if (VentanaJuego.getDificultad() == 0) {
            do {
                idpregunta = (int) (Math.random() * 20) + 1;
            } while (idUsados.contains(idpregunta) || idUsados.size() == 20);
            cargarDatosPorDificultad(0, idpregunta, 20);

        } else {
            do {
                idpregunta = (int) (21 + Math.random() * 20);
            } while (idUsados.contains(idpregunta) || idUsados.size() == 20);
            System.out.print(idpregunta);
            cargarDatosPorDificultad(1, idpregunta, 15);
        }

    }

    public void cargarDatosPorDificultad(int dificultad, int idpregunta, int tiempo) {
        cronometro();
        idUsados.add(idpregunta);
        if (getPuntos() == 15) {//Si llego a 15, resolví lo máximo permitido
            try {
                getTimer().stop();
                getTimer().removeActionListener(getTimer().getActionListeners()[0]);
                JOptionPane.showMessageDialog(ventanaJuego, "Lograste la puntuacion maxima de " + getPuntos() + " puntos", "Respondiste todas las preguntas!", JOptionPane.INFORMATION_MESSAGE);
                ingresarNombre();
                iniciarPuntuaciones();

            } catch (SQLException ex) {
                Logger.getLogger(Motor.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            buscarPregunta(idpregunta);
            setTiempo(tiempo);
        }
    }

    public void ingresarNombre() throws SQLException {
        
        String nombre = null;
        try {
            do {
                try {
                    nombre = JOptionPane.showInputDialog(ventanaJuego, "Introduce tú nombre", "Introduce tú nombre", JOptionPane.QUESTION_MESSAGE);

                } catch (HeadlessException ex) {
                    System.out.println(ex);
                }
               
            } while (nombre.length() == 0);
             gbd.insertarPuntuaciones(nombre, VentanaJuego.getDificultad(), getPuntos());
        } catch (Exception ex) {
            System.out.println(ex);
        }

    }

    public void buscarPregunta(int idpregunta) {
        try {

            int contador = 0;
            ventanaJuego.getPantallaPregunta().setText(gbd.consultaPregunta(idpregunta));

            ResultSet resultadoRespuestas = gbd.consultaRespuesta(idpregunta);

            while (resultadoRespuestas.next()) {
                btnVentanaJuego[contador].setText(resultadoRespuestas.getString(1));
                contador++;

            }

        } catch (SQLException ex) {
            System.out.println("ERROR BITCH2");
            Logger.getLogger(Motor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void comprobarRespuesta(JButton seleccionado, int idpregunta) throws SQLException {
        ResultSet rset = gbd.consultaRespuestaCorrecta(seleccionado.getText(), idpregunta);
        rset.next();
        int verdadero = rset.getInt(1);
        getTimer().removeActionListener(getTimer().getActionListeners()[0]);
        if (verdadero == 1) {

            JOptionPane.showMessageDialog(ventanaJuego, "Respuesta Correcta", "Correcto", JOptionPane.INFORMATION_MESSAGE);
            puntos++;
            getVentanaJuego().getPantallaPuntuacion().setText("" + puntos + "");
            cargarDatos();
        } else {    
            JOptionPane.showMessageDialog(ventanaJuego, "Respuesta Incorrecta", "Incorrecto", JOptionPane.ERROR_MESSAGE);
            vidas--;
            getVentanaJuego().getPantallaVida().setText("" + vidas + "");
            if (vidas == 0) {

                JOptionPane.showMessageDialog(ventanaJuego, "Fin de la partida", "Te quedaste sin vidas", JOptionPane.ERROR_MESSAGE);
                ingresarNombre();
                ventanaJuego.setVisible(false);
                iniciarPuntuaciones();
            } else {

                cargarDatos();

            }

        }

    }

    public void cronometro() {//El cronometro del juego

        timer = new Timer(1000, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                getVentanaJuego().getReloj().setText("'" + getTiempo() + "'");
                if (getTiempo() == 0) {
                    vidas--;
                    getTimer().removeActionListener(getTimer().getActionListeners()[0]);
                    JOptionPane.showMessageDialog(ventanaJuego, "Tiempo expirado", "Tiempo expirado", JOptionPane.ERROR_MESSAGE);
                    cargarDatos();

                } else {
                    setTiempo(getTiempo() - 1);
                }

            }
        });
        timer.start();
    }

    public void limpiar() {//Limpia las pantallas y botones
        int contador = 0;
        while (btnVentanaJuego.length != contador) {
            btnVentanaJuego[contador].setText(" ");
            contador++;
        }
        ventanaJuego.getPantallaPregunta().setText(" ");
        ventanaJuego.getReloj().setText(" ");

    }

    public void iniciarPuntuaciones() throws SQLException {
        if (VentanaJuego.getDificultad() == 0) {
            this.ventanaPuntuaciones = new VentanaPuntuaciones("Puntuaciones: Nivel Fácil", 0);

        } else {
            this.ventanaPuntuaciones = new VentanaPuntuaciones("Puntuaciones: Nivel Dificil", 1);

        }
        ventanaPuntuaciones.setDefaultCloseOperation(Ventana.DISPOSE_ON_CLOSE);
        ventanaPuntuaciones.setLocation(10, 10);
        ventanaPuntuaciones.setVisible(true);
        ventanaPuntuaciones.setSize(400, 400);
        ventanaPuntuaciones.setResizable(false);
        ventanaPuntuaciones.toFront();
        ventanaJuego.setVisible(false);
        timer2 = new Timer(100, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (ventanaPuntuaciones.isShowing() == false) {
                    System.out.println("timer2");
                    VentanaJuego.setCerrar(true);
                    timer2.removeActionListener(this);
                }
            }
        });
        timer2.start();

    }

    public GestionBaseDeDatos getGbd() {
        return gbd;
    }

    public void setGbd(GestionBaseDeDatos gbd) {
        this.gbd = gbd;
    }

    public int getVidas() {
        return vidas;
    }

    public void setVidas(int vidas) {
        this.vidas = vidas;
    }

    public JButton[] getBtnVentanaJuego() {
        return btnVentanaJuego;
    }

    public int getIdpregunta() {
        return idpregunta;
    }

    public void setIdpregunta(int idpregunta) {
        this.idpregunta = idpregunta;
    }

    public int getTiempo() {
        return tiempo;
    }

    public void setTiempo(int tiempo) {
        this.tiempo = tiempo;
    }

    public Timer getTimer() {
        return timer;
    }

    public void setTimer(Timer timer) {
        this.timer = timer;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public VentanaJuego getVentanaJuego() {
        return ventanaJuego;
    }

    public void setVentanaJuego(VentanaJuego ventanaJuego) {
        this.ventanaJuego = ventanaJuego;
    }

}
