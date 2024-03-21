/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package isp1;

/**
 *
 * @author joy11
 */
public class CarreraCarretera extends Carrera{
    String modalidad = "carretera";
    
    @Override
    public String getModalidad(){
        return modalidad;
    }
    
    public int getnumBicis(){
        return this.bicis.size();
    }
    
    @Override
    public void quitarBicis(){
        int numBicis = this.getnumBicis();
        double quitar = (numBicis * 10)/100; //El 10 % de las bicicletas de montaña se quitaran en la carrera
        //System.out.println("Numero de bicis a quitar: " + quitar);
        for(int i=0; i < quitar; i++){
            this.bicis.remove(i);
        }
    }
    
    
}
