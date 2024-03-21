package isp1;

import java.util.logging.Level;
import java.util.logging.Logger;

public class Competicion extends Thread{
    
    public Carrera carrera;
    
    
    public Competicion crearCompeticion(Carrera carrera){
        this.carrera = carrera;
        return this; 
    };
    
    @Override
    public void run(){
        System.out.println("Empieza la carrera de " + carrera.getModalidad());
        carrera.quitarBicis();
        try {
            this.sleep(30000);   //60 segundos ( lo que tarda la carrera)
        } catch (InterruptedException ex) {
            Logger.getLogger(Competicion.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Se han quitado bicicletas de la carrera de " + carrera.getModalidad() + ", las bicicletas que quedan son: " + this.carrera.bicis.size());
        try {
            this.sleep(30000);   //60 segundos ( lo que tarda la carrera)
        } catch (InterruptedException ex) {
            Logger.getLogger(Competicion.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("La carrera ha terminado");
    
    }
}
