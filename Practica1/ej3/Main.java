public class Main {
    public static void main(String[] args) {

        Chef chef = new Chef();

        RecetaBuilder recetaBuilder = new TortillaRecetaBuilder();
        chef.setRecetaBuilder(recetaBuilder);
        chef.BuildReceta();
        Receta receta = chef.getReceta();

        System.out.println("\nReceta de la tortilla:");
        System.out.println("Ingredientes: " + receta.getIngredientes());
        System.out.println("Pasos: " + receta.getPasos());
        System.out.println("Tiempo de preparación: " + receta.getTiempoPreparacion() + " minutos");
        
        recetaBuilder = new CroquetaRecetaBuilder();
        chef.setRecetaBuilder(recetaBuilder);
        chef.BuildReceta();
        receta = chef.getReceta();

        System.out.println("\nReceta de las croquetas:");
        System.out.println("Ingredientes: " + receta.getIngredientes());
        System.out.println("Pasos: " + receta.getPasos());
        System.out.println("Tiempo de preparación: " + receta.getTiempoPreparacion() + " minutos\n");
    }
}
