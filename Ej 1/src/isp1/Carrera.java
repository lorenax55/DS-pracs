
package isp1;
import java.util.ArrayList;

/**
 *
 * @author joy11
 */
public abstract class Carrera {
    int tiempo = 60;
    ArrayList<Bicicleta> bicis = new ArrayList();
    String modalidad;

    public String getModalidad(){
        return modalidad;
    };
    
    public Bicicleta getBici(int numBici){
        return bicis.get(numBici);
    }
    
    public void quitarBicis(){};
    
}
