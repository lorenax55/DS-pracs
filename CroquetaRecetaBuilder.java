public class CroquetaRecetaBuilder extends RecetaBuilder{
    public CroquetaRecetaBuilder() {
        super.receta = new Receta();
    }

    @Override
    public void BuildIngredientes() {
        receta.setIngredientes("Harina, leche, huevo, jamón, sal, aceite");
    }

    @Override
    public void BuildPasos() {
        receta.setPasos("Mezclar la harina, la leche y el huevo para hacer la masa. Añadir el jamón y la sal a la masa. Freír la masa en aceite caliente hasta que estén doradas.");
    }

    @Override
    public void BuildTiempo() {
        receta.setTiempoPreparacion(45);
    }
}
