package isp1;

import java.util.Iterator;
import java.util.Arrays;
import java.util.Scanner;

public class Main extends Thread{

    
    public static void main(String[] args) throws InterruptedException {
        
        Scanner entrada = new Scanner(System.in);   //System.in para indicar que entran datos desde teclado.
        int numbicis = 0;
        
        System.out.println("Indica el numero de bicis que participan en la carrera de montaña: ");
        numbicis = entrada.nextInt();
        
        //System.out.println("Numero de bicis por parametro: " + numbicis);
        
        //Creo las factorias encargadas de crear tanto las bicicletas como las carreras de cada tipo
        FactoriaCarretera factoriacarretera = new FactoriaCarretera();
        FactoriaMontana factoriamontana = new FactoriaMontana();
        
        Carrera carreraCarretera;
        Carrera carreraMontana;
        
        carreraMontana = factoriamontana.crearCarrera();
        carreraCarretera = factoriacarretera.crearCarrera();
        
        //Crear el numero de bicicletas que nos dan para la carrera de montaña
        for(int i = 0; i < numbicis; i++){
            Bicicleta bicimontana = factoriamontana.crearBicicleta();
            Bicicleta bicicarretera = factoriacarretera.crearBicicleta();
            //System.out.println("Bicicleta: " + bicicarretera.ID + " Creada");
            carreraMontana.bicis.add(bicimontana);
            carreraCarretera.bicis.add(bicicarretera);
        }
        System.out.println("Bicicletas asignadas a cada carrera");
        //Para determinar que cada carrera se ejecute en un hilo necesito heredar de la clase thread por lo que le asigno una carrera a cada hilo.
        Competicion hilo1 = new Competicion();
        hilo1.crearCompeticion(carreraMontana);
        
        Competicion hilo2 = new Competicion();
        hilo2.crearCompeticion(carreraCarretera);
        
        //System.out.println("Empieza la carrera de:");
        hilo1.start();
        hilo2.start();
        
        

        /*
        Bicicleta bici1;
        Bicicleta bici2;
        Bicicleta bici3;
        Bicicleta bici4;
        Bicicleta bici5;
        
        //Instaciar tanto las bicis como la carrera en la que participan
        bici1 = factoriacarretera.crearBicicleta();
        bici2 = factoriacarretera.crearBicicleta();
        bici3 = factoriacarretera.crearBicicleta();
        bici4 = factoriacarretera.crearBicicleta();
        bici5 = factoriacarretera.crearBicicleta();
        
        
        carreraCarretera.bicis.add(bici1);
        carreraCarretera.bicis.add(bici2);
        carreraCarretera.bicis.add(bici3);
        carreraCarretera.bicis.add(bici4);
    
        carreraMontana.bicis.add(bici1);
        carreraMontana.bicis.add(bici2);
        carreraMontana.bicis.add(bici3);
        carreraMontana.bicis.add(bici4);
        carreraMontana.bicis.add(bici5);
        */
        
        /*
        
        for(int i=0; i < carreraCarretera.bicis.size(); i++){
            System.out.println("Id de la bicicleta: " + carreraCarretera.getBici(i).ID);
        }
        
        System.out.println("numero de bicis: " + carreraMontana.bicis.toString());
        carreraCarretera.quitarBicis();
        System.out.println("numero de bicis: " + carreraMontana.bicis.toString());
        */
    }
/*
    public void run(Carrera carrera) throws InterruptedException{
        this.competicion(carrera);
        
    }
    
    public void competicion(Carrera carrera) throws InterruptedException{
        System.out.println("Empieza la carrera de: ");
        carrera.quitarBicis();
       // this.wait(5000);
        System.out.println("La carrera ha terminado");
        
    }
    */
    
}
