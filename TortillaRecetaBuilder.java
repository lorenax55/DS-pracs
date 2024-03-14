
public class TortillaRecetaBuilder extends RecetaBuilder{
    public TortillaRecetaBuilder() {
        super.receta = new Receta();
    }

    @Override
    public void BuildIngredientes() {
        receta.setIngredientes("Huevos, patatas, cebolla, sal, aceite");
    }

    @Override
    public void BuildPasos() {
        receta.setPasos("Pelar y cortar las patatas y la cebolla. Batir los huevos y mezclar con las patatas y la cebolla. Freír en una sartén con aceite caliente.");
    }

    @Override
    public void BuildTiempo() {
        receta.setTiempoPreparacion(30);
       }
}
