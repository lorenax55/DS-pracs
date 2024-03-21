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
public class FactoriaMontana implements FactoriaCarreraYBicicleta{
    
    @Override
    public Carrera crearCarrera(){
        return new CarreraMontana();
    };
    
    @Override
    public Bicicleta crearBicicleta(){
        BicicletaMontana bici = new BicicletaMontana();
        Random r = new Random();
        bici.ID = r.nextInt();
        
        return bici;
    }
    
}
