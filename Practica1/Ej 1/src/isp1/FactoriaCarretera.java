/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package isp1;
import java.util.Random;

/**
 *
 * @author joy11
 */
public class FactoriaCarretera implements FactoriaCarreraYBicicleta {
    
    @Override
    public Carrera crearCarrera(){
        return new CarreraCarretera();
    };
    
    @Override
    public Bicicleta crearBicicleta(){
        BicicletaCarretera bici = new BicicletaCarretera();
        Random r = new Random();
        bici.ID = r.nextInt();
        
        return bici;
    };
    
}
