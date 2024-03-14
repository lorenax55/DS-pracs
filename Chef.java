public class Chef {
    private RecetaBuilder recetaBuilder;

    public void setRecetaBuilder(RecetaBuilder rb) {
        recetaBuilder = rb;
    }

    public Receta getReceta() {
        return recetaBuilder.getReceta();
    }
    public void BuildReceta() {
        recetaBuilder.BuildIngredientes();
        recetaBuilder.BuildPasos();
        recetaBuilder.BuildTiempo();
    }
}
